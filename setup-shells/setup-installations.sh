###################################################################################################

# echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

###################################################################################################

BREW=(
# neovim
cask
git
mas
tree-sitter
lua
luajit
luarocks
emscripten
texlab
rg

# basics
cmake
wget
nvm
node
llvm
rust
mas
opam

# zsh
zsh-syntax-highlighting
zsh-autosuggestions

# scripts
autoconf
bat
tree
lazygit
imlib2
imagemagick

# bazar
vldmrkl/formulae/airdrop-cli
)

###################################################################################################

CASK=(
# programming
kitty
gimp
mactex

# fonts
font-hack-nerd-font
font-latin-modern
font-dejavu-sans-mono-nerd-font
font-jetbrains-mono-nerd-font

# browser
firefox
google-chrome

# reader
# spotify
vlc
folx

# communication
messenger
slack
telegram
discord

# courses
drawio
)

###################################################################################################

# PIP3=(
# neovim-remote
# virtualenv
# pynvim
# )

###################################################################################################

MAS=(
1176895641 # spark email
# 497799835  # XCODE
1244649277 # Photo Image Editor Pixelstyle
1494457680 # Smash: File transfer
1440147259 # AddGuard for Safari
)

###################################################################################################

OPAM=(
alt-ergo
coq
core
dune
graphics
menhir
merlin
ocamlfind
ocaml-lsp-server
ocaml-system
utop
why3
why3-ide
)

###################################################################################################

brew install neovim --HEAD
brew tap homebrew/cask-fonts

brew install ${BREW[@]}
brew install --cask ${CASK[@]}

pip3 install ${PIP3[@]}

mas install ${MAS[@]}

opam init
opam install ${OPAM[@]}


###################################################################################################

git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

###################################################################################################

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

###################################################################################################

mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

###################################################################################################

brew cleanup
