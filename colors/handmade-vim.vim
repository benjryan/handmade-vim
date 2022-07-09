set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "bryan-theme"

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" Colors

let s:back = ['#161616', 233]
"let s:default = ['#A08563', 137]
let s:default = ['#BD9F76', 137]

let s:margin = ["#262626", 235]
let s:margin_hover = ["#333333", 236]
let s:margin_active = ["#404040", 238]
"let s:cursor = ["#40FF40", 83]
let s:cursor = ["#35b132", 83]
let s:match = ["#057102", 83]
"let s:highlight = ["#703419", 58]
let s:highlight = ["#205020", 58]
let s:search = ["#333333", 58]
let s:at_highlight = ["#CDAA7D", 180]
let s:mark = ["#808080", 244]
let s:comment = ["#7D7D7D", 244]
let s:keyword = ["#CD950C", 172]
"let s:constant = ["#6B8E23", 64]
let s:constant = ["#7A8A30", 64]
let s:preproc = ["#DAB98F", 180]
let s:special = ["#FF0000", 196]
let s:bar = ["#CACACA", 137]
let s:bar_active = ["#A8A8A8", 248]
let s:base = ["#161616", 16]
let s:column = ["#222222", 0]
let s:line = ["#101049", 0]

let s:none = ['NONE', 'NONE']
let s:underline = 'underline,'
"let s:reverse = 'reverse,'

call s:HL('Normal', s:default, s:none)
"call s:HL('Normal', s:default)
"hi Normal guifg=#BD9F76 guibg=#161616
call s:HL('Visual', s:none, s:highlight)
call s:HL('Search', s:none, s:search)
call s:HL('IncSearch', s:at_highlight, s:highlight)

" The column separating vertically split windows
call s:HL('VertSplit', s:margin_active, s:margin)

" Current match in wildmenu completion
hi! link WildMenu Search

" Error messages on the command line
"call s:HL('ErrorMsg', s:special, s:back)
call s:HL('ErrorMsg', s:special)

" Line number for :number and :# commands
call s:HL('LineNr', s:default, s:back)
call s:HL('CursorLineNr', s:keyword, s:back)

" Tilde (~)
call s:HL('NonText', s:back, s:back)

" Character under cursor
call s:HL('Cursor', s:none, s:cursor)
call s:HL('MatchParen', s:back, s:match)

call s:HL('Comment', s:comment)
call s:HL('Todo', s:preproc)
call s:HL('Error', s:special)

" Generic statement
call s:HL('Statement', s:keyword)
" if, then, else, endif, swicth, etc.
hi! link Conditional Statement
" for, do, while, etc.
hi! link Repeat Statement
" case, default, etc.
hi! link Label Statement
" try, catch, throw
hi! link Exception Statement
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword Statement

" Variable name
hi! link Identifier Normal
" Function name
hi! link Function Statement

" Generic preprocessor
call s:HL('PreProc', s:preproc)
" Preprocessor #include
hi! link Include PreProc
" Preprocessor #define
hi! link Define PreProc
" Same as Define
hi! link Macro PreProc
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit PreProc

" Generic constant
call s:HL('Constant', s:constant)
" Character constant: 'c', '/n'
hi! link Character Constant
" String constant: "this is a string"
hi! link String Constant
" Boolean constant: TRUE, false
hi! link Boolean Constant
" Number constant: 234, 0xff
hi! link Number Constant
" Floating point constant: 2.3e10
hi! link Float Constant

" Generic type
hi! link Type Statement
" static, register, volatile, etc
hi! link StorageClass Statement
" struct, union, enum, etc.
hi! link Structure Statement
" typedef
hi! link Typedef Statement

" Completion Menu

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:default, s:back)
  " Popup menu: selected item
  hi! link PmenuSel Search
endif

" Tab
call s:HL('TabLine', s:base, s:bar)
call s:HL('TabLineSel', s:base, s:bar_active)
call s:HL('TabLineFill', s:base, s:bar)

" Sneak
autocmd ColorScheme handmade-hero hi! link Sneak Search
autocmd ColorScheme handmade-hero hi! link SneakLabel Search

" Vim Multiple Cursors

hi! link multiple_cursors_cursor Cursor
hi! link multiple_cursors_visual Visual

" Markdown

hi! link markdownH1 Statement
hi! link markdownH2 Statement
hi! link markdownH3 Statement

hi! link markdownLinkText Statement
call s:HL('markdownLinkText', s:keyword, s:back, s:underline)

" Custom
call s:HL('ColorColumn', s:none, s:column)
call s:HL('CursorLine', s:none, s:line)
"call s:HL('MatchParen', s:line, s:line)
"hi! MatchParen cterm=NONE gui=NONE guibg=#35b132 guifg=inverse
"hi! CursorLine guibg=#101049 term=none cterm=none ctermbg=none
" Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:Cursor/lCursor
  \,sm:block
"call s:HL('BufTabLineActive', s:base, s:bar_active)
call s:HL('SpecialKey', s:default)
call s:HL('SpecialKeyWin', s:default)

