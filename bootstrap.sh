#!/usr/bin/env bash

files="aliases bash_profile bash_prompt bashrc condarc curlrc functions gitconfig gitignore inputrc screenrc vimrc wgetrc tmux.conf"

function doIt() {
	cp -rf init ~/;
	mkdir -p ~/.vim/colors/ && cp solarized.vim ~/.vim/colors/;
	# for i3 window manager
	mkdir -p ~/.i3
	cp $opts $PWD/i3_config ~/.i3/config
	cp $opts {$PWD/,~/.}i3status.conf
	# the rest
	for f in $files; do cp -f $f ~/.$f; done;
	source ~/.bash_profile;
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
