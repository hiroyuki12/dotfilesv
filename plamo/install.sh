#!/usr/bin/env bash

echo 'plamo install.sh'

while true; do
read -p 'Now Install Homebrew? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

#install Homebrew
which /home/linuxbrew/.linuxbrew/bin/brew > /dev/null
if [ $? -ne 0 ]; then
  sudo ln -s /usr/bin/touch /bin/touch
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

sudo cp lightdm_display.sh /etc/lightdm/
sudo chmod +x /etc/lightdm/lightdm_display.sh


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
read -p 'Now Install rbenv & serverkit? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

#install rbenv
which rbenv > /dev/null
if [ $? -ne 0 ]; then
  brew install rbenv
fi

rbenv --version

source ~/.bashrc
rbenv install -l
rbenv install 2.7.3
rbenv versions
rbenv global 2.7.3
ruby -v

# install serverkit
which bundle > /dev/null || sudo gem install bundler
bundle install > /dev/null

# Run installer (ruby 2.7.3)
serverkit apply ~/github/dotfilesv/plamo/recipe.yml.erb

break;
;;
[Nn]* )
  echo "Skip Install rbenv"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;
