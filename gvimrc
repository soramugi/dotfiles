" とりあえずのWindows用、gvim設定置いておく
set columns=100
set lines=45
set guioptions-=T
set guifont=Monaco:h11

let g:nerdtree_tabs_not_open = 1
let g:nerdtree_tabs_open_on_console_startup = 0
if filereadable(expand('$HOME/.vimrc'))
    source $HOME/.vimrc
endif
