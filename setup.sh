#!/bin/sh
# echo "Which Package manager are you using? Type \"no\" if you do not know."
#
# read pm #pm stands for package manager
#
# if [ $pm == no ]; then
# 	echo Which Operation System are you on?
# 	read OS
# 	case $OS in 
# 		[Ff][Ee][Dd][Oo][Rr][Aa])
# 			pm=dnf
# 		;;
# 	esac
# fi
# printf "$pm\n$OS\n"

pm=dnf

echo "Operating System: Fedora"

echo "Updating System"
sudo $pm update && sudo $pm upgrade


echo "Installing Utilities"
sudo $pm install neovim
sudo $pm install zathura
sudo $pm install zathura-pdf-poppler

echo "Installing C/C++ Tools"
sudo $pm install g++
sudo $pm install clang clang-devel clang-analyzer clang-tools-extra clang-format
sudo $pm install assimp assimp-devel mesa-libGL-devel freeglut freeglut-devel  

echo "Installation for NVDIA GPU"
sudo $pm install nvidia-driver nvidia-settings

