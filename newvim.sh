mkdir -p $HOME/local/bin
mkdir -p $HOME/local/src
cd $HOME/local/src/
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar jxvf vim-7.3.tar.bz2
cd vim73

./configure \
--enable-multibyte \
--enable-xim \
--enable-fontset \
--with-features=big \
--prefix=$HOME/local

make
make install

echo "alias vim='$HOME/local/bin/vim'" >> $HOME/.local/.bashrc.local
