# Arch Install Guide -- most succinct, necessary steps

### Set fonts

If the fonts are too small, to save your eyes you can set a bigger font by `setfont sun12x22`. (with an x letter)

### Bootloader

I recommend grub as the boot loader. 

### Network

Install networkmanager and enable it

```bash
pacman -S networkmanager
systemctl enable NetworkManager
```

Now you can shutdown the computer and remove the installation medium. Restart, hopefully everything works.

## Post Installation

### Login

As no other user has been created, login to root user with the set password. The username is `root`.

### Internet

The internet may need to be connected again. One of the easiest way to connect to internet is to use `nmtui`. 

To use `nmtui`, `networkmanager` must be installed and turned on. If it is not alreadly installed, shutdown the computer, plugin installation medium, mount the file system, enter chroot environment and install it with `pacman`. 

### Create User 

Although all the system is fully functional with root user, to not accidentally destroy the system with the root privilage, normal sessions shall be accessed with a non-root user.

User can be created with `useradd -m [username]`; its password set by `passwd [username]`.

Now we are to add root privilage to user.

First create a new `sudo` group by `groupadd sudo`. To create `sudo` users root privilage, add the following line to `/etc/sudoers` file. This files can be editted with command `visudo`:

```bash
%sudo ALL=(ALL) ALL
```
Use the command `usermod -aG sudo [username]`, which add the user to `root` group.

Before logging out of root user, install `sudo` package to use `sudo` command: `pacman -S sudo`.

## Conclusion

Now, although still deprived of a graphical user interface, the system is fully functional.
