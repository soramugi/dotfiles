# ---------------------------------------------------------------------------
# パス
# ---------------------------------------------------------------------------

export PATH=$HOME/local/bin:$PATH
export PATH=./bin:vendor/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH

export EDITOR=vim

# ---------------------------------------------------------------------------
# 立ち上げ時にAAと名言
# ---------------------------------------------------------------------------

function random_cowsay() {
COWS=$(ls -1 `brew --prefix`/Cellar/cowsay/3.03/share/cows/)
COWS="$COWS $(cd ~/dotfiles/cows ;find `pwd` -maxdepth 1 -mindepth 1 -name *.cow)"
NBRE_COWS=$(for f in $COWS; do echo $f; done | wc -l)
COWS_RANDOM=$(expr $RANDOM % $NBRE_COWS + 1)
COW_NAME=$(for f in $COWS; do echo $f; done | awk -v COWS_RANDOM_AWK=$COWS_RANDOM 'NR == COWS_RANDOM_AWK {print $1}')
cowsay -f $COW_NAME "`Fortune -s`"
}
if type -P fortune cowsay >/dev/null && test "$TMUX"; then
  while :
  do
    random_cowsay 2>/dev/null && break
  done
fi

# ---------------------------------------------------------------------------
#  プロンプト
# ---------------------------------------------------------------------------

# C-sとC-qの機能解除
stty -ixon -ixoff
# 音
set bell-style none
# 表示形式ssh接続の時と色分ける
PS1="\`if [ \$? != 0 ]; then echo \[\e[31m\]o_O\[\e[0m\]; fi\`"
if [ -z "$SSH_CONNECTION" ]; then
  # not ssh
  PS1=$PS1"\[\033[0;32m\] \W \[\033[00m\]\[\033[1;33m\]\$\[\033[00m\] "
else
  # ssh
  PS1=$PS1"\[\033[0;35m\] \W \[\033[00m\]\[\033[1;33m\]\$\[\033[00m\] "
fi

# vim抜けたとき
if [[ -n "$VIMRUNTIME" ]]; then
  PS1="\[\033[0;33m\](vim)\[\033[00m\]"$PS1
fi


export CLICOLOR=1
export LS_COLORS='di=33'

# ---------------------------------------------------------------------------
#  仮想端末
# ---------------------------------------------------------------------------

# ssh接続の時に設定を変える
if [ ! -z "$SSH_CONNECTION" ]; then
  tmux set -t: status-bg colour200
fi

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
alias ag='ag -S'
export MANPAGER='less -R'
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}


# 短縮
alias ll='ls -laF'
alias l='ls -laF'
alias vi='vim'
alias v='vim'
alias agh='ag --hidden'
t () { tar zcvf `basename $1`.tar.gz $@; }
alias t-='tar zxvf'
g () { grep -lr $1 * | xargs grep -v -e "^[ \t]*[#*/]" | grep --color=auto $1; }
export GREP_OPTIONS='--color=auto --binary-files=without-match'
export GREP_OPTIONS='--exclude=*.git* --exclude=*.svn* --exclude=*tags* '$GREP_OPTIONS
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
alias gh='grep gi[t] ~/dotfiles/bashrc | sed "s/^alias\ //" | grep --color=auto -e "^[a-z]\+"'

# ディレクトリ移動
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'

# 拡張
alias vl='vim -u ~/dotfiles/vimrclite --noplugin'
alias eman='LANG=c man'
alias ctags_php='ctags -R --languages=php -f ~/php.tags `pwd`'
alias bf='cat > ~/.vim_bf'
alias bfcat='cat ~/.vim_bf'
alias saying='while (true) do f=$(fortune); echo "$f"; echo ""; say "$f"; sleep 10; done'
alias pong='perl -nle '\''print "display notification \"$_\" with title \"Terminal\""'\'' | osascript'

export MARKPATH=$HOME/.marks
function jump {
cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
rm -i $MARKPATH/$1
}
function marks {
ls -l $MARKPATH
}

function sum_num {
if [ -p /dev/stdin ]; then
  args=$(cat -)
else
  args=$*
fi

_num=0
for i in $args; do
  _num=$((_num+$i))
done
echo $_num
}
