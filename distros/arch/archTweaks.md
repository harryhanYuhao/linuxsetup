# Making Arch into a functional daily driver

## Miscellanenous tweaks

### Disable the PC speaker

When inputting a invalid command in the terminal, an irritating bell sound would be played. 
To disable it system-wise, create a new file name `disable-beep.sh` in `/etc/profile.d/` and append `setterm -blength 0`.

Or, if it did not work, you may disable the kernel modules that controls the pc speaker:

```bash
rmmod pcspkr; rmmod snd_pcsp
```

### Hostname

Your hostname, which was shown on the shell prompt, is stored in `/etc/hostname`. Edit it (or create if necessary) to change your hostname.

## Install Packages

- `less`
- `vim`
- `nvim`
- `git`
- `openssh`
- `firefox`
- `libva-intel-driver`
- `xclip`: clip board provider
- `zathura; zathura-pdf-poppler`: pdf viewer
- `texlive`: latex
- `biber`: latex reference tool

Althought `pacman` many times are more than sufficient, to gain access to AUR which contains a plethora of community driven packages, we need a AUR helper.

### Fonts

For unicode support, install `noto-fonts`: `pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji`

For cute emojis, install `nerd-fonts` with pacman. (About 5 Gib)

## Sound 

By default all sound channels may be muted. To unmute, install `alsa-utils` and unmute the channels

```bash
pacman -S alsa-utils
amixer sset Master unmute
amixer sset Speaker unmute
amixer sset Headphones unmute
amixer sset Master 100%
amixer sset Speaker 100%
amixer sset Headphones 100%

speaker-test # test the speakers
```

## Graphical User Interface

Sometimes a GUI is convenient. Certain application, including most web browsers, depend on GUI.

### Audio

Install and enable pulseaudio

### Hyprland

Install `hyprland`, `kitty`, `gtk3`, `xdg-desktop-portal-hyprland`, `pipewire`, `mako`, `qt5-wayland`, `qt6-wayland`.

Note, to open kitty, you need `gtk3` packages.

