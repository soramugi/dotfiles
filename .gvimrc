if filereadable(expand('$HOME/dotfiles/.vimrc'))
    source $HOME/dotfiles/.vimrc
endif

" とりあえずのWindows用、gvim設定置いておく
set columns=100
set lines=50
set guioptions-=T
"set guifont=Osaka－等幅:h12

"---------------------------------------------------------------------------
" gvimrcのlocal設定
if filereadable(expand('$HOME/dotfiles/.local/.gvimrc'))
    source $HOME/dotfiles/.local/.gvimrc
endif
