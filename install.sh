#!/bin/bash

# Function to detect the Linux distribution
detect_distro() {
    if [ -f /etc/arch-release ]; then
        echo "arch"
    elif [ -f /etc/fedora-release ]; then
        echo "fedora"
    elif [ -f /etc/debian_version ]; then
        echo "debian"
    else
        echo "Unsupported distribution"
        exit 1
    fi
}

# Function to update repositories and install packages based on the distribution
install_packages() {
    distro="$1"
    case "$distro" in
        "arch")
            sudo pacman -Syu
            sudo pacman -S --noconfirm polybar picom thunar ttf-hack rofi zsh kitty feh bspwm
            ;;
        "fedora")
            sudo dnf update
            sudo dnf install -y polybar picom thunar rofi zsh kitty feh bspwm
            ;;
        "debian")
            sudo apt update
            sudo apt upgrade -y
            sudo apt install -y polybar picom thunar fonts-hack rofi zsh kitty feh bspwm
            ;;
        *)
            echo "Unsupported distribution"
            exit 1
            ;;
    esac
}

# Detect the distribution
distro=$(detect_distro)

# Update repositories and install packages
install_packages "$distro"

# Copy files from the working directory to ~/.config/bspwm
cp -r . ~/.config/bspwm

echo "Setup complete!"
