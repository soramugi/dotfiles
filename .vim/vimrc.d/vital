let V = vital#of("vital")
let S = V.import("Web.HTTP")
function! s:vital_test()
  let s:url = g:S.get('http://b.hatena.ne.jp/soramugi/bookmark')
  echo s:url
endfunction

command! -nargs=0 VitalTest :call s:vital_test()
