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

echo "...Install Rosetta2"
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "...Install usefull tools."
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh
echo [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh" >>~/.bash_profile

echo "...Create symlink to SSH directory. *** Make sure the Shared folder is synced ***"
ln -s -v -f ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Shared/ssh ~/.ssh

echo "...Install Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "...Install Oh My ZSH plugins."
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker

echo "...Install the Powerline fonts."
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

echo "...Install powerlevel10k."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "...Add `ZSH_THEME="powerlevel10k/powerlevel10k` to `~/.zshrc`, run `source ~/.zshrc` and configure powerlevel10k with `p10k configure`."
