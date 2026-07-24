#!/bin/bash

# Source and backup directories
SOURCE_DIR="/mnt/data/Code/github/Hyprland/ML4W\ Dotfiles\ for\ Hyprland/share/dotfiles/.config/" # Replace with the path to your directory
BACKUP_DIR="/mnt/data/2024-12-31_dotfiles_backup/"
TARGET_DIR="$HOME/.config"

# Prompt for sudo access at the start
echo "This script requires sudo to handle files with restricted permissions."
sudo -v || { echo "Failed to obtain sudo privileges. Exiting."; exit 1; }

# Create backup directory if it doesn't exist
sudo mkdir -p "$BACKUP_DIR"

# Enable hidden files and prevent wildcard issues
shopt -s dotglob nullglob

# Loop through each file/directory in the source directory, including hidden ones
for item in "$SOURCE_DIR"/*; do
    # Extract the item name
    item_name=$(basename "$item")

    # Check if the item exists in ~/.config
    if [ -e "$TARGET_DIR/$item_name" ]; then
        echo "Backing up existing: $TARGET_DIR/$item_name"

        # Backup the existing item
        sudo cp -r "$TARGET_DIR/$item_name" "$BACKUP_DIR/" || {
            echo "Warning: Failed to copy $TARGET_DIR/$item_name. Check permissions."
        }
    else
        echo "Item does not exist: $TARGET_DIR/$item_name"
    fi

    # Copy the new item to ~/.config
    echo "Copying $item_name to $TARGET_DIR"
    sudo cp -r "$item" "$TARGET_DIR/" || {
        echo "Warning: Failed to copy $item. Check permissions."
    }
done

# Reset shell options
shopt -u dotglob nullglob

echo "Backup and replacement completed successfully with sudo."
