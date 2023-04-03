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
python@3.10
)

BREW_ALL=(
cask
mas
folx
texlab
node
mas
imlib2
imagemagick
)

brew install neovim --HEAD

if [[ $1 ]]
then
    brew install ${BREW_MIN[@]}
else
    brew install ${BREW_MIN[@]}
    brew install ${BREW_ALL[@]}
fi

brew cleanup
