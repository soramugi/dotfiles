# ---------------------------------------------------------------------------
#  プロンプト
# ---------------------------------------------------------------------------

# C-sとC-qの機能解除
stty -ixon -ixoff
# 音
set bell-style none
# 表示形式
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \W \$\[\033[00m\] "

# ---------------------------------------------------------------------------
#  標準変数
# ---------------------------------------------------------------------------

export PATH=$HOME/bin:$HOME/local/bin:$PATH
export CLICOLOR=1
export LS_COLORS='di=33'
export EDITOR=vim
export HISTSIZE=9999
export HISTTIMEFORMAT='%Y-%m-%d %T '

# ---------------------------------------------------------------------------
#  仮想端末
# ---------------------------------------------------------------------------

# tmuxでattachかnew-session
if which tmux 2>&1 >/dev/null; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# 履歴を共有
function share_history {
history -a
history -c
history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# ---------------------------------------------------------------------------
#  エイリアス
# ---------------------------------------------------------------------------

# 標準コマンド書き換え系
alias sudo='sudo -H'
alias less='less -M'
alias grep='grep --color=auto'

# 短縮
alias ll='ls -laF'
alias l='ls -laF'
alias vi='vim'
alias v='vim'
alias t='tar zxvf'
alias t-='tar xvf -'

# for svn
alias s='svn'
alias st='svn st'
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
function sdl () { svn di  $@ | less; }
alias sad='svn add'
alias sadd='svn st | grep '?' | sed 's/\?//' | xargs svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'
alias spll='svn pl -R ./ | grep "svn:" | sort | uniq -c' # 属性表示

# for git
alias g='git'
alias gs='git status'
alias gst='git status'
alias gd='git diff'
alias gdi='git diff'
alias gad='git add'
alias gci='git commit'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gbr='git branch'
alias gsb='git submodule'
alias grh='git reset --soft HEAD'
alias grhh='git reset --hard HEAD'

# オリジナル
alias vl='vim -u ~/dotfiles/.vimrclite --noplugin'
alias eman='LANG=c man'
alias ctags_php='ctags --languages=PHP --langmap=PHP:.php --exclude="*.js" --php-types=c+f+d -f ~/php.tags -R `pwd` -a'
function pgrep () { grep -rnIH --color=auto --include=*.php $@ *; }
