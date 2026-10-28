#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

mkdir -p "$DOTFILES_DIR/history"

echo "Doing basic system upgrade and update"
sudo apt-get update && sudo apt-get upgrade


echo "Cleaning up default config bloat..."
for file in .bashrc .profile .bash_logout .gitconfig .xinitrc .wgetrc .Xauthority; do
    if [ -f "$HOME/$file" ] && [ ! -L "$HOME/$file" ]; then
        sudo rm -f "$HOME/$file"
    fi
done


echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/.bashrc"           "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.gitconfig"        "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.xinitrc"          "$HOME/.xinitrc"
ln -sf "$DOTFILES_DIR/.wgetrc"           "$HOME/.wgetrc"
ln -sf "$DOTFILES_DIR/.bash_profile"     "$HOME/.bash_profile"

echo "Installing needed tools"
sudo apt-get install -y \
  wget                  \
  git                   \
  make                  \
  gcc

sudo apt-get install -y \
  libx11-dev            \
  libxft-dev            \
  libxinerama-dev       \
  libxrandr-dev         \
  libxss-dev            \
  pkg-config            \
  libwebkit2gtk-4.1-dev \
  libgcr-3-dev

sudo apt-get install -y  \
  xinit                  \
  xserver-xorg-core      \
  xserver-xorg-video-all

echo "Compile suckless..."
for tool in "$DOTFILES_DIR/suckless"/*/; do
    [ -d "$tool" ] || continue

    tool_name=$(basename "$tool")
    echo "building $tool_name..."

    (
        cd "$tool" &&
        sudo make clean install &>/dev/null
    ) || {
        echo "Error: building $tool_name failed!" >&2
        exit 1
    }
done

echo "Installation is done"
