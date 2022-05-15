require 'fzf-lua'.setup {
    winopts = {
        -- Only valid when using a float window
        -- (i.e. when 'split' is not defined, default)
        height     = 0.85, -- window height
        width      = 0.80, -- window width
        row        = 0.35, -- window row position (0=top, 1=bottom)
        col        = 0.50, -- window col position (0=left, 1=right)
        hl         = {
            normal      = 'Normal', -- window normal color (fg+bg)
            border      = 'IndentBlanklineChar', -- border color (try 'FloatBorder')
            -- Only valid with the builtin previewer:
            cursor      = 'CursorColumn', -- cursor highlight (grep/LSP matches)
            cursorline  = 'CursorLine', -- cursor line
            search      = 'Search', -- search matches (ctags)
            title       = 'Normal', -- preview border title (file/buffer)
            scrollbar_f = 'PmenuThumb', -- scrollbar "full" section highlight
            scrollbar_e = 'PmenuSbar', -- scrollbar "empty" section highlight
        },
        preview    = {
            vertical     = 'up:45%', -- up|down:size
            horizontal   = 'right:60%', -- right|left:size
            title        = false, -- preview border title (file/buf)?
        },
    },
    fzf_opts = {
        ['--layout'] = false,
    },
    -- fzf '--color=' options (optional)
    fzf_colors = {
      --[[ ["fg"]          = { "fg", "CursorLine" },
      ["bg"]          = { "bg", "Normal" },
      ["hl"]          = { "fg", "Comment" },
      ["fg+"]         = { "fg", "Normal" },
      ["bg+"]         = { "bg", "CursorLine" },
      ["hl+"]         = { "fg", "Statement" },
      ["info"]        = { "fg", "PreProc" },
      ["prompt"]      = { "fg", "Conditional" },
      ["pointer"]     = { "fg", "Exception" },
      ["marker"]      = { "fg", "Keyword" },
      ["spinner"]     = { "fg", "Label" },
      ["header"]      = { "fg", "Comment" }, ]]
      ["gutter"]      = { "bg", "CursorColumn" },
  },
}
