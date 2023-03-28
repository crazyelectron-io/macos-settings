#!/usr/bin/env bash
# file: 01-install.sh
# synopsis: install usefull tools and configure shell

echo "...Install iTerm2"
brew install iterm2

echo "...Install Rosetta2"
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "...Install usefull tools."
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh jq

# Copy SSH keys to ~/.ssh
#mkdir ~/.ssh && cp ~/backup/ssh/* ~/.ssh && chmod 600 ~/.ssh/*

echo "...Install Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "...Install Oh My ZSH plugins."
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker

echo "...Install the Powerline fonts."
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

echo "...Close the terminal, pin iTerm2 to the dock and start `02-install.sh` in iTerm2."
