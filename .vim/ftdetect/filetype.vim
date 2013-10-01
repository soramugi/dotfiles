"ruby"
autocmd BufRead,BufNewFile Gemfile     setfiletype ruby
autocmd BufRead,BufNewFile Guardfile   setfiletype ruby
autocmd BufRead,BufNewFile Vagrantfile setfiletype ruby
autocmd BufRead,BufNewFile Capfile     setfiletype ruby
autocmd BufRead,BufNewFile *.rabl      setfiletype ruby
autocmd BufRead,BufNewFile *.jbuilder  setfiletype ruby
autocmd BufRead,BufNewFile *.ru        setfiletype ruby
autocmd BufWinEnter,BufNewFile *_spec.rb setfiletype ruby.rspec

"php"
autocmd BufWinEnter,BufNewFile *Test.php setfiletype phpunit.php

"js"
autocmd BufRead,BufNewFile *.coffee    setfiletype javascript

"tags"
autocmd BufRead,BufNewFile *.tags    setfiletype tags

"markdown"
autocmd BufRead,BufNewFile *.md setfiletype markdown

"xml"
autocmd BufRead,BufNewFile *.dist setfiletype xml

"yaml"
autocmd BufRead,BufNewFile Boxfile setfiletype yaml

"vim"
autocmd BufRead,BufNewFile vital setfiletype vital.vim
