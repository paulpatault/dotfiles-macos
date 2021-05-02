sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install

sudo sh setup-symlinks.sh
sh setup-installations.sh
sudo sh setup-osx.sh
