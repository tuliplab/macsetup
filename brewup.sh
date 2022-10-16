#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

echo "Update"

brew update
brew upgrade 
brew cu -acy

echo "Cleanup"
brew cleanup -s



echo "System Update"
#npm update -g
#npm install -g npm

mas outdated
 
echo "Checking"
brew doctor
brew missing

