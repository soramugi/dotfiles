" http://blog.supermomonga.com/articles/vim/taiwa.html
function! SelectInteractive(question, candidates) " {{{
  try
    let a:candidates[0] = toupper(a:candidates[0])
    let l:select = 0
    while index(a:candidates, l:select, 0, 1) == -1
      let l:select = input(a:question . ' [' . join(a:candidates, '/') . '] ')
      if l:select == ''
        let l:select = a:candidates[0]
      endif
    endwhile
    return tolower(l:select)
  finally
    redraw!
  endtry
endfunction " }}}

function! BufferWipeoutInteractive() " {{{
  if &modified == 1
    let l:selected = SelectInteractive('Buffer is unsaved. What should I do?', ['q', 'w', 'n'])
    if l:selected == 'w'
      write
      quit
    elseif l:selected == 'q'
      quit!
    endif
  else
    quit
  endif
endfunction " }}}

nnoremap <C-q> :call BufferWipeoutInteractive()<cr>
