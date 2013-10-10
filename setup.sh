#!/bin/sh

# gitの設定読み込み
if [ -e $HOME/dotfiles/git_setup.sh ] ; then
  . $HOME/dotfiles/git_setup.sh
fi

git pull

. ~/dotfiles/neoinstall

# dictファイルの作成
if type -P php > /dev/null ; then
  php ~/dotfiles/.vim/dict/dict.php | sort > ~/dotfiles/.vim/dict/php.dict 2>&1 /dev/null
fi

if type -P composer > /dev/null ; then
  if [ ! -e $HOME/.composer/vendor/bin/phpunit ]  ; then
    composer global require 'phpunit/phpunit=3.7.*'
  fi
  if [ ! -e $HOME/.composer/vendor/bin/phpctags ]  ; then
    composer global require 'techlivezheng/phpctags=*'
    cd $HOME/.composer/vendor/techlivezheng/phpctags/
    make
    mkdir -p $HOME/.composer/vendor/bin
    ln -s $HOME/.composer/vendor/techlivezheng/phpctags/build/phpctags.phar $HOME/.composer/vendor/bin/phpctags
  fi
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
DOT_FILES=".vimrc .gvimrc .tmux.conf .ctags .vim .bash_completion .gemrc"
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
