# プロンプトの表示形式
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \W \$\[\033[00m\] "

#vimです
export EDITOR=vim

#lsのカラー設定
export CLICOLOR=1
LS_COLORS='di=33';
export LS_COLORS

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
export HISTIGNORE=ls:ll:history
export HISTTIMEFORMAT='%Y-%m-%d %T '

# local特別実装いれるとこ
if [ -f ~/.local/.bashrc.local ]; then
    . ~/.local/.bashrc.local
fi
