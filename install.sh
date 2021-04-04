#!/usr/bin/env bash

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

cp .vimrc ~/
cp .gitconfig ~/
mv ~/.bashrc ~/.bashrc.bak
cp .bashrc ~/

sudo apt-get update
sudo apt-get install git rbenv ruby-build

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/hiroyuki/.bash_profile

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

#rm ~/.bashrc
#ln -s ~/github/dotfilesv/.bashrc ~/.bashrc
#source ~/.bashrc
