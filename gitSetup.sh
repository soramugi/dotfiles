#!/bin/bash

#gitの設定とか

#エディタ
git config --global core.editor 'vim -c "set fenc=utf-8"'

#エイリアス
git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.ci 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'
git config --global alias.sub 'submodule'
git config --global alias.gr 'log --graph --date=short --decorate=short --pretty=format:"%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s"'

# サブモジュール
git submodule init
git submodule update
