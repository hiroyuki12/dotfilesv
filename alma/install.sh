#!/usr/bin/env bash


while true; do
read -p 'Now install rbenv? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo dnf install bzip2 gcc openssl-devel readline-devel zlib-devel perl-FindBin perl-File-Compare patch perl-lib ibus-anthy

break;
;;
[Nn]* )
  echo "Skip install rbenv"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;



while true; do
read -p 'Now Add 3 line .bash_profile for rbenv? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

echo '# rbenv' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

exec $SHELL --login

#echo "Require logout"

break;
;;
[Nn]* )
  echo "Skip Add 3 line .bash_profile for rbenv"
  break;
  ;;
* )
  echo Please answer YES or NO.
esac
done;







while true; do
read -p 'Now install ruby 2.7.6? [Y/n]' Answer
case $Answer in
  '' | [Yy]* )

rbenv install 2.7.6
rbenv global 2.7.6

echo "Requires logout"

break;
;;
[Nn]* )
  echo "Skip install ruby 2.7.6"
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
which gem > /dev/null || sudo dnf install rubygems
which bundle > /dev/null || sudo dnf install rubygem-bundler
bundle install > /dev/null
gem install serverkit

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


