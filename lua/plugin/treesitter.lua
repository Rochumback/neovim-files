return {

    'nvim-treesitter/nvim-treesitter',

    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "javascript", "java" },
            sync_install = false,

            auto_install = true,

            ignore_install = {},

            ---- if you need to change the installation directory of the parsers (see -> advanced setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,

                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },

            setup = {
                indent = {
                    enable = true
                }
            }
        }
    end
}
-- vim.cmd("TSUpdate")
