#!/bin/bash

backup_dir="$HOME/.config_orphans_backup"
config_dir="$HOME/.config"

mkdir -p "$backup_dir"
cd "$config_dir" || { echo "Could not enter $config_dir"; exit 1; }

echo "Interactive config cleanup."
echo "Enter folder names to move to backup."
echo "Type 'q' to quit."

while true; do
  read -rp "Folder to move (or 'q' to quit): " folder

  if [[ "$folder" == "q" ]]; then
    echo "Exiting."
    break
  fi

  if [[ ! -e "$folder" ]]; then
    echo "Error: '$folder' does not exist in $config_dir."
    continue
  fi

  read -rp "Are you sure you want to move '$folder' to backup? (y/N): " confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    mv "$folder" "$backup_dir/"
    if [[ $? -eq 0 ]]; then
      echo "'$folder' moved to backup."
    else
      echo "Error moving '$folder'."
    fi
  else
    echo "Skipped '$folder'."
  fi
done
