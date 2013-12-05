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
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/Align'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'vim-scripts/wokmarks.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'svn-diff.vim'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'chikatoike/activefix.vim'
NeoBundle "jceb/vim-hier"
NeoBundle 'tyru/open-browser.vim'
""NeoBundle 'mattn/webapi-vim'
""NeoBundle 'mattn/excitetranslate-vim'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'git@github.com:soramugi/auto-ctags.vim.git'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'kana/vim-fakeclip.git'
NeoBundle 'tpope/vim-abolish'
NeoBundleLazy "mattn/habatobi-vim", { 'autoload' : { 'commands' : [ "Habatobi" ] } }
NeoBundle "Shougo/unite.vim"
""NeoBundle 'Shougo/vimfiler', { 'depends' : ["Shougo/unite.vim"] }
NeoBundle 'vim-scripts/netrw.vim'
NeoBundleLazy 'yuratomo/w3m.vim', {
      \   'autoload' : {
      \       'commands' : [ "W3m", "W3mHistory", "W3mHistoryClear", "W3mLocal", "W3mSplit", "W3mTab", "W3mVSplit" ]
      \   }
      \}
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'glidenote/octoeditor.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'bling/vim-airline'
""NeoBundle 'rking/ag.vim'
NeoBundle 'modsound/macdict-vim.git'
NeoBundle 'syui/wauto.vim'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'osyo-manga/vim-textobj-multiblock'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'LeafCage/vimhelpgenerator'
"OctopressGit.vim"
NeoBundle 'git://gist.github.com/6775207.git', { 'script_type' : 'plugin' }
"保存されて無かったら対話するやつ"
NeoBundle 'git://gist.github.com/7574789.git', { 'script_type' : 'plugin' }
"以前のカーソル位置に移動"
NeoBundle 'git://gist.github.com/7671774.git', { 'script_type' : 'plugin' }
"agあればgrepをagコマンドに"
NeoBundle 'git://gist.github.com/7800124.git', { 'script_type' : 'plugin' }
" IDE風
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/tagbar-phpctags'

filetype plugin indent on

"---------------------------------------------------------------------------
" 基本設定:
"---------------------------------------------------------------------------

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
" バックアップ
set noswapfile
set nobackup
" 画面表示
syntax on
set number
set relativenumber
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
autocmd QuickFixCmdPost *grep* cwindow
set switchbuf+=usetab,newtab

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

" 閉じ括弧の自動挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

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
nnoremap s* :OverCommandLine<CR>%s/<C-r><C-w>/

" ESC2回でハイライト非表示
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 連続ペーストを効率よく
vnoremap <silent> <C-p> "0p<CR>

" vimrc編集
nnoremap <silent> <Space>e  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>E  :<C-u>source $MYVIMRC<CR>

" sudoで保存
nnoremap <silent> <Space>s :<C-u>w !sudo tee %<CR>

" grep の書式を挿入
nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . &filetype
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'
""nnoremap <expr> <Space>g ':Ag ' . expand('<cword>')

" help 引くのに便利かなと
nnoremap <expr> <Space>h ':tab h ' . expand('<cword>')

" ファイルの表示を整える
nnoremap <Space>p ma :%s/\s\+$//ge<CR> gg =G `a

" タイムスタンプの挿入"
nnoremap <Space>j :<C-u>r !date +"\%Y\%m\%d\%H\%M"<CR>

"コマンドラインからテキスト受け渡し"
nmap <Space>b :read ~/.vim_bf<CR>
vmap <Space>b :w!~/.vim_bf<CR>

"連番"
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let c = col('.')|for n in range(1, <count>?<count>-line('.'):1)|exec 'normal! j' . n . <q-args>|call cursor('.', c)|endfor

nnoremap <Space>n :<C-u>setlocal relativenumber!<CR>

" Align"
nnoremap <Space>a :Align<Space>

" quickrun"
nnoremap <Space>r :QuickRun<CR>

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<TAB>"

" open-browser
nmap <silent> <Space>o <Plug>(openbrowser-smart-search)
vmap <silent> <Space>o <Plug>(openbrowser-smart-search)

" excitetranslate-vim
""nmap <C-e> :ExciteTranslate<CR>
nmap <expr> <C-e> ':MacDict ' . expand('<cword>') . '<CR>'

" memolist.vim
nnoremap <silent> <Space>m :MemoList<CR>

" FuzzyFinder"
nnoremap <Leader>f :FufFile<CR>

" tagbar"
nnoremap <Leader>t :TagbarToggle<CR>

"vim-textobj-multiblock"
vmap ab <Plug>(textobj-multiblock-a)
vmap ib <Plug>(textobj-multiblock-i)

"反復横跳び"
nnoremap <expr> 0 col(".") == 1 ? '$' : '0'


" インサートモードで移動"
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

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

" tags作成
""cnorea Ctags TagsGenerate

" 色確認"
cnorea Color so $VIMRUNTIME/syntax/colortest.vim

" memo
cnorea Memo edit ~/Dropbox/Memo/Memo.txt
command! -nargs=1 Tmp edit ~/Dropbox/Memo/tmp/tmp.<args>
command! -nargs=1 Temp edit ~/Dropbox/Memo/tmp/tmp.<args>
"---------------------------------------------------------------------------
" 編集に関する設定:
"---------------------------------------------------------------------------

" 無限undo
if has('persistent_undo')
  set undodir=~/dotfiles/.vim/undo/
  set undofile
endif

" vimrc外部ファイル化"
runtime! vimrc.d/*.vim
