if filereadable(expand('$HOME/.vimrc'))
    source $HOME/.vimrc
endif

" とりあえずのWindows用、gvim設定置いておく
set columns=100
set lines=50
set guioptions-=T
"set guifont=Osaka－等幅:h12