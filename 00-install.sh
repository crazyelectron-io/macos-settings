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

echo "...Make sure the Shared folder is downloaded."
find ~/Library/Mobile Documents/com~apple~CloudDocs/Shared -name '.*icloud' | sed 's|\.\([^/]*\)\.icloud$|\1|g' | while read fn; do brctl download "$fn"; done

echo "...Install usefull tools."
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh gnu-sed grep
echo [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh" >>~/.bash_profile

echo "...Create symlink to SSH directory."
ln -s -v -f ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Shared/ssh ~/.ssh

echo "...Install Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "...Install Oh My ZSH plugins."
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker

echo "...Install the Powerline fonts."
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

echo "...Install powerlevel10k."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "...Add powerlevel10k as theme to ZSH."
gsed /ZSH_THEME="robbyrussel"/ZSH_THEME="powerlevel10k/powerlevel10k"/ ~/.zshrc > ~/.zshrc.new
mv -f ~/.zshrc ~/.zshrc.backup
mv ~/.zshrc.new ~/.zshrc
source ~/.zshrc

echo "...Configure powerlevel10k with `p10k configure`."
p10k configure
