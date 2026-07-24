#!/bin/bash

# Get optional dependencies for the package
optional_deps=$(pacman -Si $1 | grep "Optional Deps" -A 20 | grep -oP '^\s+\K\w+')

# Install the package and its optional dependencies
sudo pacman -S $1 $optional_deps
