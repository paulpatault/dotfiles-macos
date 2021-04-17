sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &



xcode-select --install

sh setup-brew.sh
sudo sh setup-osx.sh
sudo sh setup-terminal.sh
sudo sh setup-symlinks.sh
