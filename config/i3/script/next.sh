#! /bin/bash
next=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num + 1')
i3-msg workspace number "$next"
