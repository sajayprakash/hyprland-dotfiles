#!/bin/bash

# Configs
directories=(
    ~/.config/mako
    ~/.config/wofi
    ~/.config/hypr
    ~/.config/hypr
    ~/.config/firefox
    ~/.config/foot
    ~/.config/git
    ~/.config/paru
    ~/.config/wallpapers
    ~/.config/fish/
    ~/.config/cava/
)

# Loop through each directory
for dir in "${directories[@]}"
do
    # Copy directory contents to the current directory
    cp -R "$dir" .
done

