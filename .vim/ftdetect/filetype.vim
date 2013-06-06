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
autocmd BufWinEnter,BufNewFile *Test.php setfiletype php.phpunit

"js"
autocmd BufRead,BufNewFile *.coffee    setfiletype javascript

"tags"
autocmd BufRead,BufNewFile *.tags    setfiletype tags


