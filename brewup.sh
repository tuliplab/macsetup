#!/usr/bin/env bash


echo "Update"
# Update cleanup
curl -fsSL "https://raw.githubusercontent.com/fwartner/mac-cleanup/master/installer.sh" | bash -s update
brew update
brew upgrade 
brew cask upgrade
brew cu -acy

echo "Cleanup"
brew cleanup -s
brew cask cleanup
sudo cleanup

echo "System Update"
npm update -g
mas outdated
 
echo "Checking"
brew doctor
brew missing

