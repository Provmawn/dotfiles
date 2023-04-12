return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use 'ms-jpq/coq_nvim'
    --use 'ms-jpq/coq.artifacts'

    use 'glepnir/indent-guides.nvim'

    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    use 'ryanoasis/vim-devicons'

    use 'nvim-tree/nvim-tree.lua'

    use 'alec-gibson/nvim-tetris'

    use 'nvim-treesitter/nvim-treesitter'

    use 'epwalsh/obsidian.nvim'

    use 'folke/tokyonight.nvim'

    use 'kdheepak/lazygit.nvim'
end)
