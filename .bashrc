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

export PATH=~/bin:$PATH
export PATH=~/local/bin:$PATH
export CLICOLOR=1
export LS_COLORS='di=33'
export EDITOR=vim
export HISTSIZE=9999
export HISTTIMEFORMAT='%Y-%m-%d %T '

# ---------------------------------------------------------------------------
#  screen
# ---------------------------------------------------------------------------

# screenの履歴を共有
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
alias st='svn st'
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
alias sdl='svn di | less'
alias sad='svn add'
alias sadd='svn st | grep '?' | sed 's/\?//' | xargs svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'
alias spll='svn pl -R ./ | grep "svn:" | sort | uniq -c'


# for git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'
alias gb='git branch'
alias gsb='git submodule'
alias grh='git reset --soft HEAD'
alias grhh='git reset --hard HEAD'

# オリジナル
alias vl='vim -u ~/dotfiles/.vimrclite --noplugin'
alias eman='LANG=c man'
alias ctags_php='ctags --languages=PHP --langmap=PHP:.php --exclude="*.js" --php-types=c+f+d -f ~/php.tags -R `pwd` -a'
function pgrep () { grep -rnIH --color=auto --include=*.php $@ *; }

# ---------------------------------------------------------------------------
#  別ファイル読み込み
# ---------------------------------------------------------------------------

if [ -f ~/dotfiles/.local/.bashrc ]; then
    . ~/dotfiles/.local/.bashrc
fi
