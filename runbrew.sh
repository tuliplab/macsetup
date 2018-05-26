#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Install Xcode"
  xcode-select --install

  prompt "Install Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Update Homebrew"
  brew update
  brew upgrade
fi

brew doctor
brew tap caskroom/versions
brew tap caskroom/drivers
brew tap caskroom/fonts 
brew tap buo/cask-upgrade
brew tap Homebrew/bundle

cat ./brewlist/homebrew-packages.txt|xargs brew install
cat ./brewlist/homebrew-cask.txt|xargs brew cask install

# run from dumped Brewfile
cd ./brewlist
brew bundle
# backup all bundles
brew bundle dump

echo "Cleanup"
brew cleanup
brew cask cleanup

# Install Hexo Related Packages
npm install hexo-cli -g

npm install hexo-deployer-git --save
npm install hexo-generator-searchdb --save
npm install hexo-generator-feed --save
npm install hexo-generator-sitemap --save
# Replace render
npm un hexo-renderer-marked --save
npm i hexo-renderer-markdown-it --save

