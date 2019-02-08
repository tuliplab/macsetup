#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

echo "Update"

# Update cleanup
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s update

brew update
brew upgrade 
brew cask upgrade
brew cu -acy

echo "Cleanup"
brew cleanup -s
sudo cleanup
sudo find ~/ -name ".DS_Store" -delete
# curl -fsSL "https://raw.githubusercontent.com/mengfeng/clean-my-mac/master/clean_my_mac.sh" | bash

echo "System Update"
npm update -g
npm install -g npm
mas outdated
 
echo "Checking"
brew doctor
brew missing

