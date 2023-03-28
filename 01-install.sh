#!/usr/bin/env bash
# file: 01-install.sh
# synopsis: install usefull tools and configure shell

echo "...Install Rosetta2"
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

echo "...Make sure the iCloud `Shared` folder is downloaded."
find ~/Library/Mobile\ Documents/com~apple~CloudDocs/Shared -name '.*icloud' | sed 's|\.\([^/]*\)\.icloud$|\1|g' | while read fn; do brctl download "$fn"; done

echo "...Install usefull tools."
brew install neovim ansible keepassxc terraform nmap links geoip bash-completion watch zsh gnu-sed grep go
echo [[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh" >>~/.bash_profile

echo "...Create symlink to SSH directory."
ln -s -v -f ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Shared/ssh ~/.ssh

echo "...Install Oh My Zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "...Install Oh My ZSH plugins."
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Add the plugins to ZSH: `plugins=( git zsh-syntax-highlighting zsh-autosuggestions )`

echo "...Install the Powerline fonts."
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh

echo "...Install powerlevel10k."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "...Add powerlevel10k as theme to ZSH."
gsed -i 's+ZSH_THEME=\"robbyrussel\"+ZSH_THEME=\"powerlevel10k/powerlevel10k\"+g' ~/.zshrc
source ~/.zshrc

echo "...Configure powerlevel10k with `p10k configure`."
p10k configure

echo "...Install more tools."
brew install kicad age flux mc

echo "...Configure `git` and GitHub."
# Add GitHub key to store
ssh-add --apple-use-keychain ~/.ssh/crazyelectron
# Configure Git
git config --global user.name "crazyelectron-io"
git config --global user.email "ron@crazyelectron.io"
git config --global color.ui true
git config --global core.editor nvim

echo "...Make sure the iCloud `projects` folder is downloaded."
find ~/Library/Mobile\ Documents/com~apple~CloudDocs/projects -name '.*icloud' | sed 's|\.\([^/]*\)\.icloud$|\1|g' | while read fn; do brctl download "$fn"; done
