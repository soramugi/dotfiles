#!/bin/sh

# debian
if type -t apt-get ; then
  sudo apt-get install mercurial libncurses-dev make gcc wget
fi

# redhat
if type -t yum ; then
  sudo yum install mercurial ncurses-devel make gcc wget
fi

mkdir -p $HOME/local/bin
mkdir -p $HOME/local/src


# vim install
if [ ! -e $HOME/local/src/vim ] ; then
  cd $HOME/local/src/
  if type -t hg ; then
    hg clone https://vim.googlecode.com/hg/ vim
  else
    wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
    bzip2 -dc vim-7.3.tar.bz2 | tar xvf -
    mv vim73 vim
  fi
  cd vim
  ./configure \
    --prefix=$HOME/local \
    --enable-multibyte \
    --disable-selinux

  make
  sudo make install
fi


# libevent-2* install
if [ ! -e $HOME/local/src/libevent-2.0.17-stable.tar.gz ] ; then
  cd $HOME/local/src/
  wget https://github.com/downloads/libevent/libevent/libevent-2.0.17-stable.tar.gz --no-check-certificate
  tar zxvf libevent-2.0.17-stable.tar.gz

  cd $HOME/local/src/libevent-2.0.17-stable/
  ./configure --prefix=$HOME/local
  make
  sudo make install
fi


# tmux install
if [ ! -e $HOME/local/src/tmux-1.6.tar.gz ] ; then
  cd $HOME/local/src/
  wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.6/tmux-1.6.tar.gz
  tar zxvf tmux-1.6.tar.gz

  cd $HOME/local/src/tmux-1.6
  ./configure --prefix=$HOME/local \
    CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" \
    LDFLAGS="-static -L$HOME/local/include -L$HOME/local/ncurses -L$HOME/local/lib"
  make
  sudo make install
fi


# ctags install
if [ ! -e $HOME/local/src/ctags-5.8.tar.gz ] ; then
  cd $HOME/local/src/

  wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
  tar zxf ctags-5.8.tar.gz
  cd ctags-5.8
  ./configure --prefix=$HOME/local
  make
  sudo make install
fi

