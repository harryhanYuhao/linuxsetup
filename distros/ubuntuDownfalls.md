# Downfall of Ubuntu

## Snap

Snap is a package manager developped by Canonical, the same that developped Ubuntu. Since Ubuntu 20 more defaults softwares on ubuntu were installed througth snap, including firefox.

Unfortunately, the snap version of the softwares, as of Mar 3, 2023, seems to be buggier and slower compared deb-version (the versions installed through debian's apt package manager). Snap-firefox does not support customization with `userChrome.css`. I also had certain obscure bugs with treesitter on snap-neovim, which was only resolved after building neovim from source.

By contrast, apt will install more stable, but seriesly outdated softwares. Just for some quick examples, as of Mar 3, 2023, apt will install nodejs 10, whose latest LTS is version 18; it will install neovim 0.4, while the most commonly used version is 0.8.
