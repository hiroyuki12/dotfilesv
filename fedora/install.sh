#!/usr/bin/env bash


while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

# install serverkit
which gem > /dev/null || sudo dnf install rubygems
which bundle > /dev/null || sudo dnf install rubygem-bundler
bundle install > /dev/null
which serverkit > /dev/null || sudo gem install serverkit serverkit-atom serverkit-rbenv serverkit-homebrew
which serverkit > /dev/null ||  gem install serverkit serverkit-atom serverkit-rbenv serverkit-homebrew

# backup
cp ~/.bashrc ~/.bashrc.bak

# Run installer
#mkdir ~/github; cd github
#git clone https://github.com/hiroyuki12/dotfilesv
cd ~/github/dotfilesv/fedora
serverkit apply recipe.yml.erb

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


