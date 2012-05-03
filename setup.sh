#!/bin/bash

#vimスクリプト管理ツールのインスコ
mkdir ~/.vim
git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim

#gitのエディタ
git config --global core.editor 'vim -c "set fenc=utf-8"'
#エイリアス
git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.ci 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

#シンボリックりんく
DOT_FILES=( .bashrc .vimrc .gvimrc .screenrc )
for file in ${DOT_FILES[@]}
do
if [ ! -e $HOME/$file ]
then
    ln -s $HOME/dotfiles/$file $HOME/$file
fi
done

#local環境設定ファイル
mkdir $HOME/.local
touch $HOME/.local/.vimrc.local
touch $HOME/.local/.gvimrc.local
touch $HOME/.local/.bashrc.local

#初期読み込み
source ~/.bashrc
