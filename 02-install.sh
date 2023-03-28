#!/usr/bin/env bash
# file: 02-install.sh
# synopsis: install p10k and additional tools (run in iterm2)

echo "...Install powerlevel10k."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "...Copy the zshrc en p10k config files."
cp -f ~/backup/install-macos/zshrc ~/.zshrc
cp -f ~/backup/install-macos/p10k.zsh ~/.p10k.zsh

echo "...Install more tools."
homebrew install kicad age flux
