if filereadable(expand('./.vimrc'))
    source ./.vimrc
endif

" クリップボードを連携
set clipboard=unnamed,autoselect

set columns=120
set lines=50
set cmdheight=2
set guioptions-=T
set guifont=Osaka－等幅:h12:cSHIFTJIS
