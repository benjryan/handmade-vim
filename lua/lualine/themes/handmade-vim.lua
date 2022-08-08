local palette = {
    bg0 = { '#1d2021', '234' },
    bg1 = { '#282828', '235' },
    bg2 = { '#282828', '235' },
    bg3 = { '#3c3836', '237' },
    bg4 = { '#3c3836', '237' },
    bg5 = { '#504945', '239' },
    bg_statusline1 = {'#161616', '235'},
    bg_statusline2 = {'#262626', '235'},
    bg_statusline3 = {'#262626', '239'},
    bg_diff_green = {'#32361a', '22'},
    bg_visual_green = {'#333e34', '22'},
    bg_diff_red = {'#3c1f1e', '52'},
    bg_visual_red = {'#442e2d', '52'},
    bg_diff_blue = {'#0d3138', '17'},
    bg_visual_blue = {'#2e3b3b', '17'},
    bg_visual_yellow = {'#473c29', '94'},
    bg_current_word = {'#32302f', '236'},
    fg0 =             {'#ebdbb2',   '223'},
    fg1 =             {'#ebdbb2',   '223'},
    red =             {'#fb4934',   '167'},
    orange =          {'#fe8019',   '208'},
    yellow =          {'#fabd2f',   '214'},
    green =           {'#b8bb26',   '142'},
    aqua =            {'#8ec07c',   '108'},
    blue =            {'#83a598',   '109'},
    purple =          {'#d3869b',   '175'},
    bg_red =          {'#cc241d',   '124'},
    bg_green =        {'#b8bb26',   '106'},
    bg_yellow =       {'#fabd2f',   '172'},
    grey0 = {'#7c6f64', '243'},
    grey1 = {'#928374', '245'},
    grey2 = {'#a89984', '246'},
    none =  {'NONE', 'NONE'}
}

local theme
  theme = {
    normal = {
      a = {bg = palette.grey2[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    insert = {
      a = {bg = palette.bg_green[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    visual = {
      a = {bg = palette.bg_red[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    replace = {
      a = {bg = palette.bg_yellow[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    command = {
      a = {bg = palette.blue[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    terminal = {
      a = {bg = palette.purple[1], fg = palette.bg0[1], gui = 'bold'},
      b = {bg = palette.bg_statusline3[1], fg = palette.fg1[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.fg1[1]}
    },
    inactive = {
      a = {bg = palette.bg_statusline1[1], fg = palette.grey2[1]},
      b = {bg = palette.bg_statusline1[1], fg = palette.grey2[1]},
      c = {bg = palette.bg_statusline1[1], fg = palette.grey2[1]}
    }
  }
return theme
