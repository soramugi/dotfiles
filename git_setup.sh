#!/bin/bash

#gitの設定とか
git config --global init.templatedir '~/dotfiles/.git_tmp'

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
git config --global push.default current

# カラー
git config --global color.ui true

# サブモジュール
if [ -e $HOME/dotfiles/.gitmodules ] ; then
  git submodule init
  git submodule update
fi

# 大事
if [ ! -e $HOME/dotfiles/.vim/bundle/neobundle.vim ] ; then
  git clone git://github.com/Shougo/neobundle.vim.git $HOME/dotfiles/.vim/bundle/neobundle.vim
fi
