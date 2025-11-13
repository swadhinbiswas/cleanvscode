#!/bin/bash

# This script automates the installation of the custom VS Code configuration.
# It backs up existing settings and keybindings before copying the new ones.

# --- Configuration ---
# VS Code user settings directory
VSCODE_USER_DIR="$HOME/.config/Code/User"
# Source directory where the new config files are located (assumes the script is run from the same directory as the files)
SOURCE_DIR="$(pwd)"
SETTINGS_FILE="settings.json"
KEYBINDINGS_FILE="keybindings.json"

# --- Functions ---
# Function to create a timestamped backup
backup_file() {
  local file_path="$1"
  if [ -f "$file_path" ]; then
    local timestamp=$(date +%Y%m%d-%H%M%S)
    local backup_path="${file_path}.bak.${timestamp}"
    echo "Backing up existing $(basename "$file_path") to $backup_path..."
    mv "$file_path" "$backup_path"
  else
    echo "No existing $(basename "$file_path") found. No backup needed."
  fi
}

# --- Main Script ---
echo "Starting VS Code configuration setup..."

# Ensure the VS Code User directory exists
if [ ! -d "$VSCODE_USER_DIR" ]; then
  echo "Error: VS Code user directory not found at $VSCODE_USER_DIR."
  echo "Please make sure VS Code is installed."
  exit 1
fi

# Check if source files exist
if [ ! -f "$SOURCE_DIR/$SETTINGS_FILE" ] || [ ! -f "$SOURCE_DIR/$KEYBINDINGS_FILE" ]; then
  echo "Error: Source configuration files ('$SETTINGS_FILE' and '$KEYBINDINGS_FILE') not found in the current directory."
  echo "Please run this script from the same directory where the configuration files are located."
  exit 1
fi

# Backup existing configuration files
echo ""
backup_file "$VSCODE_USER_DIR/$SETTINGS_FILE"
backup_file "$VSCODE_USER_DIR/$KEYBINDINGS_FILE"

# Copy the new configuration files
echo ""
echo "Copying new configuration files..."
cp "$SOURCE_DIR/$SETTINGS_FILE" "$VSCODE_USER_DIR/$SETTINGS_FILE"
cp "$SOURCE_DIR/$KEYBINDINGS_FILE" "$VSCODE_USER_DIR/$KEYBINDINGS_FILE"

echo ""
echo "✅ Configuration successfully installed!"
echo "Please restart VS Code for all changes to take effect."
