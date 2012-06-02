"---------------------------------------------------------------------------
" neobundle.vim
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
  call neobundle#rc(expand('~/.vim/'))
endif
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'yuroyoro/vimdoc_ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'matchit.zip'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/Align'
" Ruby環境
NeoBundle 'vim-ruby/vim-ruby'
" js環境
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
" php環境
NeoBundle 'soh335/vim-symfony'

filetype plugin indent on

cnoreabbrev neoli  NeoBundleList
cnoreabbrev neoin  NeoBundleInstall
cnoreabbrev neoin! NeoBundleInstall!
cnoreabbrev neocl  NeoBundleClean
cnoreabbrev neocl! NeoBundleClean!

"---------------------------------------------------------------------------
" プラグイン設定
"
" YankRing.vim
let g:yankring_history_dir            = expand('$HOME')
let g:yankring_history_file           = '.yankring_history'
let g:yankring_manual_clipboard_check = 1
let g:yankring_max_history            = 10
let g:yankring_window_height          = 13
nmap ,y :YRShow<CR>

" vim-visualstar
nnoremap <Plug>N N
map * <Plug>(visualstar-*)<Plug>N
map # <Plug>(visualstar-#)<Plug>N

" neocomplcache
let g:neocomplcache_enable_at_startup            = 1
let g:neocomplcache_enable_auto_select           = 0
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion   = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"---------------------------------------------------------------------------
" 基本設定:
"
colorscheme desert
"ポップアップ補完メニュー色設定
highlight  Pmenu      ctermbg=8  guibg=#606060
highlight  PmenuSel   ctermbg=12 guibg=SlateBlue
highlight  PmenuSbar  ctermbg=0  guibg=#404040
"highlight PmenuThumb ctermbg=0  guibg=Red

set clipboard=unnamed,autoselect

"---------------------------------------------------------------------------
" 編集に関する設定:
"
set fileformats=unix,dos,mac
set backspace=2
set showmatch
set matchtime=2
set wildmenu
set formatoptions+=mM
" カーソル位置を最後の編集位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"---------------------------------------------------------------------------
" インデント

" 空白タブ設定
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
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
" 画面表示の設定:

set number
set ruler
set list
set listchars=tab:>-,extends:<,trail:-
set wrap
set laststatus=2
set showcmd
set cmdheight=1
set title
syntax on
set textwidth=0

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n%{winnr('$')>1?'/'.winnr().'/'.winnr('$'):''}\:%y%F\%h%w%m%r%=\|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}<%c,%l/%L:%p%%>

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

set incsearch
set hlsearch
set ignorecase
set smartcase
set wrapscan
set history=100

" 検索などで飛んだらそこを真ん中に
for maptype in ['n', 'N', '*', '#', 'g*', 'g#', 'G']
  execute 'nmap' maptype maptype . 'zz'
endfor

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
set mouse=a
set nomousefocus
set mousehide

"---------------------------------------------------------------------------
" キーバインド設定
"
" カレントディレクトリの移動
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
"---------------------------------------------------------------------------
" 言語毎設定

" php
let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1
let php_folding = 1

"---------------------------------------------------------------------------
" 文法チェック
set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

"---------------------------------------------------------------------------
" その他設定

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
