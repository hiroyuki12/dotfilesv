#!/usr/bin/env bash

echo 'vine install.sh'

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

# install serverkit
which gem > /dev/null || sudo pacman -S ruby
which bundle > /dev/null || sudo pacman -S ruby
#bundle install > /dev/null
which serverkit > /dev/null || sudo gem install serverkit serverkit-atom serverkit-rbenv serverkit-homebrew
which serverkit > /dev/null || gem install serverkit serverkit-atom serverkit-rbenv serverkit-homebrew

# backup
cp ~/.bashrc ~/.bashrc.bak

# Run installer
cd ~/github/dotfilesv/univalent
/home/hiroyuki/.local/share/gem/ruby/3.0.0/bin/serverkit apply recipe.yml.erb

which vim > /dev/null || sudo pacman -S vim
#sudo update-alternatives --set editor /usr/bin/vim.basic

sudo pacman -S fcitx5-im fcitx5-mozc cifs-utils

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


