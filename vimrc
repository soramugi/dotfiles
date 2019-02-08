"---------------------------------------------------------------------------
" neobundle.vim
"---------------------------------------------------------------------------
set nocompatible
filetype plugin indent off

if has('vim_starting')
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    echo "done neobundle install!!"
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
if neobundle#load_cache(expand('$MYVIMRC'))
  call neobundle#load_toml('~/.vim/bundle.toml')
  call neobundle#load_toml('~/.vim/bundle_lazy.toml', {'lazy':1})
  NeoBundle 'vim-scripts/yanktmp.vim'
  NeoBundle 'vim-jp/vimdoc-ja'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'vim-scripts/Align'
  ""NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'svn-diff.vim'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'kien/ctrlp.vim.git'
  NeoBundle 'soramugi/auto-ctags.vim'
  NeoBundle 'glidenote/memolist.vim'
  NeoBundle 'kana/vim-fakeclip.git'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'kana/vim-textobj-user'
  NeoBundle 'osyo-manga/vim-textobj-multiblock'
  NeoBundle 'osyo-manga/vim-over'
  NeoBundle 'vim-jp/vital.vim'
  NeoBundle 'mopp/autodirmake.vim'
  NeoBundle 'vim-scripts/vim-auto-save'
  NeoBundle 'vim-scripts/zoom.vim'
  NeoBundle 'othree/yajs.vim'
  "NeoBundle 'pangloss/vim-javascript'
  NeoBundle "mxw/vim-jsx"
  NeoBundle 'keith/swift.vim'
  NeoBundle 'kballard/vim-swift', {
        \ 'filetypes': 'swift',
        \ 'unite_sources': ['swift/device', 'swift/developer_dir']
        \}
  NeoBundle 'violetyk/cake.vim'
  NeoBundle 'vim-scripts/smarty-syntax'
  NeoBundle 'mileszs/ack.vim'

  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'nikvdp/ejs-syntax'
  NeoBundle 'posva/vim-vue'
  NeoBundle 'junegunn/vim-easy-align'

  "typescriptの保管やコンパイルエラーの確認"
  NeoBundle 'Quramy/tsuquyomi'

  NeoBundleLazy 'OrangeT/vim-csharp', { 'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] } }
  ""NeoBundleLazy 'OmniSharp/omnisharp-vim', {
  ""\   'autoload': { 'filetypes': [ 'cs', 'csi', 'csx' ] },
  ""\   'build': {
  ""\     'windows' : 'msbuild server/OmniSharp.sln',
  ""\     'mac': 'xbuild server/OmniSharp.sln',
  ""\     'unix': 'xbuild server/OmniSharp.sln',
  ""\   },
  ""\ }
  NeoBundleLazy 'heavenshell/vim-jsdoc' , {'autoload': {'filetypes': ['javascript']}}

  "保存されて無かったら対話するやつ"
  NeoBundle 'https://gist.github.com/7574789.git', { 'script_type' : 'plugin' }
  "以前のカーソル位置に移動"
  NeoBundle 'https://gist.github.com/7671774.git', { 'script_type' : 'plugin' }
  "agあればgrepをagコマンドに"
  ""NeoBundle 'https://gist.github.com/7800124.git', { 'script_type' : 'plugin' }
  "NeoBundleUpdate!を1日毎勝手に実行"
  NeoBundle 'https://gist.github.com/9133200.git', { 'script_type' : 'plugin' }

  NeoBundleSaveCache
endif

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

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
set noexpandtab
" バックアップ
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
""set synmaxcol=200
if v:version > 702
  ""set relativenumber
  set colorcolumn=120
endif
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

"-----------------------------------------------------------------------------------"
"                                      チートシート                                 "
"-----------------------------------------------------------------------------------"


""ウィンドウ分割
""
""水平分割	:split	ss
""垂直分割	:vsplit	sv
""
""左に移動	<C-w>h	sh
""下に移動	<C-w>j	sj
""上に移動	<C-w>k	sk
""右に移動	<C-w>l	sl
""次に移動	<C-w>w	sw
""
""ウィンドウそのもの
""左に移動	<C-w>H	sH
""下に移動	<C-w>J	sJ
""上に移動	<C-w>K	sK
""右に移動	<C-w>L	sL
""回転	<C-w>r	sr

"-----------------------------------------------------------------------------------"
" Mappings                                                                          |
"-----------------------------------------------------------------------------------"
" コマンド        | ノーマル | 挿入 | コマンドライン | ビジュアル | 選択 | 演算待ち |
" map  / noremap  |    @     |  -   |       -        |     @      |  @   |    @     |
" nmap / nnoremap |    @     |  -   |       -        |     -      |  -   |    -     |
" vmap / vnoremap |    -     |  -   |       -        |     @      |  @   |    -     |
" omap / onoremap |    -     |  -   |       -        |     -      |  -   |    @     |
" xmap / xnoremap |    -     |  -   |       -        |     @      |  -   |    -     |
" smap / snoremap |    -     |  -   |       -        |     -      |  @   |    -     |
" map! / noremap! |    -     |  @   |       @        |     -      |  -   |    -     |
" imap / inoremap |    -     |  @   |       -        |     -      |  -   |    -     |
" cmap / cnoremap |    -     |  -   |       @        |     -      |  -   |    -     |
"-----------------------------------------------------------------------------------"

"leaderキー切り替え
let mapleader = ","

" 閉じ括弧の自動挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

""" 画面切り替え
""nnoremap <c-j> <c-w>j
""nnoremap <c-k> <c-w>k
""nnoremap <c-l> <c-w>l
""nnoremap <c-h> <c-w>h

" バッファ
""nnoremap <Tab>             :bnext<CR>
""nnoremap <S-Tab>           :bprevious<CR>
nnoremap <silent> <Space>d :bdelete<CR>

" tab移動
nnoremap <C-I> gt
""nnoremap <S-C-I> gT " 同時押しは不可能

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
nnoremap <silent> <Space>e  :vsplit $MYVIMRC<CR>
nnoremap <silent> <Space>E  :source $MYVIMRC<CR>

" sudoで保存
nnoremap <silent> <Space>s :<C-u>w !sudo tee %<CR>

" grep の書式を挿入
""nnoremap <expr> <Space>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . &filetype
nnoremap <expr> <Space>G ':sil grep! ' . expand('<cword>') . ' *'
nnoremap <expr> <S-k> ':Ack! ' . expand('<cword>') . '<CR>'

" help 引くのに便利かなと
""nnoremap <expr> <Space>h ':tab h ' . expand('<cword>')

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

"ファイルリストの表示"
nnoremap <C-n> :NERDTreeToggle<CR>

"今見てるタブ以外を閉じる"
nnoremap <Space>q :tabonly<CR>

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

vmap <Enter> <Plug>(EasyAlign)

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
  set undodir=~/.vim/undo/
  set undofile
endif
set fileencodings=utf-8,default,iso-2022-jp,euc-jp,cp932,ucs-bom,latin1

" vimrc外部ファイル化"
runtime! vimrc.d/*.vim
