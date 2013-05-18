#!/bin/sh

if [ ! -f /usr/local/bin/brew ] ; then
  ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
fi

if [ ! -f /usr/local/bin/macvim ] ; then
  /usr/local/bin/brew install macvim --override-system-vim
fi

if [ ! -f /usr/local/bin/tmux ] ; then
  /usr/local/bin/brew install tmux
fi

cd ~/Downloads/
if [ ! -d ~/Downloads/tmux-MacOSX-pasteboard ] ; then
  git clone git://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
fi
cd tmux-MacOSX-pasteboard

if [ ! -d ~/bin ] ; then
  mkdir ~/bin
fi
make reattach-to-user-namespace
cp reattach-to-user-namespace ~/bin

if [ -f ~/.bash_profile ] ; then
  echo 'if [ -f ~/.bashrc ] ; then . ~/.bashrc; fi' > ~/.bash_profile
fi
