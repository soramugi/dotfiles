#!/bin/bash

# gitの設定読み込み
if [ -e $HOME/dotfiles/gitSetup.sh ] ; then
  source $HOME/dotfiles/gitSetup.sh
fi

# bashrcの書き込み
if [ ! -e $HOME/.bash_aliases ] && [ ! -e $HOME/.profile ] ; then
  echo 'if [ -f ~/.bash_aliases ] ; then' >> $HOME/.bashrc
  echo '    . ~/.bash_aliases' >> $HOME/.bashrc
  echo 'fi' >> $HOME/.bashrc
fi

# aliase
if [ ! -e $HOME/.bash_aliases ] ; then
  ln -s $HOME/dotfiles/.bashrc $HOME/.bash_aliases
fi
DOT_FILES=( .vimrc .gvimrc .tmux.conf )
for file in ${DOT_FILES[@]}
do
  if [ ! -e $HOME/$file ] ; then
    ln -s $HOME/dotfiles/$file $HOME/$file
  fi
done

#初期読み込み
if [ -e $HOME/.profile ] ; then
  source $HOME/.profile
fi
if [ -e $HOME/.bash_profile ] ; then
  source $HOME/.bash_profile
fi
