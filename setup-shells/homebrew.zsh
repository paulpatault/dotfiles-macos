/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

BREW_MIN=(
wget
rg
fd
fzf
git
tree-sitter
zsh-syntax-highlighting
zsh-autosuggestions
autoconf
bat
tree
lazygit
koekeishiya/formulae/skhd
jq
colordiff
)

BREW_ALL=(
cask
mas
texlab
node
mas
imlib2
imagemagick
# vldmrkl/formulae/airdrop-cli
)

brew install neovim --HEAD
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

if [[ $1 ]]
then
    brew install ${BREW_MIN[@]}
else
    brew install ${BREW_MIN[@]}
    brew install ${BREW_ALL[@]}
fi

brew cleanup
