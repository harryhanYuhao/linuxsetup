# Linux Set up

## Gnome shortcut

`ctrl-alt-t` open terminal exec of Gnome Terminal is `gnome-terminal`

`ctrl-alt-b` open firefox. exec of firefox is `firefox`

Note the command are gnome shell command.

## Package Required

g++

zathura;
zathura-pdf-poppler; (Required for viewing pdf.)

nodejs

## nvim

`sudo dnf install nvim`

## Texlive

## Alacritty

## Bash Config

### Appearance

Using Debian Color for the prompt:
`PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'`

### Bash Alias

`c` for `clear`

### Useful Functions

```bash
mkcd () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}
```
This code is taken from [stack exchange](https://unix.stackexchange.com/questions/9123/is-there-a-one-liner-that-allows-me-to-create-a-directory-and-move-into-it-at-th)

## Git Config

### Git Alias

`git config --global alias.co checkout`
`git config --global alias.br branch`
`git config --global alias.ci commit`
`git config --global alias.st status`

## NVDIA Driver

```bash
sudo dnf install dnf-plugins-core -y
sudo dnf copr enable t0xic0der/nvidia-auto-installer-for-fedora -y
sudo dnf install nvautoinstall -y
sudo dnf update --refresh
```

Use `sudo nvautoinstall --primec` to install the driver, enabling prime (switching between graphic card), etc.
