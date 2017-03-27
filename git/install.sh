#!/bin/bash

# Check if exist gitconfig file
if [ -e "$HOME/.gitconfig" ]; then
  rm -f $HOME/.gitconfig
fi

ln -s $HOME/.dotfiles/git/.gitconfig ~/.gitconfig
echo "~/.gitconfig [installed]"
