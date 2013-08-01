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
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \   },
      \ }
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Align'
"NeoBundle 'vim-scripts/netrw.vim'
"NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'vim-scripts/wokmarks.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'svn-diff.vim'
""NeoBundle 'scrooloose/syntastic'
"vim-quickrun,vimproc,shabadou.vim依存"
NeoBundle 'osyo-manga/vim-watchdogs'
NeoBundle 'osyo-manga/shabadou.vim'
NeoBundle "jceb/vim-hier"
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'tpope/vim-abolish'
NeoBundleLazy "mattn/habatobi-vim", { 'autoload' : { 'commands' : [ "Habatobi" ] } }
NeoBundle 'kannokanno/previm', { 'rev' : '1.0' }
NeoBundle 'deris/vim-rengbang'
NeoBundle 'vcscommand.vim'
NeoBundle "Shougo/unite.vim"
NeoBundle 'Shougo/vimfiler', { 'depends' : ["Shougo/unite.vim"] }
NeoBundleLazy 'yuratomo/w3m.vim', {
      \   'autoload' : {
      \       'commands' : [ "W3m", "W3mHistory", "W3mHistoryClear", "W3mLocal", "W3mSplit", "W3mTab", "W3mVSplit" ]
      \   }
      \}
" IDE風
""NeoBundle 'vim-scripts/taglist.vim'
""NeoBundle 'vim-scripts/Trinity'
""NeoBundle 'wesleyche/SrcExpl'

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
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

" quickrun
let g:quickrun_config = {
      \   '_' : {
      \       'runner' : 'vimproc',
      \       'outputter/buffer/split' : ':botright 20sp',
      \       'runner/vimproc/updatetime' : 40,
      \   },
      \   'ruby.rspec'  : { 'command' : 'rspec' },
      \   'php.phpunit' : { 'command' : 'phpunit' },
      \   "watchdogs_checker/_" : {
      \       "hook/close_quickfix/enable_exit" : 1,
      \   },
      \   "php/watchdogs_checker" : {
      \       "type" : "watchdogs_checker/phpcs",
      \   },
      \   "watchdogs_checker/phpcs" : {
      \       'command' : 'phpcs',
      \       "cmdopt" : "--encoding=utf-8 --report=csv --standard=./phpcs.xml",
      \       'outputter/quickfix/errorformat' : '%-GFile\,Line\,Column\,Type\,Message\,Source\,Severity,"%f"\,%l\,%c\,%t%*[a-zA-Z]\,"%m"\,%*[a-zA-Z0-9_.-]\,%*[0-9]'
      \   }
      \}

autocmd BufWritePost *Test.php :QuickRun

" taglist.vim
set tags=tags
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWiindow   = 1
let Tlist_Enable_Fold_Column = 1
let g:tlist_php_settings     = 'php;c:class;d:constant;f:function'

" syntastic.vim
""let g:syntastic_enable_signs  = 1
""let g:syntastic_auto_loc_list = 2
""""let g:syntastic_check_on_open = 1
""let g:syntastic_php_phpcs_args = '--encoding=utf-8 --report=csv --standard=./phpcs.xml'

" open-browser
let g:netrw_nogx = 1

source $VIMRUNTIME/macros/matchit.vim

" yanktmp
let g:yanktmp_file = $HOME . '/.vim_tmp_file'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" ctrlp
let g:ctrlp_map = '<Space>f'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': [],
      \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
      \ }
let g:ctrlp_working_path_mode = 'a'

" netrw
""let g:netrw_liststyle    = 3
""let g:netrw_winsize      = 100
""let g:netrw_altv         = 1
""let g:netrw_browse_split = 3
""let g:netrw_list_hide    = '\.git,\.svn,\.DS_Store'

" Align"
let g:Align_xstrlen = 3

" memolist.vim
let g:memolist_path = "$HOME/Dropbox/Memo"

autocmd FileType gitcommit DiffGitCached | only | split | b 1

" previm"
let g:previm_open_cmd = 'open -a Safari'

"vimfiler"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'

" watchdogs.vim"
call watchdogs#setup(g:quickrun_config)
let g:watchdogs_check_BufWritePost_enable = 1
let g:watchdogs_check_CursorHold_enable = 1

"---------------------------------------------------------------------------
" 基本設定:
"---------------------------------------------------------------------------

set tags+=$HOME/tags
set runtimepath+=~/dotfiles/.vim/
" 編集系
set fileformats=unix,dos,mac
set backspace=2
set showmatch
set matchtime=2
set wildmenu
set wildmode=longest:full,full
set formatoptions+=mM
set clipboard=unnamed
set nrformats=
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
set keywordprg=:help
set history=100
set grepprg=grep\ -rnIH\ --exclude=*.svn*\ --exclude=*.git*
autocmd QuickfixCmdPost vimgrep copen
autocmd QuickfixCmdPost grep copen
set switchbuf+=usetab,newtab
" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>

"---------------------------------------------------------------------------
" 色設定
"---------------------------------------------------------------------------
"set t_Co=256
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

"---------------------------------------------------------------------------
" タブ
"---------------------------------------------------------------------------
set smarttab
set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

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
nnoremap / q/a\v

" 終了
nnoremap <C-q> :q<CR>

" 閉じ括弧の自動挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

" 画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

" バッファ
nnoremap <Tab>             :bnext<CR>
nnoremap <S-Tab>           :bprevious<CR>
nnoremap <silent> <Space>d :bdelete<CR>

" tab移動
nnoremap <C-n> gt
nnoremap <C-p> gT

" カレントディレクトリをtabで開く
nnoremap <silent> <Space>t :<C-u>tabnew<CR>
nnoremap <silent> <Space>T :<C-u>tabnew %<CR>

" s* で置換指定
nnoremap <expr> s* ':%substitute/' . expand('<cword>') . '/'

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
nnoremap <Space>p ma :%s/\s\+$//ge<CR> gg =G `a

" Align"
nnoremap <Space>a :Align<Space>

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

" open-browser
nmap <C-O> <Plug>(openbrowser-smart-search)
vmap <C-O> <Plug>(openbrowser-smart-search)

" excitetranslate-vim
nmap <C-e> :ExciteTranslate<CR>

" memolist.vim
nnoremap <silent> <Space>m :MemoList<CR>
"---------------------------------------------------------------------------
" 短縮入力:
"---------------------------------------------------------------------------
" コマンド                挿入モード   コマンドラインモード
" inorea/inoreabbrev          @                -
" cnorea/cnoreabbrev          -                @
" noreab/noreabbrev           @                @
"---------------------------------------------------------------------------

"移動"
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

" IDE風起動
""cnorea IDE TrinityToggleAll

" tags作成
cnorea Ctags TagsGenerate

" memo
cnorea Memo edit ~/Dropbox/Memo/Memo.txt
command! -nargs=1 Tmp edit ~/Dropbox/Memo/tmp/tmp.<args>
command! -nargs=1 Temp edit ~/Dropbox/Memo/tmp/tmp.<args>

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
  set undodir=~/dotfiles/.vim/undo/
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
