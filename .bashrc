# プロンプトの表示形式
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \W \$\[\033[00m\] "

# Mac用man日本語化
# http://www.fan.gr.jp/~sakai/softwares/unix#wordhighlight_id18
if [ -f /usr/local/bin/jman ] ; then
  alias man='env LANG=ja_JP.UTF-8 /usr/local/bin/jman'
fi

# lsのカラー設定
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

alias ll='ls -laF'

# Control+sとかいらない
stty stop undef

# screenの履歴を共有
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

# local特別実装いれるとこ
if [ -f ~/.local/.bashrc.local ]; then
    . ~/.local/.bashrc.local
fi
