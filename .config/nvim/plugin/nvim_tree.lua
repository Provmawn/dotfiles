require("nvim-tree").setup({
    disable_netrw = true,
    hijack_netrw = true,
    sort_by = "case_sensitive",
    update_cwd = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
        number = true,
        relativenumber = true, 
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
