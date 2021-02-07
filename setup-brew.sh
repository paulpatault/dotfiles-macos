# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# Activation sudo
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # HOMEBREW

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # NEOVIM

brew install neovim --HEAD

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # OCAML

brew install ocaml opam
opam init
opam install merlin ocaml-lsp-server
opam user-setup install
opam install ocp-indent
opam install ocamlformat

# Graphics stuff
# brew install Caskroom/cask/xquartz
# brew install xquartz
# opam install graphics

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # BREW

brew install cmake tree-sitter wget nvm stockfish

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # CASKS BREW

# programming
brew install --cask github
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask jetbrains-toolbox

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

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ZSH, OH-MY-ZSH

### CHECK https://gist.github.com/kevin-smets/8568070

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install zsh-syntax-highlighting

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install zsh-autosuggestions

# help: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SCRIPTS

brew install bat thefuck

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # END

brew cleanup
