# Setup Mac

## やること
- `setup.sh`
- 環境設定　
- .bashrc

## setup.sh
`./setup.sh`を実行

### やってること
- brew, cask のインストール
- 主要なアプリのインストール
- GUIで変更できない部分のMacセットアップ
- 開発環境の構築

## .bashrc

```
export LANG=ja_JP.UTF-8

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\n\[\e[32m\]\w \[\e[35m\]$(__git_ps1 [%s])\[\e[00m\]0m\] \n \[\e[1;37m\]→\[\e[m\] ' \n \[\e[1;37m\]→\[\e[m\] '

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -GF"
alias ll="ls -la"
```

## TODO
すべて自動化したい
