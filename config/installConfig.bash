#!/bin/bash

set -e

CheckYes(){
	read -p "[y]es/[n]o" buf
	if [[ ! "${buf}" == "y" ]]; then
		exit 1
	fi
	unset buf
}

Help(){
	echo "installConfig.bash: install current config to system"
	echo 
	echo "Quick Start: Install every config: "
	echo "./installConfig.bash -i all"
	echo "syntax: run.sh -[h|i|u|p]"
	echo "Options:"
	echo "-h		show this help message"
	echo "-i		install the configuration in this folder to system"
	echo "			it accepts option"
	echo "			Installing git configurations:"
	echo "				./installConfig.bash -i git"
	echo "-u		update files in this folder with system configuration"
}

installBashrc(){
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

installGitConfig(){
	echo "Installing git config is intended to use in new system. It is still in devel stage. Continue?"
	CheckYes
	cat gitconfig >> $HOME/.gitconfig
}

InstallAll(){
	echo Are you sure to install everything?
	CheckYes
	installGitconfig
}

install(){
	case $OPTARG in
		"all")
			InstallAll
			;;
		"git")
			installGitConfig
			;;
		\?)
			echo "invalid option for install! (following -p"
			exit 1
	esac
}

if [[ $# == 0 ]]; then
	Help
fi

while getopts "hi:up" option; do
	case $option in
		h)
			Help
			exit 0
			;;
		i)
			install
			;;
		\?)
			echo Invalid option!
			echo
			Help
			exit 0
			;;
	esac
done

