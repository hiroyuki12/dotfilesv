#!/usr/bin/env bash

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

cp .vimrc ~/

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
