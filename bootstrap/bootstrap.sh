#!/bin/sh

# Tells the shell script to exit if it encounters an error
set -e

# Log
# Duplicated code from log.sh
# since we cannot import a file when installing via cURL
function msg {
	echo  "\033[0;37m$1\033[0m";
}

function msg_ok {
	echo  "➜\033[1;32m $1 ✔\033[0m";
}

function msg_run {
	echo  "➜\033[1;35m $1 $ $2\033[0m";
}

# Hello
# Create your here: http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20
msg ' _____        _    __ _ _            '
msg '|  __ \      | |  / _(_) |           '
msg '| |  | | ___ | |_| |_ _| | ___  ___  '
msg '| |  | |/ _ \| __|  _| | |/ _ \/ __| '
msg '| |__| | (_) | |_| | | | |  __/\__ \ '
msg '|_____/ \___/ \__|_| |_|_|\___||___/ '
msg '                                     '


# Homebrew
if which brew &> /dev/null; then
	msg_ok "Homebrew"
else
  msg_install "Homebrew" "ruby -e $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Git
if which git &> /dev/null; then
	msg_ok "git"
else
	msg_run "git" "brew install git"
	brew install git
fi

# Dotfiles
if [[ -d "$HOME/.dotfiles" ]]; then
	msg_ok "dotfiles"
else
	msg_run "dotfiles" "git clone https://github.com/guilazzaris/dotfiles.git $HOME/.dotfiles"
	git clone https://github.com/guilazzaris/dotfiles.git $HOME/.dotfiles
fi

# Installers
# Find the installers and run them iteratively
cd "$HOME/.dotfiles/$(dirname $)"
sh install.sh
