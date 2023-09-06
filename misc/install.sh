#!/bin/sh

cp bashrc -t ~/
cp bash_path -t ~/
cp bash_aliases -t ~/
cp gitconfig -t ~/

cd ~
mv bashrc .bashrc
mv bash_path .bash_path
mv bash_aliases .bash_aliases
mv gitconfig .gitconfig
