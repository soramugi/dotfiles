# ---------------------------------------------------------------------------
# パス
# ---------------------------------------------------------------------------

export PATH=$HOME/local/bin:$PATH
export PATH=./bin:vendor/bin:$PATH
export PATH=$HOME/bin:$PATH

export EDITOR=vim

# ---------------------------------------------------------------------------
#  プロンプト
# ---------------------------------------------------------------------------

# C-sとC-qの機能解除
stty -ixon -ixoff
# 音
set bell-style none
# 表示形式
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;33m\] \W \$\[\033[00m\] "

export CLICOLOR=1
export LS_COLORS='di=33'

# ---------------------------------------------------------------------------
#  仮想端末
# ---------------------------------------------------------------------------

# tmuxでattachかnew-session
if type -P tmux >/dev/null ; then
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

export HISTSIZE=9999
export HISTTIMEFORMAT='%Y-%m-%d %T '

# ---------------------------------------------------------------------------
#  エイリアス
# ---------------------------------------------------------------------------

# 標準コマンド書き換え
alias sudo='sudo -H'
alias less='less -M'

# 短縮
alias ll='ls -laF'
alias l='ls -laF'
alias vi='vim'
alias v='vim'
t () { tar zcvf `basename $1`.tar.gz $@; }
alias t-='tar zxvf'
g () { grep -lr $1 * | xargs grep -v -e "^[ \t]*[#*/]" | grep --color=auto $1; }
export GREP_OPTIONS='--color=auto --exclude=*.git* --exclude=*.svn* --exclude=*tags*'
alias be='bundle exec'
alias fname='find . -name'
loop () { while (true) do $@ ; sleep 2; done;}

# for svn
alias st='svn st'
stl () { svn st  $@ | less; }
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
sdl () { svn di  $@ | less; }
alias sad='svn add'
alias sadd='svn st | grep '?' | sed 's/\?//' | xargs svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'
alias spll='svn pl -R ./ | grep "svn:" | sort | uniq -c' # 属性表示
alias scut='tr -s " " | cut -d  " " -f 2-'
alias sop='svn info | grep URL | cut -d " " -f 2- | xargs open' # mac & webdev svn
alias srm!='svn st | grep ! | tr -s " " | cut -d  " " -f 2- | xargs svn rm'

# for git
alias gs='git status'
alias gst='git status'
alias gd='git diff'
alias gdi='git diff'
alias gad='git add'
alias gci='git commit -a'
alias gp='git push'
alias gl='git pull'
alias glr='git pull --rebase' #本家 自分' ## fork元に追随
alias gre='git remote' #add 短縮名 git://huge.git'
alias gco='git checkout'
alias gb='git branch | grep "*" | cut -d " " -f 2-' # 今のブランチ名表示
alias gbr='git branch'
alias gbrd='git branch -d' #削除するbr
alias gbrp='git push origin' #:削除するリモートbr
alias gsb='git submodule'
alias gr='git checkout -- ' # 指定したファイルの変更巻き戻し
alias grh='git reset --soft HEAD'
alias grhh='git reset --hard HEAD'
# git alias help
alias gh='grep gi[t] ~/dotfiles/.bashrc | sed "s/^alias\ //" | grep --color=auto -e "^[a-z]\+"'

# ディレクトリ移動
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# 拡張
alias vl='vim -u ~/dotfiles/.vimrclite --noplugin'
alias eman='LANG=c man'
alias ctags_php='ctags -R --languages=php -f ~/php.tags `pwd`'
