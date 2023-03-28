# MacOS setup after factory reset

My personal setup for a MacOS device after factory reset (for MacOS 13).
It includes installation of Homebrew, many needed and usefull tools and ZSH shell configuration (with Powerlevel10k).
Some steps are manual, some are scripted.

## Prepare

To be able to run commands like `git` we have to install the Xcode CLI tools first.
After that we can clone this repository en run a few scripts locally.

```bash
xcode-select --install
git clone https://github.com/crazyelectron-io/macos-settings.git
cd macos-settings
chmod +x *.sh
```

## Install basic tools

Homebrew is an essential tool for installing all kinds of packages and with the addition of Cask, it can also installs GUI-based tools.
To use Homebrew it must be added to the path.
After that we install `iterm2` as our go-to terminal as well as some other usefull stuff.
All this is done in `00-install.sh`.

```bash
# Install power line fonts
# See: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
# Install Oh My ZSH plugins
git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker
# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc

# Copy SSH keys to ~/.ssh
mkdir -p ~/.ssh
cp ~/backup/install-macos/ssh/* ~/.ssh

# Add GitHub key to store
ssh-add --apple-use-keychain ~/.ssh/crazyelectron

# Configure Git
git config --global user.name "crazyelectron-io"
git config --global user.email "ron@crazyelectron.io"
git config --global color.ui true
git config --global core.editor nvim

# Add the key `crazyelectron.pub` to GitHub (in _Settings_).

# Install _Recipe Keeper_ from the App Store.
# Install _Remote Desktop_ from the App Store.

# Download and install VSCode for Apple Silicon (Zip).
# Login with GitHub account to activate Settings Sync in VSCode.
# In de command Palette (Cmd+Shift+P) type 'shell command' to find the `Shell Command: Install 'code' command in PATH`

# Download and install Office 365.
```
