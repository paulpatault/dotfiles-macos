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
texlab
emscripten

# basics
cmake
wget
nvm
node
llvm
stockfish
rust
mas

# ocaml
ocaml
opam

# opengl
glm
glew
glfw
opencv@2

# zsh
zsh-syntax-highlighting
zsh-autosuggestions

# scripts
bat
thefuck
tree
htop
lazygit
insect
imlib2
imagemagick
)

###################################################################################################

CASK=(
# programming
github
visual-studio-code
atom
kitty
clion
intellij-idea
gimp
mactex
devbook
xquartz

# fonts
font-hack-nerd-font
font-latin-modern
font-dejavu-sans-mono-nerd-font
font-jetbrains-mono-nerd-font
# browser
firefox
google-chrome

# reader
spotify
vlc

# communication
messenger
slack
telegram
discord

# courses
microsoft-word
microsoft-excel
microsoft-powerpoint
microsoft-teams
zoomus
drawio
typora
)

###################################################################################################

PIP3=(
neovim-remote
virtualenv
pynvim
)

###################################################################################################

MAS=(
1176895641 # spark email
497799835  # XCODE
1244649277 # Photo Image Editor Pixelstyle
1494457680 # Smash: File transfer
1440147259 # AddGuard for Safari
)

###################################################################################################

OPAM=(
merlin
ocaml-lsp-server
dune
menhir
graphics
)

###################################################################################################

arch -arm64 brew install neovim --HEAD
brew tap homebrew/cask-fonts

arch -arm64 brew install ${BREW[@]}
arch -arm64 brew install --cask ${CASK[@]}

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
