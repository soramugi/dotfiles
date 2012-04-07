"---------------------------------------------------------------------------
" プラグイン管理
" neobundle.vim
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim.neobundle/neobundle.vim
  call neobundle#rc(expand('~/.vim.neobundle/'))
endif
" 使いたいプラグインのリポジトリを羅列。
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'yuroyoro/vimdoc_ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'YankRing.vim'

filetype plugin indent on
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" プラグイン管理
" neobundle.vim
"---------------------------------------------------------------------------
" プラグイン設定
"
" YankRing.vim
let g:yankring_history_dir = expand('$HOME')
let g:yankring_history_file = '.yankring_history'
let g:yankring_manual_clipboard_check = 1
let g:yankring_max_history = 10
let g:yankring_window_height = 13

"---------------------------------------------------------------------------
" 基本設定:
"
" カラー
colorscheme desert
" クリップボードを連携
set clipboard=unnamed,autoselect

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" 改行コードの自動認識
set fileformats=unix,dos,mac
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" 対応する括弧の表示時間
set matchtime=2
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"---------------------------------------------------------------------------
" インデント

" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab

"---------------------------------------------------------------------------
" ファイル操作に関する設定
"
" スワップ、バックアップを作成しない
set noswapfile
set nobackup

" ファイル名に大文字小文字の区別がないシステム用の設定:
"
if filereadable($VIM . '/vimrc') && filereadable($VIM . '/ViMrC')
" tagsファイルの重複防止
set tags=./tags,tags
endif
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を表示
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定、改行,eol:<
set listchars=tab:>-,extends:<,trail:-
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" コマンドの行数
set cmdheight=1
" タイトルを表示
set title
" シンタックスハイライトを有効にする
syntax on
" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|DICT=%{&dictionary}\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>
"set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
" IME ON時のカーソルの色を設定(設定例:紫)
highlight CursorIM guibg=Purple guifg=NONE
" 挿入モード・検索モードでのデフォルトのIME状態設定
set iminsert=0 imsearch=0
endif
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:

" インクリメンタル検索
set incsearch
" 検索にマッチしたすべてのテキストをハイライト
set hlsearch
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索などで飛んだらそこを真ん中に
for maptype in ['n', 'N', '*', '#', 'g*', 'g#', 'G']
  execute 'nmap' maptype maptype . 'zz'
endfor
" Escの2回押しでハイライト消去
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
" 検索で自動的に移動しない
nnoremap * *N
nnoremap # #N

"---------------------------------------------------------------------------
"自動折りたたみ設定
set foldmethod=indent
set foldlevel=1
set nofoldenable
"---------------------------------------------------------------------------
" プラットホーム依存の特別な設定

" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
let $PATH = $VIM . ';' . $PATH
endif
"if has('win32')
"  au GUIEnter * simalt ~x
"endif
if has('mac')
" Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
set iskeyword=@,48-57,_,128-167,224-235
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" キーバインド設定
map da :<CR>ggvGD<CR><ESC>
map ya :<CR>ggvGy<CR><ESC>

"---------------------------------------------------------------------------
" 辞書
autocmd FileType php :set dict=~/.vim/dict/PHP.dict
autocmd FileType js :set dict=~/.vim/dict/javascript.dict

"---------------------------------------------------------------------------
" その他設定
" バッファを切替えてもundoの効力を失わない
"set hidden

"---------------------------------------------------------------------------
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"---------------------------------------------------------------------------
" vimrcのlocal設定
if filereadable(expand('$HOME/.local/.vimrc.local'))
    source $HOME/.local/.vimrc.local
endif
