"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'YankRing.vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Align'
NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'myusuf3/numbers.vim'
"NeoBundle 'vim-scripts/TagHighlight'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'vim-scripts/project.tar.gz'
"NeoBundle 'vim-scripts/wokmarks.vim'
"NeoBundle 'vim-scripts/Source-Explorer-srcexpl.vim'
"NeoBundle 'vim-scripts/trinity.vim'
"NeoBundle 'vim-scripts/gtags.vim'
" Ruby環境
NeoBundle 'vim-ruby/vim-ruby'
" js環境
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
" php環境
NeoBundle 'soh335/vim-symfony'

filetype plugin indent on

"---------------------------------------------------------------------------
" プラグイン設定
"---------------------------------------------------------------------------

" YankRing.vim
let g:yankring_history_dir            = expand('$HOME')
let g:yankring_history_file           = '.yankring_history'
let g:yankring_manual_clipboard_check = 1
let g:yankring_max_history            = 10
let g:yankring_window_height          = 13

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_auto_select           = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1

" quickrun
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['*'] = {'split': 'below'}

"---------------------------------------------------------------------------
" 基本設定:
"---------------------------------------------------------------------------

" 編集系
set fileformats=unix,dos,mac
set backspace=2
set showmatch
set matchtime=2
set wildmenu
set formatoptions+=mM
set clipboard=unnamed,autoselect
" バックアップ作成
set noswapfile
set nobackup
" 画面表示
syntax on
set number
set ruler
set list
set listchars=tab:>\ ,extends:<,trail:-
set wrap
set laststatus=2
set showcmd
set cmdheight=1
set title
set textwidth=0
set scrolloff=5
"自動折りたたみ設定
set foldmethod=indent
set foldlevel=1
set nofoldenable
" 検索
set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
set history=100
" マウス
set mouse=a
set nomousefocus
set mousehide
" 日本語ドキュメントの格納場所
set runtimepath+=~/dotfiles/.vim/
helptags $HOME/dotfiles/.vim/doc
" タグジャンプ
set tags+=$HOME/.tags

" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>

"---------------------------------------------------------------------------
" 色設定
"---------------------------------------------------------------------------
set t_Co=256
colorscheme desert
"colorscheme molokai

"ポップアップ補完メニュー
hi Pmenu      ctermbg=0
hi PmenuSel   ctermbg=4
hi PmenuSbar  ctermbg=2
hi PmenuThumb ctermfg=3


"---------------------------------------------------------------------------
" タブ
"---------------------------------------------------------------------------
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" リセット
au BufNewFile,BufRead *      set tabstop=2 shiftwidth=2

" 拡張子で変更
au BufNewFile,BufRead *.php  set tabstop=4 shiftwidth=4

"---------------------------------------------------------------------------
" キーバインド設定
"---------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------

"leaderキー切り替え
let mapleader = ","

"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

"行頭と行末
imap <C-e> <End>
imap <C-a> <Home>
cmap <C-e> <End>
cmap <C-a> <Home>
vmap <C-e> <End>
vmap <C-a> <Home>

"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" s* で置換指定
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" ESC2回でハイライト非表示
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" 検索で自動的に移動しない
nnoremap * *N
nnoremap # #N

" カレントディレクトリの移動
" <Space>cdで編集しているファイルのカレント位置へ
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>',  '<bang>')
function! s:ChangeCurrentDir(directory,  bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" YankRing.vim
nmap ,y :YRShow<CR>

" vim-visualstar
nnoremap <Plug>N N
map * <Plug>(visualstar-*)<Plug>N
map # <Plug>(visualstar-#)<Plug>N

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------------------------------------------------------------
" 短縮入力:
"---------------------------------------------------------------------------
" コマンド                挿入モード   コマンドラインモード
" inorea/inoreabbrev          @                -
" cnorea/cnoreabbrev          -                @
" noreab/noreabbrev           @                @
"---------------------------------------------------------------------------

" NeoBundle
cnorea neoli  NeoBundleList
cnorea neoin  NeoBundleInstall
cnorea neoin! NeoBundleInstall!
cnorea neocl  NeoBundleClean
cnorea neocl! NeoBundleClean!

" numbers.vim
cnorea nt     NumbersToggle

"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------

" カーソル位置を最後の編集位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 検索などで飛んだらそこを真ん中に
for maptype in ['n', 'N', '*', '#', 'g*', 'g#', 'G']
  execute 'nmap' maptype maptype . 'zz'
endfor

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"---------------------------------------------------------------------------

" 日本語入力自設定
if has('multi_byte_ime') || has('xim')
" カーソル色(設定例:紫)
highlight CursorIM guibg=Purple guifg=NONE
" 挿入モード・検索モードでのデフォルトのIME状態設定
set iminsert=0 imsearch=0
endif

"---------------------------------------------------------------------------
" 言語毎設定
"---------------------------------------------------------------------------

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1
let php_folding = 1

"---------------------------------------------------------------------------
" local設定
"---------------------------------------------------------------------------
if filereadable(expand('$HOME/.local/.vimrc.local'))
    source $HOME/.local/.vimrc.local
endif
