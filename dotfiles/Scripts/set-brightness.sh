#!/bin/bash
# Set brightness for each monitor
ddcutil setvcp 10 70 --display 1  # Set to 50% for the first monitor
ddcutil setvcp 10 70 --display 2  # Set to 50% for the second monitor
