#!/usr/bin/env bash


cat ./brewlist/homebrew-packages.txt > list.tmp
brew leaves >> list.tmp
sort list.tmp|uniq > ./brewlist/homebrew-packages.txt

cat ./brewlist/homebrew-cask.txt > list.tmp
brew cask list >> list.tmp
sort list.tmp|uniq > ./brewlist/homebrew-cask.txt

rm *.tmp
 
prompt "Cleanup"
brew cleanup
brew cask cleanup

