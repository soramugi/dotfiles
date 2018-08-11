"ruby"
autocmd BufRead,BufNewFile Gemfile       setfiletype ruby
autocmd BufRead,BufNewFile Podfile       setfiletype ruby
autocmd BufRead,BufNewFile Guardfile     setfiletype ruby
autocmd BufRead,BufNewFile Vagrantfile   setfiletype ruby
autocmd BufRead,BufNewFile Berksfile     setfiletype ruby
autocmd BufRead,BufNewFile Capfile       setfiletype ruby
autocmd BufRead,BufNewFile Fastfile      setfiletype ruby
autocmd BufRead,BufNewFile Appfile       setfiletype ruby
autocmd BufRead,BufNewFile Matchfile     setfiletype ruby
autocmd BufRead,BufNewFile Movefile      setfiletype ruby
autocmd BufRead,BufNewFile *.cap         setfiletype ruby
autocmd BufRead,BufNewFile *.rabl        setfiletype ruby
autocmd BufRead,BufNewFile *.jbuilder    setfiletype ruby
autocmd BufRead,BufNewFile *.ru          setfiletype ruby
autocmd BufRead,BufNewFile simplecov     setfiletype ruby
autocmd BufWinEnter,BufNewFile *_spec.rb setfiletype ruby.rspec
autocmd BufWinEnter,BufNewFile *_test.rb setfiletype ruby.unit


"php"
autocmd BufWinEnter,BufNewFile *Test.php setfiletype phpunit.php
autocmd BufWinEnter,BufNewFile *.ctp setfiletype smarty

"js.coffee"
autocmd BufRead,BufNewFile *.coffee    setfiletype coffee

"tags"
autocmd BufRead,BufNewFile *.tags    setfiletype tags

"xml"
autocmd BufRead,BufNewFile *.dist setfiletype xml

"yaml"
autocmd BufRead,BufNewFile Boxfile setfiletype yaml

"vim"
autocmd BufRead,BufNewFile test.vital setfiletype vital.vim
autocmd BufRead,BufNewFile t/*.vim setfiletype vim-flavor.vim

"toml"
autocmd BufRead,BufNewFile *.toml setfiletype toml

"blade"
autocmd BufRead,BufNewFile *.blade.php setfiletype blade

"swift"
autocmd BufRead,BufNewFile *.swift setfiletype swift
