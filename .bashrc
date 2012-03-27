# プロンプトの表示形式
PS1="\h: \W $ "

# Mac用man日本語化
# http://www.fan.gr.jp/~sakai/softwares/unix#wordhighlight_id18
if [ -f /usr/local/bin/jman ] ; then
  alias man='env LANG=ja_JP.UTF-8 /usr/local/bin/jman'
fi

# lsのカラー設定
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

alias ll='ls -l'
