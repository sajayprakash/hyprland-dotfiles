-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    -- Themes
    use { "catppuccin/nvim", as = "catppuccin" }
    use('folke/tokyonight.nvim')
    use('sainnhe/everforest')
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        config = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    -- LSP Support
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'jose-elias-alvarez/null-ls.nvim' },
            { 'MunifTanjim/prettier.nvim' },
        }
    }
    use {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    }
    use('norcalli/nvim-colorizer.lua')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use('christoomey/vim-tmux-navigator')
end)
