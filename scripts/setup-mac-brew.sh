#!/bin/bash

# Function to install formula if not already installed
install_formula() {
    local formula="$1"
    if brew list --formula | grep -q "^$formula$"; then
        echo "$formula is already installed. Skipping installation."
    else
        brew install --formula "$formula"
    fi
}

# Function to install cask if not already installed
install_cask() {
    local cask="$1"
    if brew list --cask | grep -q "^$cask$"; then
        echo "$cask is already installed. Skipping installation."
    else
        brew install --cask "$cask"
    fi
}

# Tap repositories
brew tap homebrew/cask-fonts # nerd-fonts
brew tap koekeishiya/formulae # yabai

# Essentials
install_formula git
install_formula neovim --HEAD
install_formula tmux
install_cask iterm2
install_cask firefox

# Fonts
install_cask font-hack-nerd-font
install_cask font-sarasa-gothic


# Useful tools
install_formula eza
install_formula neofetch
install_formula ripgrep
install_formula tree
install_formula yabai
install_cask hammerspoon

# Dev tools
install_formula php
install_formula ruby
install_formula node
install_cask microsoft-openjdk

# Apps
install_cask alfred
install_cask balenaetcher
install_cask intellij-idea
install_cask movist-pro
install_cask piclist
install_cask squirrel
install_cask the-unarchiver
install_cask zoom
install_cask cleanmymac-zh
install_cask tailscale

# Microsoft office
install_cask microsoft-outlook
install_cask microsoft-word
install_cask microsoft-excel
install_cask microsoft-powerpoint

echo "All done. Yay!"