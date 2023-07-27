#/bin/sh

next=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num + 1')
i3-msg move container to workspace number "$next"
i3-msg workspace "$next"
