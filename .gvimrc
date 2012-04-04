if filereadable(expand('$HOME/dotfiles/.vimrc'))
    source $HOME/dotfiles/.vimrc
endif

"---------------------------------------------------------------------------
" gvimrcのlocal設定
if filereadable(expand('$HOME/.local/.gvimrc.local'))
    source $HOME/.local/.gvimrc.local
endif
