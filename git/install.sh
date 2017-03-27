#!/bin/bash

# Check if exist gitconfig file
if [ -e "$HOME/.gitconfig" ]; then
  rm -f $HOME/.gitconfig
fi

ln -s $HOME/.dotfiles/git/.gitconfig ~/.gitconfig
echo "~/.gitconfig [installed]"

# Check if exist gitignore_global file
if [ -e "$HOME/.gitignore_global" ]; then
  rm -f $HOME/.gitignore_global
fi

ln -s $HOME/.dotfiles/git/.gitignore_global ~/.gitignore_global
echo "~/.gitignore_global [installed]"

git config --global core.excludesfile ~/.gitignore_global
