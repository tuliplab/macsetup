#!/usr/bin/env bash

echo "Update"
brew update
brew upgrade 
brew cask upgrade
brew cu -acy

echo "Cleanup"
brew cleanup -s
brew cask cleanup

echo "System Update"
npm update -g
mas outdated
 
echo "Checking"
brew doctor
brew missing
