CASKS_MIN=(
kitty
font-hack-nerd-font
font-latin-modern
font-dejavu-sans-mono-nerd-font
font-jetbrains-mono-nerd-font
)


CASKS_ALL=(
gimp
mactex

firefox
google-chrome

vlc
folx

messenger
slack
telegram
discord

drawio
)

brew tap homebrew/cask-fonts


if [[ $1 ]]
then
    brew install --cask ${CASKS_MIN[@]}
else
    brew install --cask ${CASKS_MIN[@]}
    brew install --cask ${CASKS_ALL[@]}
fi

