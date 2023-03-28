#!/usr/bin/env bash
# file: 00--install.sh
# synopsis: install homebrew and set path

echo "...Install Homebrew. See also: https://docs.brew.sh/Installation."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "...Add Homebrew to the PATH"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/ron/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "...Close and restart the terminal to continue with `01-install.sh`."
