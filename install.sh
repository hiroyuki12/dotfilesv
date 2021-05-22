#!/usr/bin/env bash

while true; do
read -p 'Now Install Homebrew? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

#install Homebrew
which /home/linuxbrew/.linuxbrew/bin/brew > /dev/null
if [ $? -ne 0 ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo '# Homebrew' >> /home/hiroyuki/.bash_profile
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/hiroyuki/.bash_profile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

/home/linuxbrew/.linuxbrew/bin/brew -v

# brew help
# brew update
# brew doctor
# brew install wget

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

while true; do
read -p 'Now Initial Setting? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

which rpmbuild > /dev/null || sudo apt-get install rpm-build

sudo cp lightdm_display.sh /etc/lightdm/
sudo chmod +x /etc/lightdm/lightdm_display.sh

# install serverkit
which gem > /dev/null || sudo apt-get install gem
which bundle > /dev/null || sudo gem install bundler
bundle install > /dev/null

# backup
cp ~/.bashrc ~/.bashrc.bak

# Run installer
#mkdir ~/github
#git clone https://github.com/hiroyuki12/dotfilesv
cd ~/github/dotfilesv
~/bin/serverkit apply recipe.yml.erb

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


