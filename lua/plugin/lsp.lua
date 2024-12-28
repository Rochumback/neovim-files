return {

    "hrsh7th/nvim-cmp",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        {
            "saghen/blink.cmp",
            dependencies = { 'rafamadriz/friendly-snippets', },
        },
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
    },

    config = function()
        local border = {
            { '┌', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '┐', 'FloatBorder' },
            { '│', 'FloatBorder' },
            { '┘', 'FloatBorder' },
            { '─', 'FloatBorder' },
            { '└', 'FloatBorder' },
            { '│', 'FloatBorder' },
        }
        local handlers = {
            ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
            ['textDocument/signature_help'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
        }
        require("mason").setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer", "jdtls" },
            handlers = {
                ["rust_analyzer"] = function() end,
                function(server_name)
                    local capabilities = require("blink.cmp").get_lsp_capabilities(capatilities)
                    require("lspconfig")[server_name].setup({
                        handlers = handlers,
                        capabilites = capabilities,
                        flags = {
                            debounce_text_changes = 150,
                        },
                    })
                end
            },
        })

        require("blink.cmp").setup({
            keymap = { preset = 'enter' },
            completion = {
                menu = { border = "single" },
                documentation = { border = "single" },
                ghost_text = { enabled = true },
            },
            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "treesitter", },
            },
            signature = {
                enabled = true,
                window = { border = "single" }
            },
            opts_extend = { "sources.default" }
        })
    end
}
--         local cmp = require('cmp')
--         cmp.setup({
--             mapping = cmp.mapping.preset.insert({
--                 ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
--                 ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
--                 -- C-b (back) C-f (forward) for snippet placeholder navigation.
--                 ['<C-Space>'] = cmp.mapping.complete(),
--                 ['<CR>'] = cmp.mapping.confirm {
--                     behavior = cmp.ConfirmBehavior.Replace,
--                     select = true,
--                 },
--                 ['<Tab>'] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_next_item()
--                     else
--                         fallback()
--                     end
--                 end, { 'i', 's' }),
--                 ['<S-Tab>'] = cmp.mapping(function(fallback)
--                     if cmp.visible() then
--                         cmp.select_prev_item()
--                     else
--                         fallback()
--                     end
--                 end, { 'i', 's' }),
--             }),
--             sources = {
--                 { name = "nvim_lua" },
--                 { name = "nvim_lsp" },
--                 { name = "treesitter" },
--                 { name = "path" },
--                 { name = "buffer" },
--                 { name = 'nvim_lsp_signature_help' }
--             },
--             window = {
--                 completion = cmp.config.window.bordered({
--                     max_width = 80,
--                 }),
--                 documentation = cmp.config.window.bordered(),
--             },
--             experimental = {
--                 ghost_text = true,
--             },
--         })
--     end,
-- }
