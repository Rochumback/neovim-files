local plugins = {

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    },
    { "akinsho/toggleterm.nvim" },
    { "ryanmsnyder/toggleterm-manager.nvim" },

    { "andweeb/presence.nvim" },
    { "nvim-tree/nvim-tree.lua" },

    --LSP
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },

    { "hrsh7th/nvim-cmp", },

    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "ray-x/cmp-treesitter" },


    { 'simrat39/rust-tools.nvim' },
    --LSP

    --DAP
    { "mfussenegger/nvim-dap" },
    --DAP

    { "rose-pine/neovim" },
    { "catppuccin/nvim",                    name = "catppuccin" },
    { "nvim-tree/nvim-web-devicons" },

    { "nvim-lualine/lualine.nvim" },
    -- { "arkav/lualine-lsp-progress" },
    { 'nvim-treesitter/nvim-treesitter' },
    { "windwp/nvim-autopairs" },
    { 'wakatime/vim-wakatime',              lazy = false }
}

return plugins
