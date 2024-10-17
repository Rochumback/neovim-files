local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    },
    { "andweeb/presence.nvim" },
    { "nvim-tree/nvim-tree.lua" },
    { "rose-pine/neovim" },
    { "catppuccin/nvim",                  name = "catppuccin" },

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
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "Saecki/crates.nvim" },
    --LSP

    { 'nvim-treesitter/nvim-treesitter' },
    { "nvim-lualine/lualine.nvim" },
    { "akinsho/toggleterm.nvim" },


}

return plugins
