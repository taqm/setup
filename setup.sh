#!/bin/bash

# Homebrew install (https://brew.sh/index_ja)
echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew upgrade
brew cask upgrade

# 必要なアプリをインストールしていく
echo "Install Application"

brew cask install google-chorome
brew cask install visual-studio-code
brew cask install docker
brew cask install hyper
brew cask install alfred

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true # ネットワークディスクで、`.DS_Store` ファイルを作らない
defaults write com.apple.screencapture type -string "png" # スクリーンショットの保存形式を PNG にする

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false # 拡張子変更時の警告を無効化する
defaults write com.apple.finder QLEnableTextSelection -bool true # クイックルックでテキストを選択可能にする
defaults write com.apple.finder QuitMenuItem -bool true # Finder を終了させる項目を追加する
defaults write com.apple.finder ShowPathbar -bool true # パスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true # ステータスバーを表示する
defaults write com.apple.finder ShowTabView -bool true # タブバーを表示する

echo "Setup develop tools"
echo "======================="

brew install jq
brew install tree
brew install git

# https://github.com/anyenv/anyenv
brew install anyenv
echo 'eval "$(anyenv init -)"' >> ~/.bashrc
exec $SHELL -l

# Start setup node --------------------
echo "Setup node"
anyenv install nodenv

NODE_LTS="10.15.3" # 置き換えて！！！
nodenv install $NODE_LTS
nodenv global $NODE_LTS

brew install yarn # ここでnodeが依存に入ってくるが無視

# Start setup Golang --------------------
brew install go

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash
