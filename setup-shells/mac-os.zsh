# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SUDO

# Activation sudo
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # SETTINGS

# répétition des caratères au lieu de l'affichage des accents
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# affichage des • des apps ouvertes
defaults write com.apple.dock show-process-indicators -bool true

# taille du Dock
defaults write com.apple.dock tilesize -int 49

# effet de minimisation des apps
defaults write com.apple.dock mineffect -string "genie"

# dock se cache
defaults write com.apple.dock autohide -bool "true"
defaults write com.apple.dock show-recents -bool false

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
defaults write com.apple.Finder FXPreferredViewStyle "clmv"

# garde les dossiers en haut
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# dossier pour capture d'écran
mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # KILLALL

# Kill affected apps
for app in "Dock" "Finder" "SystemUIServer"; do
  killall "${app}" > /dev/null 2>&1
done
