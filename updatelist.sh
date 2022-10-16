#!/usr/bin/env bash

cat ./brewlist/homebrew-packages.txt > list.tmp
brew leaves >> list.tmp
sort list.tmp|uniq > ./brewlist/homebrew-packages.txt

cat ./brewlist/homebrew-cask.txt > list.tmp
brew list --cask >> list.tmp
sort list.tmp|uniq > ./brewlist/homebrew-cask.txt

rm *.tmp
brew cleanup

