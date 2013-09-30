" octopressの記事追加したらgit commitのやつ"
function! s:octopress_git(message)
  if a:message == ''
    exe "!cd " . g:octopress_path . " && git add -A && git ci -m \"`date`\" && git push "
  else
    exe "!cd " . g:octopress_path . " && git add -A && git ci -m " a:message "&& git push "
  endif
endfunction

command! -nargs=? OctopressGit :call s:octopress_git(<q-args>)
