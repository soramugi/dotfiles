" とりあえずのWindows用、gvim設定置いておく
set columns=140
set lines=45
set guioptions-=T
set guifont=Monaco:h19


let g:nerdtree_tabs_not_open = 1
let g:nerdtree_tabs_open_on_console_startup = 0
if filereadable(expand('$HOME/.vimrc'))
    source $HOME/.vimrc
endif
cd $HOME/Dropbox/Memo/
try | NERDTreeToggle | endtry
