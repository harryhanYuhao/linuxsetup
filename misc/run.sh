#!/bin/sh

help(){
	echo "run.sh: install current config to system, or update current file with system configs"
	echo 
	echo "syntax: run.sh [-h|i|u|p]"
	echo "Options:"
	echo "h		show this help message"
	echo "i		install the configuration in this folder to system"
	echo "u		update files in this folder with system configuration"
}

while getopts ":hiup" option; do
	case $option in
		h)
			hello
			exit 0
			;;
	esac
done

