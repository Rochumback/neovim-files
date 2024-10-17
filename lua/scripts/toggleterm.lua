require("toggleterm").setup({
    size = 20 or function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,

    shade_terminals = true,
    shading_factor = 20,
    insert_mappings = true,
    persist_size = true,
    persist_mode = true,
    auto_scroll = true,
    float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'curved',  
    -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    winblend = 0,
    title_pos = 'center'
  },
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  },
})
