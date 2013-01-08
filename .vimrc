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
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Align'
"NeoBundle 'myusuf3/numbers.vim'
"NeoBundle 'vim-scripts/TagHighlight'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'vim-scripts/project.tar.gz'
"NeoBundle 'vim-scripts/wokmarks.vim'
"NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'svn-diff.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'soramugi/vimplenote-vim', 'prot'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'kien/ctrlp.vim.git'
" IDE風
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'vim-scripts/Trinity'
NeoBundle 'wesleyche/SrcExpl'
"NeoBundle 'scrooloose/nerdtree'
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

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_auto_select           = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1
let g:neocomplcache_max_list                     = 10

" quickrun
let g:quickrun_config   = {
      \   '_' : {
      \       'runner' : 'vimproc',
      \       'outputter/buffer/split' : ':botright 8sp',
      \       'runner/vimproc/updatetime' : 40,
      \   },
      \   'ruby.rspec' : {
      \       'command' : 'rspec'
      \   }
      \}
augroup UjihisaRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

" taglist.vim
set tags=tags
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWiindow   = 1
let Tlist_Enable_Fold_Column = 1
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

" yanktmp
let g:yanktmp_file = $HOME . '/.vim_tmp_file'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" ctrlp
let g:ctrlp_map = '<Space>f'

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
set colorcolumn=80
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
" 日本語ドキュメントの格納場所
helptags $HOME/dotfiles/.vim/doc
" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>

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

"---------------------------------------------------------------------------
" タブ
"---------------------------------------------------------------------------
set smarttab
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

" 拡張子で変更
au BufNewFile,BufRead *.php  set tabstop=4 shiftwidth=4 softtabstop=4

"---------------------------------------------------------------------------
" タグ
"---------------------------------------------------------------------------
set tags+=$HOME/tags

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
"---------------------------------------------------------------------------

"leaderキー切り替え
let mapleader = ","

" /で別ウィンドウ開く
nnoremap / q/a

" 終了
nnoremap <C-q> :q<CR>

" 閉じかっこで移動
inoremap {} {}<LEFT>
inoremap [] []<LEFT>
inoremap () ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>

" 画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" tab移動
nnoremap <C-n> gt
nnoremap <C-p> gT

" カレントディレクトリをtabで開く
nnoremap <silent> <Space>t :<C-u>tabnew ./<CR>
" 開いてるファイルをtabで開く
nnoremap <silent> <Space>T :<C-u>tabnew %<CR>

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
nnoremap <silent> <Space>E  :<C-u>source $MYVIMRC<CR>

" sudoで開き直す
nnoremap <silent> <Space>s :<C-u>edit sudo:%<CR>

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'

" help 引くのに便利かなと
nnoremap <expr> <Space>h ':tab h ' . expand('<cword>')

" ファイルの表示を整える
nnoremap <Space>p :%s/\s\+$//ge<CR> gg =G

" quickrun"
nnoremap <Space>r :QuickRun<CR>

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

cnorea h tab help

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

" IDE風起動
cnorea ta TrinityToggleAll

"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------

" カーソル位置を最後の編集位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" 検索などで飛んだらそこを真ん中に
for maptype in ['n', 'N', '*', '#', 'g*', 'g#', 'G']
  execute 'nmap' maptype maptype . 'zz'
endfor

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" 無限undo
if has('persistent_undo')
  set undodir=~/dotfiles/undo/
  set undofile
endif
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
