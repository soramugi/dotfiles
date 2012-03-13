"---------------------------------------------------------------------------
" 基本設定:
"
" カラー
colorscheme desert
" クリップボードを連携
set clipboard=unnamed,autoselect
" 試しに文字コーードの指定
set encoding=utf-8
set termencoding=euc-jp

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
set cmdheight=2
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
" その他設定
" バッファを切替えてもundoの効力を失わない
"set hidden
