#!/bin/sh

# Script to setup Mac M4 (Apple Silicon)

# 1. Install Xcode Command Line Tools (needed for some packages)
xcode-select --install

# 2. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/imajeetyadav/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# 4. Update Homebrew & check
brew doctor
brew update

# 6. Install core tools
brew install git
brew install zsh

# 7. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as default shell (if not already)
chsh -s $(which zsh)

# Reload config
source ~/.zshrc

# 8. Zsh Plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Reload Zsh
source ~/.zshrc

# 9. Fix PATH issues
echo 'export PATH=$PATH:/opt/homebrew/bin' >> ~/.zshrc
source ~/.zshrc

# 10. Install Apps & Tools

# Browsers
brew install --cask google-chrome

# Dev Languages & Tools
brew install node
brew install go
brew install openjdk
brew install terraform
brew install minikube
brew install httpie

# IDEs & Editors
brew install --cask visual-studio-code
brew install --cask sublime-text
brew install --cask jetbrains-toolbox
brew install --cask azure-data-studio
brew install --cask postman

# Cloud / Utilities
brew install --cask docker
brew install --cask microsoft-azure-storage-explorer
brew install --cask ngrok   # updated, no 'cask install'

# Productivity
brew install --cask canva
