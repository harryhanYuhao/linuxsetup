# Making Arch into a functional daily driver

## Miscellanenous tweaks

### Disable the PC speaker

When inputting a invalid command in the terminal, an irritating bell sound would be played. 
To disable it system-wise, create a new file name `disable-beep.sh` in `/etc/profile.d/` add `setterm -blength 0`.

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

Althought `pacman` many times are more than sufficient, to gain access to AUR which contains a plethora of community driven packages, we need a AUR helper.

## Graphical User Interface

Sometimes a GUI is convenient. Certain application, including most web browsers, depend on GUI.

### Hyprland

Install `hyprland`, `kitty`, `gtk3`, `xdg-desktop-portal-hyprland`, `pipewire`, `mako`, `qt5-wayland`, `qt6-wayland`.


