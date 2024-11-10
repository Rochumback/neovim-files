return {

    "hrsh7th/nvim-cmp",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',

        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
    },

    config = function()
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
                -- ["rust_analyzer"] = function() end,
                function(server_name)
                    local capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require("lspconfig")[server_name].setup({
                        capabilites = capabilities,
                        flags = {
                            debounce_text_changes = 150,
                        },
                        settings = {
                            ["rust-analyzer"] = {
                                completion = {
                                    postfix = {
                                        enable = true,
                                    },
                                },
                                cargo = {
                                    features = "all",
                                    allFeatures = true,
                                },
                            },
                        },
                    })
                end
            },
        })


        local cmp = require('cmp')
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
                -- C-b (back) C-f (forward) for snippet placeholder navigation.
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = {
                { name = "nvim_lsp" },
                { name = "nvim_lua" },
                { name = "treesitter" },
                { name = "path" },
                -- { name = "buffer" },
            },
            window = {
                completion = cmp.config.window.bordered({
                    max_width = 80,
                }),
                documentation = cmp.config.window.bordered(),
            },
            experimental = {
                ghost_text = true,
            },
        })
    end,
}
