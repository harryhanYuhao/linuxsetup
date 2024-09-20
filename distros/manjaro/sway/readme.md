# Manjaro Sway cofig

Manjaro sway is  already well configured. 
However, fonts, shortcuts, etc could be improved.

## Swaylock

Need to increase font and circle radius.

Create `~/.config/swaylock/config` and append

```
font-size=40
indicator-radius=200
```

## rofi

Font size need to be bigger. 

Modified `~/.config/rofi/Manjaro.rasi` into the following. Note: font!

```
* {
lightbg: #141a1b;
background: #141a1b;
lightfg: #16a085;
foreground: #eeeeee;
font: "monospace 22";
}
window {
width: 25em;
}
``` 

## waybar 

Needs to increase font size. 

Change font size in `/usr/share/sway/template/waybar/style.css` 
with `font-size: 24px`

## sway

Append these onto `~/.config/sway/config`:

```
bindsym $mod+Ctrl+Right exec swaymsg workspace next
bindsym $mod+Ctrl+Left exec swaymsg workspace prev

# TODO
bindsym $mod+Ctrl+Shift+Right exec sh ~/.config/i3/script/moveContainerAndScreenNext.sh
bindsym $mod+Ctrl+Shift+Left exec sh ~/.config/i3/script/moveContainerAndScreenPre.sh

bindsym $mod+q kill

exec i3-msg 'workspace 3; exec /usr/bin/firefox;'
#exec i3-msg 'workspace 9; exec /usr/bin/clash-verge;'
exec i3-msg 'workspace 2; exec foot; workspace 2'
```
