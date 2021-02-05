# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# Activation sudo
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SETTINGS

# répétition des caratères au lieu de l'affichage des accents
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# affichage des • des apps ouvertes
defaults write com.apple.dock show-process-indicators -bool true

# taille du Dock
defaults write com.apple.dock tilesize -int 53

# effet de minimisation des apps
defaults write com.apple.dock mineffect -string "genie"

# repetition de touche
defaults write NSGlobalDomain KeyRepeat -int 1

# repetition n°1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # FINDER

# affichage des dotfiles
defaults write com.apple.finder AppleShowAllFiles -boolean true

# affichage chemin absolu
defaults write com.apple.finder ShowPathbar -bool true

# affichage bar statut
defaults write com.apple.finder ShowStatusBar -bool true

# affichage des extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# style colonne finder
defaults write com.apple.Finder FXPreferredViewStyle clmv

# relance finder
killall Finder

# dossier pour capture d'écran

mkdir /Users/patault/Documents/Screenshots
defaults write com.apple.screencapture location /Users/patault/Documents/Screenshots

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # X-CODE

xcode-select --install

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # HOMEBREW

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # GIT CONFIG

git config --global user.name "paulpatault"
git config --global user.email "p.patault@gmail.com"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # PYTHON

brew install python

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # NODEJS

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash

export NVM_DIR="/Users/patault/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm so we dont have to reboot the terminal

nvm install node
nvm use node

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # NEOVIM

brew install neovim --HEAD

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # OCAML

brew install ocaml opam
opam init
opam install merlin ocaml-lsp-server
opam user-setup install
opam install ocp-indent
opam install ocamlformat

# brew install Caskroom/cask/xquartz
# brew install xquartz
# opam install graphics

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # BREW

brew install cmake tree-sitter wget

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # CASKS BREW

brew cask install \
github \
firefox \
visual-studio-code \
iterm2 \
spotify \
vlc \
microsoft-office \
sublime-text

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # ZSH, OH-MY-ZSH

### CHECK https://gist.github.com/kevin-smets/8568070

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh

# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install zsh-syntax-highlighting

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
brew install zsh-autosuggestions

# help: https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # WALLPAPER

# install wget
brew install wget

# download .jpg to ~/
wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Jacques-Louis_David%2C_The_Coronation_of_Napoleon.jpg/1920px-Jacques-Louis_David%2C_The_Coronation_of_Napoleon.jpg

# deplacement sur bureau
mv 1920px-Jacques-Louis_David,_The_Coronation_of_Napoleon.jpg Desktop

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SCRIPTS

brew install bat thefuck

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # END

brew update && brew upgrade && brew cleanup
brew cask cleanup

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # KILLALL

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# MORE
# https://dev.to/nickytonline/pock-an-awesome-utility-for-the-mac-touchbar-11ia
