#!/usr/bin/env bash
# file: 02-install.sh
# synopsis: configure p10k and install additional tools (run in iterm2)

echo "...Install additional ZSH plugins."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add the plugins to ZSH: `plugins=( git zsh-syntax-highlighting zsh-autosuggestions )`

#echo "...Copy the zshrc en p10k config files."
#cp -f ~/backup/install-macos/zshrc ~/.zshrc
#cp -f ~/backup/install-macos/p10k.zsh ~/.p10k.zsh

echo "...Install more tools."
brew install kicad age flux
