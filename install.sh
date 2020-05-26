#!/usr/bin/env bash

cp .vimrc ~/

rm ~/.bashrc
ln -s ~/github/dotfilesv/.bashrc ~/.bashrc
source ~/.bashrc
