full:
	./setup-shells/homebrew.zsh
	./setup-shells/omzsh.zsh
	./setup-shells/opam.zsh
	./setup-shells/casks.zsh
	./setup-shells/mas.zsh

minimal:
	./setup-shells/homebrew.zsh minimal
	./setup-shells/omzsh.zsh
	./setup-shells/opam.zsh     minimal
	./setup-shells/casks.zsh    minimal
	./setup-shells/mas.zsh      minimal

all:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	./setup-shells/symlinks.zsh
	./setup-shells/mac-os.zsh
	ssh-keygen -t ed25519 -C "p.patault@gmail.com"
	eval "$(ssh-agent -s)"
	echo "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
	ssh-add -K ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
	echo "aller sur github et ajouter la clé"
