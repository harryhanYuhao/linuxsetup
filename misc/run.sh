#!/bin/sh

set -e

help(){
	echo "run.sh: install current config to system, or update current file with system configs"
	echo 
	echo "syntax: run.sh -[h|i|u|p]"
	echo "Options:"
	echo "-h		show this help message"
	echo "-i		install the configuration in this folder to system"
	echo "-u		update files in this folder with system configuration"
}

install(){
	if [[ -f ~/.bashrc ]]; then
		echo "file ~/.bashrc exist! create backup and replace it? (y/n)"
	fi 
	read answer
	if [[ "$answer" == "y" ]]; then
		cp ./bashrc ~/.bashrc --backup=t
	fi
	unset answer

	if [[ -d ~/.bashrc.d ]]; then
		echo "file ~/.bashrc.d exist! create backup and replace it? (y/n)"
	fi 
	read answer
	if [[ "$answer" == "y" ]]; then
		cp ./bashrc.d ~/.bashrc.d -r --backup=t
	fi
	unset answer

	if [[ -d ~/.bashrc.cmd.d ]]; then
		echo "file ~/.bashrc.cmd.d exist! create backup and replace it? (y/n)"
	fi 
	read answer
	if [[ "$answer" == "y" ]]; then
		cp ./bashrc.cmd.d ~/.bashrc.cmd.d -r --backup=t
	fi
	unset answer
}

while getopts ":hiup" option; do
	case $option in
		h)
			help
			exit 0
			;;
		i)
			install
			exit 0
			;;
		\?)
			echo Invalid option!
			echo
			help
			exit 0
			;;
	esac
done

