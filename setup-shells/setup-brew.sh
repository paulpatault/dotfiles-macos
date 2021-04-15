# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# Activation sudo
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # HOMEBREW

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # BASICS

brew install neovim --HEAD
brew install cmake
brew install tree-sitter
brew install wget
brew install nvm
brew install node
brew install stockfish
brew install rust
brew install lua
brew install luajit
brew install luarocks

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # OCAML

brew install ocaml opam
opam init
opam install merlin ocaml-lsp-server
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
brew install --cask font-hack-nerd-font
brew install --cask font-latin-modern

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

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # END

brew cleanup
