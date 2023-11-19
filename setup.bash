#!/bin/bash

echo "This script install certain commonly used packages that is not automatically installed after brand new system install"
echo "Currently this scirpt only works for fedora or centos-stream"
echo "Are you to continue?"

read -p "[y]es/[n]o: " buf

if [[ ! "${buf}" == "y" ]]; then
	exit 1
fi

unset buf

pm=dnf

echo "Use dnf as package manager"

echo "Updating System"
sudo $pm update -y && sudo $pm upgrade -y

apps="neovim zathura zathura-pdf-poppler g++ clang clang-devel clang-analyzer clang-tools-extra clang-format assimp assimp-devel mesa-libGL-devel freeglut freeglut-devel"
sudo ${pm} install ${apps} -y
