# Linux Setup

This repo contains my linux setup. 
The ultimate goal is to create one executable script that will replicate my working linux desktop environment at one execution. 
However, due to the idiosyncracies of different OS and software, one unifying script is difficult. 
So far one must download softwares and copy each config file by hand.

## Recommanded Softwares

### Utilities

- firefox
- neovim
- kitty
- clash 
- clash-verge

### WM and Customisation

### X

- i3
- dmenu

# Wayland

- sway
- hyprpland
- wofi 
- swaylock

## Config Files

The config files of certain application is included. To use them, all files and directories under the directory `config` shall be moved to `~/.config`.

### i3

The i3 config consists of a config file and a set of script. It also depends on the an executable shell script `i3CustomLock.sh`, which is under the directory `bin`. To config may not work right out of the box; certian lines which may cause problem are marked with `note:` in the configuration file.
