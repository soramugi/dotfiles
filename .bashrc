# Control+sとかいらない
stty stop undef

# プロンプトの表示形式
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \W \$\[\033[00m\] "

# screenの履歴を共有
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

export EDITOR=vim
export HISTSIZE=9999
export HISTIGNORE='ls*:ll:history*'
export HISTTIMEFORMAT='%Y-%m-%d %T '
export CLICOLOR=1
export LS_COLORS='di=33'

alias ll='ls -laF'
alias ctags='ctags -a -f ~/.tags -R `pwd`'
alias sudo='sudo -H'
alias grep='grep --color=auto'
alias less='less -M'
alias eman='LANG=c man'

# local特別実装いれるとこ
if [ -f ~/dotfiles/.local/.bashrc ]; then
    . ~/dotfiles/.local/.bashrc
fi
