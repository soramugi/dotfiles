#!/bin/bash

#gitのエディタ
git config --global core.editor 'vim -c "set fenc=utf-8"'
#エイリアス
git config --global alias.co 'checkout'
git config --global alias.st 'status'
git config --global alias.ci 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

# bashrcの書き込み
if [ ! -e $HOME/.bash_aliases ]
then
if [ -e $HOME/.profile ]
then
    echo 'screen -S mugi -D -RR' >> $HOME/.profile
else
    echo 'screen -S mugi -D -RR' >> $HOME/.bash_profile
    echo 'if [ -f ~/.bash_aliases ]; then' >> $HOME/.bashrc
    echo '    . ~/.bash_aliases' >> $HOME/.bashrc
    echo 'fi' >> $HOME/.bashrc
fi
fi

#シンボリックりんく
if [ ! -e $HOME/.bash_aliases ]
then
    ln -s $HOME/dotfiles/.bashrc $HOME/.bash_aliases
fi
DOT_FILES=( .vimrc .gvimrc .screenrc )
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
if [ -e $HOME/.profile ]
then
    source $HOME/.profile
fi
if [ -e $HOME/.bash_profile ]
then
    source $HOME/.bash_profile
fi
