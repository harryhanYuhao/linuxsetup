#!/bin/bash

RED="\033[31m"
NC="\033[0m"

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
	echo -e "			Install convenient dot files ${RED}(recommended)${NC}:"
	echo "				./installConfig.bash -i con"
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

installKittyConfig(){
	mkdir -p $HOME/.config/kitty/
	stow -t $HOME/.config/kitty/ -v -S kitty 
} 

installAlacrittyConfig(){
	mkdir -p $HOME/.config/alacritty/
	stow -t $HOME/.config/alacritty/ -v -S alacritty
}

installi3Config(){
	mkdir -p $HOME/.config/i3/
	stow -t $HOME/.config/i3/ -v -S i3
}

installBashAliases(){
	mkdir -p $HOME/.bashrc.d/
	stow -t $HOME/.bashrc.d/ -v -S dot-bashrc.d
}

installZshconfig() {
	stow -t $HOME/ -v -S --dotfiles zshrc/
}

installConvenient(){
	installKittyConfig
	installAlacrittyConfig
	installi3Config
	installBashAliases
	installZshconfig
}

InstallAll(){
	echo Are you sure to install everything?
	CheckYes
	installGitconfig
	installKittyConfig
}


install(){
	case $OPTARG in
		"all")
			InstallAll
			;;
		"con")
			installConvenient	
			;;
		"git")
			installGitConfig
			;;
		"kitty")
			installKittyConfig
			;;
		"zsh")
			installZshconfig
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

