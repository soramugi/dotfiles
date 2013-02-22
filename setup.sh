#!/bin/sh

# gitの設定読み込み
if [ -e $HOME/dotfiles/git_setup.sh ] ; then
  . $HOME/dotfiles/git_setup.sh
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
DOT_FILES=".vimrc .gvimrc .tmux.conf .ctags"
for file in $DOT_FILES
do
  if [ ! -e $HOME/$file ] ; then
    ln -s $HOME/dotfiles/$file $HOME/$file
  fi
done

# reload
if [ -e $HOME/.profile ] ; then
  . $HOME/.profile
fi
if [ -e $HOME/.bash_profile ] ; then
  . $HOME/.bash_profile
fi
