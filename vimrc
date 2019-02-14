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
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'Shougo/neosnippet.vim'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'thinca/vim-quickrun'

  NeoBundle 'vim-jp/vimdoc-ja'
  NeoBundle 'vim-scripts/vim-auto-save'
  NeoBundle 'vim-scripts/yanktmp.vim'
  NeoBundle 'vim-scripts/Align'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'svn-diff.vim'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'soramugi/auto-ctags.vim'
  NeoBundle 'glidenote/memolist.vim'
  NeoBundle 'kana/vim-fakeclip.git'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'osyo-manga/vim-over'
  NeoBundle 'vim-jp/vital.vim'
  NeoBundle 'mopp/autodirmake.vim'
  NeoBundle 'vim-scripts/zoom.vim'
  NeoBundle 'othree/yajs.vim'
  NeoBundle "mxw/vim-jsx"
  NeoBundle 'keith/swift.vim'
  NeoBundle 'kballard/vim-swift', {
        \ 'filetypes': 'swift',
        \ 'unite_sources': ['swift/device', 'swift/developer_dir']
        \}
  NeoBundle 'mileszs/ack.vim'

  NeoBundle 'w0rp/ale'
  NeoBundle 'tpope/vim-unimpaired'

  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'nikvdp/ejs-syntax'
  NeoBundle 'posva/vim-vue'
  NeoBundle 'junegunn/vim-easy-align'
  NeoBundle 'tpope/vim-commentary'
  NeoBundle 'qpkorr/vim-bufkill'

  NeoBundle '/usr/local/opt/fzf'
  NeoBundle 'junegunn/fzf.vim'

  NeoBundle 'simeji/winresizer'
  NeoBundle 'reireias/vim-cheatsheet'

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
  ""NeoBundle 'https://gist.github.com/7574789.git', { 'script_type' : 'plugin' }
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
""set switchbuf+=usetab,newtab


" 無限undo
if has('persistent_undo')
  set undodir=~/.vim/undo/
  set undofile
endif
set fileencodings=utf-8,default,iso-2022-jp,euc-jp,cp932,ucs-bom,latin1

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

set statusline=%{LinterStatus()}

"-----------------------------------------------------------------------------------"
" Mappings                                                                          |
"-----------------------------------------------------------------------------------"
" コマンド        | ノーマル | 挿入 | コマンドライン | ビジュアル | 選択 | 演算待ち |
" map  / noremap  |    @     |  -   |       -        |     @      |  @   |    @     |
" map! / noremap! |    -     |  @   |       @        |     -      |  -   |    -     |
" vmap / vnoremap |    -     |  -   |       -        |     @      |  @   |    -     |
" nmap / nnoremap |    @     |  -   |       -        |     -      |  -   |    -     |
" imap / inoremap |    -     |  @   |       -        |     -      |  -   |    -     |
" cmap / cnoremap |    -     |  -   |       @        |     -      |  -   |    -     |
" xmap / xnoremap |    -     |  -   |       -        |     @      |  -   |    -     |
" smap / snoremap |    -     |  -   |       -        |     -      |  @   |    -     |
" omap / onoremap |    -     |  -   |       -        |     -      |  -   |    @     |
"-----------------------------------------------------------------------------------"

"leaderキー切り替え
let mapleader = "\<Space>"

map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" ESC2回でハイライト非表示
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>

