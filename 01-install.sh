#!/usr/bin/env bash
# file: 01-install.sh
# synopsis: install usefull tools and configure shell

echo "...Install usefull tools."
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh jq
echo "[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"" >>~/.bash_profile

# Copy SSH keys to ~/.ssh
mkdir -p ~/.ssh 
cp ~/backup/ssh/* ~/.ssh

echo "...Install Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "...Install Oh My ZSH plugins."
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker

echo "...Install the Powerline fonts."
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

echo "...Install powerlevel10k."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "...Close the terminal, pin iTerm2 to the dock and start `02-install.sh` in iTerm2."
