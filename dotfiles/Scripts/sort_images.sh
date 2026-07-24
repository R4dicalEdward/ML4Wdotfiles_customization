#!/bin/bash

# Define the directory where the script is run
TARGET_DIR="."

# Create directories for JPG and PNG if they don't already exist
mkdir -p "$TARGET_DIR/JPG" "$TARGET_DIR/PNG"

# Find and move all JPG files (case-insensitive)
find "$TARGET_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) -exec mv {} "$TARGET_DIR/JPG/" \;

# Find and move all PNG files (case-insensitive)
find "$TARGET_DIR" -maxdepth 1 -type f -iname "*.png" -exec mv {} "$TARGET_DIR/PNG/" \;

# Feedback for the user
echo "Images have been sorted into 'JPG' and 'PNG' directories."
