#!/bin/bash

set -e  # Exit on any error unless handled

echo "Updating system..."
sudo pacman -Syu

echo "Removing orphaned packages..."
ORPHANS=$(pacman -Qtdq || true)
if [[ -n "$ORPHANS" ]]; then
    sudo pacman -Rns $ORPHANS
else
    echo "No orphaned packages found."
fi

echo "Cleaning package cache..."
sudo paccache -r

echo "Done."

