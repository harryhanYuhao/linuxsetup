#! /bin/bash
pre=$(i3-msg -t get_workspaces | jq -r '.[]| select(.focused).num - 1')
i3-msg workspace number "$pre"
