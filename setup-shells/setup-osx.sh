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
defaults write com.apple.dock tilesize -int 49

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

# dossier pour capture d'écran

mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # WALLPAPER

# download images
wget https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Jacques-Louis_David%2C_The_Coronation_of_Napoleon.jpg/1920px-Jacques-Louis_David%2C_The_Coronation_of_Napoleon.jpg
wget https://upload.wikimedia.org/wikipedia/commons/2/2b/Christoffer_Wilhelm_Eckersberg_-_Ulysses%27_revenge_on_Penelope%27s_suitors_-_Google_Art_Project.jpg
wget https://ltshs.hypotheses.org/files/2019/06/Napoleon-a-Sainte-Helene-1.jpg
wget https://upload.wikimedia.org/wikipedia/commons/6/6c/Orleans_MBA_L_Le_nain_bacchus_et_ariane.jpg
# deplacement dans le dossier wallpaper
mkdir -p ~/Documents/Divers/Wallpaper
mv 1920px-Jacques-Louis_David,_The_Coronation_of_Napoleon.jpg ~/Documents/Divers/Wallpaper
mv Christoffer_Wilhelm_Eckersberg_-_Ulysses\'_revenge_on_Penelope\'s_suitors_-_Google_Art_Project.jpg ~/Documents/Divers/Wallpaper
mv Napoleon-a-Sainte-Helene-1.jpg ~/Documents/Divers/Wallpaper
mv Orleans_MBA_L_Le_nain_bacchus_et_ariane.jpg ~/Documents/Divers/Wallpaper

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # KILLALL

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# MORE
# https://dev.to/nickytonline/pock-an-awesome-utility-for-the-mac-touchbar-11ia
