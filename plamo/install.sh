#!/usr/bin/env bash

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

sudo cp lightdm_display.sh /etc/lightdm/
sudo chmod +x /etc/lightdm/lightdm_display.sh

# install serverkit
#which gem > /dev/null || sudo apt-get install gem
which bundle > /dev/null || sudo gem install bundler
bundle install > /dev/null

# Run installer
mkdir ~/github
git clone https://github.com/hiroyuki12/dotfilesv
cd ~/github/dotfilesv/plamo
#~/bin/serverkit apply recipe.yml.erb

#sudo apt-get update
#sudo apt-get install git rubygems vnc-server vim

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


while true; do
read -p 'Now Install Homebrew? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

#install Hombrew
which /home/linuxbrew/.linuxbrew/bin/brew > /dev/null
if [ $? -ne 0 ]; then
  sudo ln -s /usr/bin/touch /bin
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
fi

/home/linuxbrew/.linuxbrew/bin/brew -v

#brew install rbenv
#brew reinstall ruby-build

#rbenv install 2.6.6

break;
;;
[Nn]* )
  echo "Skip Install Homebrew"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;