" バッファ
nnoremap ] :bnext<CR>
nnoremap [ :bprevious<CR>
nnoremap <silent> <Leader>d :bdelete<CR>

" 警告表示の行に飛ぶ"
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <C-p> <Plug>(ale_previous_wrap)

"ファイルリストの表示"
nnoremap <C-l> :NERDTreeToggle<CR>

" tab移動
nnoremap <Tab>   gt
nnoremap <S-Tab> gT

" カレントディレクトリをtabで開く
nnoremap <silent> <Leader>t :<C-u>tabnew<CR>
nnoremap <silent> <Leader>T :<C-u>tabnew %<CR>

" grep の書式を挿入
""nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . &filetype
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' *'
nnoremap <expr> <S-k> ':Ack! ' . expand('<cword>') . '<CR>'

" s* で置換指定
nnoremap s* :OverCommandLine<CR>%s/<C-r><C-w>/

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 閉じ括弧の自動挿入
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap < <><LEFT>

" 連続ペーストを効率よく
vnoremap <silent> <C-p> "0p<CR>

" vimrc編集
nnoremap <silent> <Leader>e  :vsplit $MYVIMRC<CR>
nnoremap <silent> <Leader>E  :source $MYVIMRC<CR>

" sudoで保存
nnoremap <silent> <Leader>s :<C-u>w !sudo tee %<CR>

" ファイルの表示を整える
""nnoremap <Leader>p ma :%s/\s\+$//ge<CR> gg =G `a
nnoremap <Leader>p :ALEFix<CR>

" タイムスタンプの挿入"
nnoremap <Leader>j :<C-u>r !date +"\%Y\%m\%d\%H\%M"<CR>

"コマンドラインからテキスト受け渡し"
nmap <Leader>b :read ~/.vim_bf<CR>
vmap <Leader>b :w!~/.vim_bf<CR>

"今見てるタブ以外を閉じる"
nnoremap <Leader>q :tabonly<CR>

" quickrun"
nnoremap <Leader>r :QuickRun<CR>

" neocomplcache
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-j> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<TAB>"

" open-browser
nmap <silent> <Leader>o <Plug>(openbrowser-smart-search)
vmap <silent> <Leader>o <Plug>(openbrowser-smart-search)

" memolist.vim
nnoremap <silent> <Leader>m :MemoList<CR>

vmap <Enter> <Plug>(EasyAlign)

"反復横跳び"
nnoremap <expr> 0 col(".") == 1 ? '$' : '0'

" インサートモードで移動"
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-p> <Up>
inoremap <C-n> <Down>

" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

" バッファを削除するがvimの終了まではしない
nmap <C-q> :bd<CR>

" fzf.vim
nmap ; :Buffers<CR>
nmap f :Files<CR>
nmap t :Tags<CR>

"---------------------------------------------------------------------------
" 短縮入力:
"---------------------------------------------------------------------------
" コマンド                挿入モード   コマンドラインモード
" inorea/inoreabbrev          @                -
" cnorea/cnoreabbrev          -                @
" noreab/noreabbrev           @                @
"---------------------------------------------------------------------------

" 移動
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
" タブ
"---------------------------------------------------------------------------
set smarttab
set expandtab
""set noexpandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

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

" vim-hier"
highlight QfErrorUcurl cterm=underline gui=undercurl guisp=Red
let g:hier_highlight_group_qf  = "QfErrorUcurl"
highlight QfWarningUcurl cterm=undercurl ctermfg=Blue gui=undercurl guisp=Blue
let g:hier_highlight_group_qfw = "QfWarningUcurl"

"vim-indent-guides"
highlight IndentGuidesOdd  guibg=#262626 ctermbg=grey
highlight IndentGuidesEven guibg=#3c3c3c ctermbg=grey


" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

if has('multi_byte_ime') || has('xim')
  " カーソル色(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
endif

" markdownのシンタックス色表示"
let g:markdown_fenced_languages = [
      \  'coffee',
      \  'css',
      \  'erb=eruby',
      \  'javascript',
      \  'js=javascript',
      \  'json=javascript',
      \  'ruby',
      \  'sass',
      \  'xml',
      \]

"---------------------------------------------------------------------------
" プラグイン設定
"---------------------------------------------------------------------------

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_auto_select           = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1
let g:neocomplcache_max_list                     = 10

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
      \ pumvisible() ? "\<C-n>" :
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

" quickrun
let g:quickrun_config = {
      \   '_' : {
      \       'runner' : 'vimproc',
      \       'outputter/buffer/split' : ':botright 20sp',
      \       'runner/vimproc/updatetime' : 40,
      \   },
      \   'markdown'  : {
      \       'outputter' : 'null',
      \       'command'   : 'open',
      \       'cmdopt'    : '-a',
      \       'args'      : 'Kobito',
      \       'exec'      : '%c %o %a %s',
      \   },
      \   'swift' : {
      \       'command': 'xcrun',
      \       'cmdopt': 'swift',
      \       'exec': '%c %o %s',
      \   },
      \}

" taglist.vim
set tags=tags
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWiindow   = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Use_Right_Window   = 1
let g:tlist_php_settings     = 'php;c:class;d:constant;f:function'

" syntastic.vim
let g:syntastic_enable_signs  = 1
let g:syntastic_auto_loc_list = 2
""let g:syntastic_check_on_open = 1
let g:syntastic_php_phpcs_args = '--encoding=utf-8 --report=csv --standard=./phpcs.xml'
let g:syntastic_php_phpmd_post_args='$HOME/dotfiles/phpmd.xml'

" open-browser
let g:netrw_nogx = 1

source $VIMRUNTIME/macros/matchit.vim

" yanktmp
let g:yanktmp_file = $HOME . '/.vim_tmp_file'

" ctrlp
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|build|tmp|vendor)$',
      \ 'file': '\v\.(exe|so|dll|swp|zip|jpg|png)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 20

