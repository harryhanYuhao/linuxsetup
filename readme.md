# Linux Setup

In this repo are my personal configurations for linux system. 
All configurations are here except nvim, which is placed in a separate repository named `mynvimconfig`.

This repo enables me to reproduce my customed computer settings almost identically in a brandnew device by copying and pasting files into their proper paths. 
Those regarding copying and pasting some files tedios are advised to check out NixOs.

A list of packages I often used are included here for sake of conveniently downloading them at once. 

__arch packages:__

For wayland
```
wl-clipboard
wl-copy
zathura-pdf-poppler
zathura
chromium
texlive
base-devel
debugedit
yay
code
$(pacman -Sgq nerd-fonts)
fzf
swaylock
swayidle
mcfly
fisher
gammastep
openfortivpn
```

Copy all of these names, and use `echo`, `tr`, and `xargs` to install them in one fell-swoop. For example

```sh
echo "swayidle
mcfly
fisher " | tr '\n' ' ' | xargs sudo pacman -S --needed --noconfirm
```

## Other configs 

Firefox 

In `about:config`, `browser.download.open_pdf_attachments_inline` set to true.

## Common Issues 

### VPN 

Connecting VPN on Linux may be difficult if the desired VPN agent does not have Linux support. 
There are several tweeks, however.

If the VPN network utilised fortivpn, (most universities' vpn do), use `openfortivpn` on Linux. 

```sh
sudo openfortivpn remote.net.ed.ac.uk:8443 -u <username>
````

On arch you many need to manually enabled the resloved service by 

```sh 
sudo systemctl start systemd-resolved.service
```
