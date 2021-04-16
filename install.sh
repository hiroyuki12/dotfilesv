#!/usr/bin/env bash

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

cp .vimrc ~/
cp .gitconfig ~/
#mv ~/.bashrc ~/.bashrc.bak
#cp .bashrc ~/
mv ~/.zshrc ~/.zshrc.bak
cp .zshrc ~/

#sudo apt-get update
#sudo apt-get install git rubygems vnc-server vim

#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/hiroyuki/.bash_profile
#brew -v

#brew install rbenv
#brew reinstall ruby-build

#rbenv install 2.6.6


break;
;;
[Nn]* )
  echo "Skip Initial Setting"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;

