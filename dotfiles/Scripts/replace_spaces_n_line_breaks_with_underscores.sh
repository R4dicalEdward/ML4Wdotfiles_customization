#!/bin/bash

# Replace spaces and line breaks in clipboard content with underscores
wl-paste | tr ' \n' '_' | wl-copy | wl-paste

# UNCOMMENT WHEN VIRTUAL KEYBOARD SUPPORTED BY COMPOSITOR
# Wait a short moment to ensure clipboard is updated
# sleep 0.1

# Simulate Ctrl + v to paste the formatted content using wtype
# wtype -M ctrl v -m ctrl
