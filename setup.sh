#!/bin/bash

# Homebrew install (https://brew.sh/index_ja)
brew upgrade

echo "Install Application"

brew install git
brew install jq
brew install vim
brew install ghq
brew install peco
brew install asdf
brew install tree
brew install curl
brew install direnv
brew install zsh
brew install zsh-completions
brew install exa bat fd
brew install zsh-completions

brew install --cask google-chrome
brew install --cask google-japanese-ime
brew install --cask slack
brew install --cask goland
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask alfred
brew install --cask brave-browser
brew install --cask '1password'

# ネットワークディスクで、`.DS_Store` ファイルを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

 # スクリーンショットの保存形式を PNG にする
defaults write com.apple.screencapture type -string "png"

 # Finder のタイトルバーにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

 # 拡張子変更時の警告を無効化する
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# クイックルックでテキストを選択可能にする
defaults write com.apple.finder QLEnableTextSelection -bool true

 # Finder を終了させる項目を追加する
defaults write com.apple.finder QuitMenuItem -bool true

# パスバーを表示する
defaults write com.apple.finder ShowPathbar -bool true

 # ステータスバーを表示する
defaults write com.apple.finder ShowStatusBar -bool true

 # タブバーを表示する
defaults write com.apple.finder ShowTabView -bool true

# 拡張子表示
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder


# zshの設定

for f in $(ls dotfiles)
do
  ln -s $HOME/setup/dotfiles/$f $HOME/.$f
done

mkdir ~/.zsh
curl -o ~/.zsh/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# git alias
git config --global alias.sw 'switch'
git config --global alias.fe 'fetch -p'
git config --global alias.pH 'push origin HEAD'
git config --global alias.co 'checkout'
git config --global alias.rema '!git fe; git rebase origin/master'

