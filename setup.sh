#!/bin/bash

#vimスクリプト管理ツールのインスコ
mkdir ~/.vim.neobundle

#gitのエディタ
git config --global core.editor 'vim -c "set fenc=utf-8"'
#エイリアス
git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.ci 'commit'
git config --global alias.df 'diff'
git config --global alias.br 'branch'

#シンボリックりんく
DOT_FILES=( .bashrc .vimrc .gvimrc .vim .screenrc )
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