" netrw
let g:netrw_liststyle    = 3
let g:netrw_winsize      = 100
let g:netrw_altv         = 1
let g:netrw_browse_split = 3
let g:netrw_list_hide    = '\.git,\.svn,\.DS_Store,\.bundle/'

" Align"
let g:Align_xstrlen = 3

" memolist.vim
let g:memolist_path = "$HOME/Dropbox/Memo"

autocmd FileType gitcommit DiffGitCached | wincmd x | resize 10

"vimfiler"
let g:vimfiler_as_default_explorer = 1

" octopress.vim"
let g:octopress_path = "$HOME/git/diary.soramugi.net"

" vim-indent-guides"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"w3m"
let g:w3m#search_engine = 'http://www.google.co.jp/search?ie=' . &encoding . '&q=%s'
let g:w3m#homepage = 'http://www.google.co.jp/'

"auto-ctags.vim"
set tags+=.svn/tags,.git/tags,.bundle/tags
let g:auto_ctags = 1
let g:auto_ctags_bin_path = '/usr/local/bin/ctags'
let g:auto_ctags_directory_list = ['.git', '.svn', '.bundle']
""let g:auto_ctags_filetype_mode = 1
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

"html5"
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete          = 1
let g:html5_microdata_attributes_complete     = 1
let g:html5_aria_attributes_complete          = 1

"vim-auto-save"
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

"vim-gista"
let g:gista#github_user = 'soramugi'

"dirvish"
augroup my_dirvish_events
  au!
  au User DirvishEnter let b:dirvish.showhidden = 1
augroup END

" NERDTree"
if argc() == 0 && exists('g:nerdtree_tabs_not_open') == 0
  " 開いたらすぐにNerdtreeの実行
  ""let g:nerdtree_tabs_open_on_console_startup = 1
end
let g:NERDTreeWinSize = 40
let g:NERDTreeShowHidden = 1
let g:NERDTreeIgnore = ['.DS_Store']

" vim-monsterを有効にする
let g:neocomplete#sources#omni#input_patterns = {
      \  'ruby': '[^. *\t]\.\w*\|\h\w*::'
      \}

" tsuquyomi"
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

"Ack"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" cheatsheet
let g:cheatsheet#cheat_file = $HOME . '/dotfiles/cheatsheet.md'

" ALE
let g:ale_linters = {
      \ 'html': [],
      \ 'css': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint', 'tsserver', 'typecheck'],
      \ 'vue': ['eslint']
      \ }
let g:ale_fixers = {
      \ 'typescript': ['prettier', 'tslint']
      \ }
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
let g:ale_sign_column_always = 1 " 警告がなくてもスペースを空ける
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
