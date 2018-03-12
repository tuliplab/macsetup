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
brew tap buo/cask-upgrade

cat ./brewlist/homebrew-packages.txt|xargs brew install
cat ./brewlist/homebrew-cask.txt|xargs brew cask install

echo "Cleanup"
brew cleanup
brew cask cleanup
