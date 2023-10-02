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
	echo todo!
}

update(){
	cp -r ~/.bashrc.d -t .
	mv .bashrc.d bashrc.d
	cp -r ~/.bashrc.cmd.d -t .
	mv .bashrc.cmd.d bashrc.cmd.d
	cp ~/.bashrc -t .
	mv .bashrc bashrc
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
		u)
			update
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

