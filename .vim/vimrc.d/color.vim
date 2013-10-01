"---------------------------------------------------------------------------
" 色設定
"---------------------------------------------------------------------------
set t_Co=256
colorscheme desert

"ポップアップ補完メニュー
highlight Pmenu      ctermbg=2
highlight PmenuSel   ctermbg=7
highlight PmenuSbar  ctermbg=2
highlight PmenuThumb ctermfg=3

highlight ColorColumn ctermbg=DarkGreen guibg=DarkGreen

" vim-hier"
highlight QfErrorUcurl cterm=undercurl ctermfg=Red gui=undercurl guisp=Red
let g:hier_highlight_group_qf  = "QfErrorUcurl"
highlight QfWarningUcurl cterm=undercurl ctermfg=Blue gui=undercurl guisp=Blue
let g:hier_highlight_group_qfw = "QfWarningUcurl"

"vim-indent-guides"
highlight IndentGuidesOdd  guibg=#262626 ctermbg=grey
highlight IndentGuidesEven guibg=#3c3c3c ctermbg=grey


" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

if has('multi_byte_ime') || has('xim')
  " カーソル色(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
endif

