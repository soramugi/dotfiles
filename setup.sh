#!/bin/bash

mkdir ~/.vim.bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim.bundle/neobundle.vim

DOT_FILES=( .screenrc .vimrc .bashrc )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
