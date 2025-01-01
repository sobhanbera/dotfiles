#!/bin/bash

SOURCE_DIR="$(dirname $0)/nvim"
DEST_DIR="$HOME/.config/nvim"

# Check if the source folder exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source folder '$SOURCE_DIR' does not exist."
    exit 1
fi

# Create the destination directory if it does not exist
if [ ! -d "$(dirname "$DEST_DIR")" ]; then
    echo "Creating config directory: $(dirname "$DEST_DIR")"
    mkdir -p "$(dirname "$DEST_DIR")"
fi

# Copy the nvim folder to the destination
echo "Copying '$SOURCE_DIR' to '$DEST_DIR'..."
cp -R "$SOURCE_DIR" "$DEST_DIR"

# Check if the copy operation was successful
if [ $? -eq 0 ]; then
    echo "nvim folder successfully copied to $DEST_DIR!"
else
    echo "Error: Failed to copy nvim folder."
    exit 1
fi
