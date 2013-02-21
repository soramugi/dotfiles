#!/bin/sh

# debian
if which apt-get 2>&1 >/dev/null; then
  sudo apt-get install mercurial libncurses-dev make gcc wget
fi

# redhat
if which yum 2>&1 >/dev/null; then
  sudo yum install mercurial ncurses-devel make gcc wget
fi

mkdir -p $HOME/local/bin
mkdir -p $HOME/local/src


# vim install
cd $HOME/local/src/
hg clone https://vim.googlecode.com/hg/ vim
cd vim
./configure \
  --prefix=$HOME/local \
  --enable-multibyte \
  --disable-selinux

make
sudo make install


# libevent-2* install
cd $HOME/local/src/
wget https://github.com/downloads/libevent/libevent/libevent-2.0.17-stable.tar.gz --no-check-certificate
tar zxvf libevent-2.0.17-stable.tar.gz

cd $HOME/local/src/libevent-2.0.17-stable/
./configure --prefix=$HOME/local
make
sudo make install


# tmux install
cd $HOME/local/src/
wget http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.6/tmux-1.6.tar.gz
tar zxvf tmux-1.6.tar.gz

cd $HOME/local/src/tmux-1.6
./configure --prefix=$HOME/local \
  CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" \
  LDFLAGS="-static -L$HOME/local/include -L$HOME/local/ncurses -L$HOME/local/lib"
make
sudo make install
