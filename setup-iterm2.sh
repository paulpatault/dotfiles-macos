#!/bin/bash
# File              : setup-iterm2.sh
# Date              : 13.04.2021
# Last Modified Date: 13.04.2021
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# Activation sudo
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # THEME

brew install romkatv/powerlevel10k/powerlevel10k
echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # FONT

# iterm2 > preference > profile > text > font
brew install --cask font-dejavu-sans-mono-nerd-font

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ZSH, OH-MY-ZSH

### CHECK https://gist.github.com/kevin-smets/8568070

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # VIM

git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# help: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SCRIPTS

brew install bat
brew install thefuck
brew install tree
