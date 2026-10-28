#!/bin/bash

DOTFILES_DIR = "$HOME/.dotfiles"

echo "Doing basic system upgrade and update"
sudo apt-get update && sudo apt-get upgrade


echo "Cleaning up default config bloat..."
for file in .bashrc .profile .bash_logout .gitconfig .xinitrc .wgetrc .Xauthority; do
    if [-f "$HOME/$file" && [ ! -L "$HOME/$file" ]; then
        sudo rm -f "$HOME/$file"
    fi
done


echo "Creating symlinks..."
ln -sf "$DOTFILES_DIR/.bashrc"           "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/.gitconfig"        "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/.xinitrc"          "$HOME/.xinitrc"
ln -sf "$DOTFILES_DIR/.wgetrc"           "$HOME/.wgetrc"


echo "Installing needed tools"
sudo apt-get install -y \
  wget                  \
  git                   \
  make                  \
  gcc                   \

sudo apt-get install -y \
  libx11-dev            \
  libxft-dev            \
  libinerama-dev        \
  libxrandr-dev         \
  libxss-dev            \
  pkg-config            \
  libwebkit2gtk-4.0-dev \
  libgcr-3-dev          \

sudo apt-get install -y  \
  xinit                  \
  xserver-xorg-core      \
  xserver-xorg-video-all \

echo "Compile suckless..."
for tool in "$DOTFILES_DIR/suckless"/*/; do
    echo "building $(basename "$tool")..."
    cd "$tool" && sudo make clean install &>/dev/null
done

echo "Installation is done"
