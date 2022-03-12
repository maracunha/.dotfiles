# New Mac setup

## Change for a new version on Bash
$ which bash
/opt/homebrew/bin/bash

Install brew from: https://docs.brew.sh/Installation
brew install bash

# Get installed new bash

$ which bash
/opt/homebrew/bin/bash

$ sudo bash -c 'echo /opt/homebrew/bin/bash >> /etc/shells'
$ chsh -s /opt/homebrew/bin/bash

# Install other apps
brew install neavim
brew install nvm
brew install vcprompt

brew install Plug
brew install stow
brew install fzf
brew install tmux
brew install docker
brew install bat
brew install rg
brew install tldr
brew inscall lua
brew inscall fd 

# Install apps to use an Mac
brew install —cask spectacle
brew install --cask enpass
brew install --cask microsoft-remote-desktop
brew install --cask visual-studio-code
brew install --cask insomnia
brew install --cask mockoon
