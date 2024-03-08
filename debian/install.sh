#!/usr/bin/env bash

echo 'debian install.sh'


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
which gem > /dev/null || sudo apt install rubygems
#which bundle > /dev/null || sudo apt install rubygem-bundler
#bundle install > /dev/null
which serverkit > /dev/null || sudo gem install serverkit serverkit-atom serverkit-rbenv serverkit-homebrew

# backup
cp ~/.bashrc ~/.bashrc.bak

# Run installer
#mkdir ~/github; cd github
#git clone https://github.com/hiroyuki12/dotfilesv
cd ~/github/dotfilesv/debian
serverkit apply recipe.yml.erb

sudo update-alternatives --set editor /usr/bin/vim.basic
sudo apt install vim cifs-utils gnome-shell-extension-dashtodock

LANG=C xdg-user-dirs-gtk-update
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


