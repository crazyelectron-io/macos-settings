#!/usr/bin/env bash
# file: 02-install.sh
# synopsis: configure p10k and install additional tools (run in iterm2)

echo "...Copy the zshrc en p10k config files."
cp -f ~/backup/install-macos/zshrc ~/.zshrc
cp -f ~/backup/install-macos/p10k.zsh ~/.p10k.zsh

echo "...Install more tools."
homebrew install kicad age flux
