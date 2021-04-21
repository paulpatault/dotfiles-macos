# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# # Activation sudo
# sudo -v
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # HOMEBREW

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # NEOVIM

git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

brew install cask
brew install git
brew install mas
brew install neovim --HEAD
brew install tree-sitter
brew install lua
brew install luajit
brew install luarocks
brew install texlab


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # MACOS APPS
brew install mas

mas install 1176895641 # spark email
mas install 497799835  # XCODE
mas install 1244649277 # Photo Image Editor Pixelstyle
mas install 1494457680 # Smash: File transfer
mas install 1440147259 # AddGuard for Safari

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # BASICS

brew install cmake
brew install wget
brew install nvm
brew install node
brew install llvm
brew install stockfish
brew install rust

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # OCAML

brew install ocaml opam
opam init
opam install merlin
opam install ocaml-lsp-server
opam install dune
opam install menhir

# Graphics stuff
# brew install Caskroom/cask/xquartz
# brew install xquartz
# opam install graphics

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # OPENGL

brew install glm
brew install glew
brew install glfw
brew install opencv@2

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # CASKS

# programming
brew install --cask github
brew install --cask visual-studio-code
brew install --cask atom
brew install --cask kitty
brew install --cask clion
brew install --cask intellij-idea
brew install --cask gimp
brew install --cask mactex
brew install --cask devbook

# fonts
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-latin-modern
brew install --cask font-dejavu-sans-mono-nerd-font
brew install --cask font-jetbrains-mono-nerd-font
# browser
brew install --cask firefox
brew install --cask google-chrome

# reader
brew install --cask spotify
brew install --cask vlc

# communication
brew install --cask messenger
brew install --cask slack
brew install --cask telegram
brew install --cask discord

# courses
brew install --cask microsoft-word
brew install --cask microsoft-excel
brew install --cask microsoft-powerpoint
brew install --cask microsoft-teams
brew install --cask zoomus
brew install --cask drawio
brew install --cask typora

# other
brew tap homebrew/cask-versions
brew install --cask background-music-pre

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # THEME

brew install romkatv/powerlevel10k/powerlevel10k


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ZSH, OH-MY-ZSH

### CHECK https://gist.github.com/kevin-smets/8568070

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

# help: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SCRIPTS

brew install bat
brew install thefuck
brew install tree
brew install htop
brew install lazygit
brew install insect

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # END

brew cleanup
