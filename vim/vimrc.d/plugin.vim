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
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|build|tmp|vendor)$',
  \ 'file': '\v\.(exe|so|dll|swp|zip|jpg|png)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
""let g:ctrlp_map = '<Space>f'
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': [],
      \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
      \ }
let g:ctrlp_working_path_mode = 'a'

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
let g:vimfiler_edit_action = 'tabopen'

" octopress.vim"
let g:octopress_path = "$HOME/git/diary.soramugi.net"

" vim-indent-guides"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"macdict"
let g:macdict_window_size = 'botright 20split'

"w3m"
let g:w3m#search_engine = 'http://www.google.co.jp/search?ie=' . &encoding . '&q=%s'
let g:w3m#homepage = 'http://www.google.co.jp/'

"tagbar"
let g:tagbar_left = 1

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

"vim-splash"
let g:splash#path = $HOME."/.vim/bundle/7630711/vim_intro.txt"

"vim-auto-save"
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

let g:linktotag_link = 'http://soramugi.tumblr.com/random'

"vim-gista"
let g:gista#github_user = 'soramugi'

"dirvish"
augroup my_dirvish_events
    au!
    au User DirvishEnter let b:dirvish.showhidden = 1
augroup END

if argc() == 0 && exists('g:nerdtree_tabs_not_open') == 0
  let g:nerdtree_tabs_open_on_console_startup = 1
end

" j/kによる移動を速くする
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" vim-monsterを有効にする
let g:neocomplete#sources#omni#input_patterns = {
\  'ruby': '[^. *\t]\.\w*\|\h\w*::'
\}

" tsuquyomi"
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
