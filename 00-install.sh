#!/usr/bin/env bash
# file: 00-install.sh
# synopsis: install homebrew (added to PATH), iTerm and ZSH.

echo "...Install Homebrew. See also: https://docs.brew.sh/Installation."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "...Add Homebrew to the PATH"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ron/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "...Install iTerm2."
brew install iterm2

echo ;echo "...Exit Terminal, pin iTerm2 to Dock and start iterm2."
