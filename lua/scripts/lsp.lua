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
    ensure_installed = { "lua_ls", "rust_analyzer" },
    handlers = {
        function(server_name)
            capabilities = require("cmp_nvim_lsp").default_capabilities()
            require("lspconfig")[server_name].setup({
                capabilites = capabilities,
                flags = {
                    debounce_text_changes = 150,
                },
                settings = {
                    ["rust-analyzer"] = {
                        completion = {
                            postfix = {
                                enable = false,
                            },
                        },
                        cargo = {
                            features = "all",
                            allFeatures = true,
                        },
                    },
                },
            })
        end },
})

local luasnip = require("luasnip")

local cmp = require('cmp')
cmp.setup ({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
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
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "treesitter" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "crates" },
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

luasnip.setup()
