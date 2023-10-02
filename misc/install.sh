#!/bin/sh

cp bashrc -t ~/
cp -r bashrc.d -t ~/
cp gitconfig -t ~/

cd ~
mv bashrc .bashrc
mv gitconfig .gitconfig
mv bashrc.d .bashrc.d
