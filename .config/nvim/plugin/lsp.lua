-- :h lspconfig-all
-- Setup language servers.
local lspconfig = require('lspconfig')

vim.cmd[[let g:coq_settings = { 'auto_start': v:true }]]
local coq = require('coq')

lspconfig.pyright.setup {}
lspconfig.pyright.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.tsserver.setup {}
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.gopls.setup {}
lspconfig.gopls.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.dockerls.setup {}
lspconfig.dockerls.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.volar.setup {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}
lspconfig.volar.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.docker_compose_language_service.setup {}
lspconfig.docker_compose_language_service.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.svelte.setup{}
lspconfig.svelte.setup(coq.lsp_ensure_capabilities()) -- after

lspconfig.terraformls.setup{}
lspconfig.terraformls.setup(coq.lsp_ensure_capabilities()) -- after

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
