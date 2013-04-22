let php_sql_query=1
let php_htmlInStrings=1
let php_noShortTags = 1
let php_folding = 1
set tabstop=4 shiftwidth=4 softtabstop=4
set tags+=$HOME/php.tags

set dictionary=~/.vim/dict/php.dict

let g:vim_tags_project_tags_command = "ctags -R --languages=php -f ~/php.tags `pwd` 2>/dev/null"

abbreviate <p <?php?><LEFT><LEFT>
