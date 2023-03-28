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
chmod +x macos-settings/*.sh
```

## Install basic tools

Homebrew is an essential tool for installing all kinds of packages and with the addition of Cask, it can also installs GUI-based tools.
Next we install `iterm2` as our go-to terminal.
All this is done in `macos-settings/00-install.sh`.
Once finished, `Terminal` should be closed and iTerm2 should be started (and pinned to the Dock).
There the next script can be run: `macos-settings/01-install.sh`.

## Install aditional apps

- Install _Recipe Keeper_ from the App Store and login with username/password (stored in keychain).
- Install _Remote Desktop_ from the App Store and configure a workspace with the company e-mail address.
- Enable _Settings Sync_ in VS Code and login with GitHub account.
- Download and install [Office 365](https://office.com).
- Download and install [PIA VPN](https://www.privateinternetaccess.com/pages/download.Aug).
