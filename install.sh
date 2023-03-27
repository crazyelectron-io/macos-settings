#!/usr/bin/env bash

# Install Homebrew. See also: https://docs.brew.sh/Installation.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ron/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install Homebrew Cask to support installation of GUI apps
brew install cask

# Install iTerm2
brew --cask install iterm2

# Install Rosetta2ß
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Install usefull tools
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh jq

# Copy SSH keys to ~/.ssh
mkdir ~/.ssh && cp ~/backup/ssh/* ~/.ssh && chmod 600 ~/.ssh/*

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Oh My ZSH plugins
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker

# Install the Powerline fonts
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Copy the zshrc en p10k config files
cp -f ~/backup/install-macos/zshrc ~/.zshrc
cp -f ~/backup/install-macos/p10k.zsh ~/.p10k.zsh

# Install more tools
homebrew install kicad age flux
