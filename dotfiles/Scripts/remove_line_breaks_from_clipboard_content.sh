#!/bin/bash

# Remove line breaks from clipboard content
wl-paste | sed -e ':a;N;$!ba;s/-\n//g' -e 's/\n/ /g' | tr -s ' ' | wl-copy | wl-paste


# UNCOMENT WHEN VIRTUAL KEYBOARD SUPPORTED BY COMPOSITOR
# Wait a short moment to ensure clipboard is updated
#sleep 0.1

# Simulate Ctrl + v to paste the formatted content using wtype
#wtype -M ctrl v -m ctrl
