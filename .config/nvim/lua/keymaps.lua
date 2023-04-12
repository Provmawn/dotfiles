function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<leader>n", ":NvimTreeToggle<cr>", {})
map("n", "<leader>ff", ":Telescope find_files<cr>", {})
map("n", "<leader>fg", ":Telescope live_grep<cr>", {})
