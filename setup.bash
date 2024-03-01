#!/bin/bash

echo "This script install certain commonly used packages that is not automatically installed after brand new system install"
echo "Currently this scirpt only works for fedora or centos-stream"
echo "Are you to continue?"

read -p "[y]es/[n]o: " buf

if [[ ! "${buf}" == "y" ]]; then
	exit 1
fi
unset buf

pm=apt
echo "Use ${pm} as package manager"

if [[ "$pm" == "dnf" ]]; then
	echo "Updating System"
	sudo dnf update -y && sudo $pm upgrade -y
	apps_dnf="neovim zathura zathura-pdf-poppler g++ clang clang-devel clang-analyzer clang-tools-extra clang-format assimp assimp-devel mesa-libGL-devel freeglut freeglut-devel"
	sudo ${pm} install ${apps_dnf} -y
elif [[ "$pm" == "apt" ]]; then
	apps_apt="zathura zathura-pdf-poppler g++ clang clang-format python3 mesa-utils freeglut3-dev libglew-dev"
	sudo ${pm} install ${apps_apt} -y
fi
