all:
	make sudo
	make symlinks
	make macos
	make brew
	make omzsh
	make opam
	make casks
	make mas

minimal:
	make sudo
	make symlinks
	make macos
	make brew minimal
	make omzsh
	make opam minimal
	make casks minimal
	make mas minimal

sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

brew:
	./setup-shells/homebrew.zsh

casks:
	./setup-shells/casks.zsh

macos:
	./setup-shells/mac-os.zsh

symlinks:
	./setup-shells/symlinks.zsh

opam:
	./setup-shells/opam.zsh

mas:
	./setup-shells/mas.zsh

omzsh:
	./setup-shells/omzsh.zsh
