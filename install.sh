#!/usr/bin/env bash

# Install Xcode CLI
xcode-select --install

# Install Homebrew. See also: https://docs.brew.sh/Installation.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to the PATH
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ron/.zprofile

# Install Homebrew Cask to support installation of GUI apps
brew install cask

# Install iTerm2
brew install —cask iterm2

# Install usefull tools
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch kicad zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)”
# Install power line fonts
# See: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
# Install Oh My ZSH plugins
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
# Copy the zshrc en p10k config files
mv -f zshrc ~/.zshrc
mv -f p10k.zsh ~/.p10k.zsh

# Copy SSH keys to ~/.ssh
# Add GitHub key to store
ssh-add --apple-use-keychain ~/.ssh/crazyelectron

# Configure Git
git config --global user.name "crazyelectron-io"
git config --global user.email "ron@crazyelectron.io"
git config --global color.ui true
git config --global core.editor nvim
