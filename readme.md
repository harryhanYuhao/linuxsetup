# Linux Setup

This repo contains my linux setup. The ultimate goal is to create one executable bash script (or other script) which will create a working linux desktop environment at one execution. 

## Config Files

The config files of certain application is included. To use them, all files and directories under the directory `config` shall be moved to `~/.config`.

### i3

The i3 config consists of a config file and a set of script. It also depends on the an executable shell script `i3CustomLock.sh`, which is under the directory `bin`. To config may not work right out of the box; certian lines which may cause problem are marked with `note:` in the configuration file.
