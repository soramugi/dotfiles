"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/snipmate-snippets'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'unix' : 'make -f make_unix.mak',
\   },
\ }
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
NeoBundle 'tpope/vim-surround'
NeoBundle 'svn-diff.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'soramugi/vimplenote-vim', 'prot'
NeoBundle 'mattn/excitetranslate-vim'
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
let g:neocomplcache_enable_auto_select           = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1

" quickrun
let g:quickrun_config               = {}
let g:quickrun_config._             = {'runner' : 'vimproc'}
let g:quickrun_config['*']          = {'split': 'below'}
let g:quickrun_config['ruby.rspec'] = {'command': "rspec"}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" taglist.vim
set tags=tags
let Tlist_Show_One_File      = 1 "現在編集中のソースのタグしか表示しない
let Tlist_Exit_OnlyWiindow   = 1 "taglist が最後のウインドウなら vim を閉じる
let Tlist_Enable_Fold_Column = 1 " 折り畳み
let g:tlist_php_settings     = 'php;c:class;d:constant;f:function'

" syntastic.vim
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" neosnippet
let g:neosnippet#snippets_directory='~/dotfiles/.vim/bundle/snipmate-snippets/snippets'
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" open-browser
let g:netrw_nogx = 1

" vimplenote
if filereadable(expand('$HOME/.VimpleNote'))
  " let g:VimpleNoteUsername = your_email
  " let g:VimpleNotePassword = your_pass
  source $HOME/.VimpleNote
endif

source $VIMRUNTIME/macros/matchit.vim
"---------------------------------------------------------------------------
" 基本設定:
"---------------------------------------------------------------------------

set runtimepath+=~/dotfiles/.vim/
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
set visualbell t_vb=
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
set grepprg=grep\ -rnIH\ --exclude=*.svn*\ --exclude=*.git*
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen
set switchbuf+=usetab,newtab
" タグ
set tags+=$HOME/tags
" 日本語ドキュメントの格納場所
helptags $HOME/dotfiles/.vim/doc
" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>

"---------------------------------------------------------------------------
" 色設定
"---------------------------------------------------------------------------
set t_Co=256
colorscheme desert
"colorscheme molokai

"ポップアップ補完メニュー
hi Pmenu      ctermbg=2
hi PmenuSel   ctermbg=8
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
" タグジャンプ
"---------------------------------------------------------------------------

" 拡張子で読み込みタグ変更
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags

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

" /で別ウィンドウ開く
nnoremap / q/a

" 終了保存
nnoremap <C-q> :q<CR>

" エンターで行増やす
nnoremap <CR> o<Esc>

"閉じかっこの自動入力
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" tab移動
nnoremap <S-Tab> gt
nnoremap <Tab><Tab> gT

" s* で置換指定
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" ESC2回でハイライト非表示
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 検索で自動的に移動しない
nnoremap * *N
nnoremap # #N

" 連続ペーストを効率よく
vnoremap <silent> <C-p> "0p<CR>

" vimrc編集
nnoremap <silent> <Space>e  :<C-u>tabedit $MYVIMRC<CR>

" sudoで開き直す
nnoremap <silent> <Space>s :<C-u>edit sudo:%<CR>

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

" help 引くのに便利かなと
nnoremap <expr> <Space>h ':h ' . expand('<cword>')

" YankRing.vim
nmap ,y :YRShow<CR>

" vim-visualstar
nnoremap <Plug>N N
map * <Plug>(visualstar-*)<Plug>N
map # <Plug>(visualstar-#)<Plug>N

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<TAB>"

" neosnippet
imap <C-i> <Plug>(neosnippet_expand_or_jump)
smap <C-i> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" open-browser
nmap <C-O> <Plug>(openbrowser-smart-search)
vmap <C-O> <Plug>(openbrowser-smart-search)

" excitetranslate-vim
nmap <C-e> :ExciteTranslate<CR>

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

" taglist.vim
cnorea tl Tlist

" VimpleNote
cnorea note VimpleNote
"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------

" カーソル位置を最後の編集位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge

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
if filereadable(expand('$HOME/dotfiles/.local/.vimrc'))
  source $HOME/dotfiles/.local/.vimrc
endif
