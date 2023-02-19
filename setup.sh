#!/bin/bash
echo "Which Package manager are you using? Type \"no\" if you do not know."

read pm #pm stands for package manager

if [ $pm == no ]; then
	echo Which Operation System are you on?
	read OS
	case $OS in 
		[Ff][Ee][Dd][Oo][Rr][Aa])
			pm=dnf
		;;
	esac
fi
printf "$pm\n$OS\n"
# sudo $pm install neovim
# sudo $pm install g++

