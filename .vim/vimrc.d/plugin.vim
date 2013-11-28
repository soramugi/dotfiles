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
      \   'ruby.rspec'  : { 'type' : executable('rspec') ? 'rspec' : 'ruby'  },
      \   'rspec'  : { 'command' : 'rspec' },
      \   'ruby.unit' : { 'command' : 'rake', 'args' : 'test' },
      \   'phpunit.php' : { 'type' : executable('phpunit') ? 'phpunit' : 'php' },
      \   'phpunit' : { 'command' : 'phpunit', 'cmdopt' : '--stderr' },
      \   'vital.vim' : { 'command' : '~/dotfiles/vital_test' },
      \   'vim-flavor.vim' : { 'command' : 'rake', 'args' : 'test' },
      \}

" 保存したら実行"
augroup test
  autocmd!
  autocmd BufWritePost *_test.rb :QuickRun
  autocmd BufWritePost test.vital :QuickRun
  autocmd BufWritePost t/*.vim :QuickRun
augroup END

" taglist.vim
set tags=tags
let Tlist_Show_One_File      = 1
let Tlist_Exit_OnlyWiindow   = 1
let Tlist_Enable_Fold_Column = 1
let g:tlist_php_settings     = 'php;c:class;d:constant;f:function'

" syntastic.vim
let g:syntastic_enable_signs  = 1
let g:syntastic_auto_loc_list = 2
""let g:syntastic_check_on_open = 1
let g:syntastic_php_phpcs_args = '--encoding=utf-8 --report=csv --standard=./phpcs.xml'

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
""let s:bundle = neobundle#get("netrw")
""function! s:bundle.hooks.on_source(bundle)
""  let g:netrw_liststyle    = 3
""  let g:netrw_winsize      = 100
""  let g:netrw_altv         = 1
""  let g:netrw_browse_split = 3
""  let g:netrw_list_hide    = '\.git,\.svn,\.DS_Store'
""endfunction
""unlet s:bundle

" Align"
let g:Align_xstrlen = 3

" memolist.vim
let g:memolist_path = "$HOME/Dropbox/Memo"

autocmd FileType gitcommit DiffGitCached | only | split | b 1

"vimfiler"
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_edit_action = 'tabopen'

" octopress.vim"
let g:octopress_path = "$HOME/Dropbox/code/diary.soramugi.net"

" vim-indent-guides"
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

"macdict"
let g:macdict_window_size = 'botright 20split'

"tagbar"
let g:tagbar_left = 1

"wauto.vim"
let g:auto_write = 1
nmap <Leader>s  <Plug>(AutoWriteStart)
nmap <Leader>ss <Plug>(AutoWriteStop)

"vim-auto-save"
let g:auto_save = 1
let g:auto_save_no_updatetime = 1

"auto-ctags.vim"
set tags+=.svn/tags,.svn/php.tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_filetype_mode = 1
