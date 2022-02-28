all: base
	./setup-shells/homebrew.zsh
	./setup-shells/omzsh.zsh
	./setup-shells/opam.zsh
	./setup-shells/casks.zsh
	./setup-shells/mas.zsh

minimal: base
	./setup-shells/homebrew.zsh minimal
	./setup-shells/omzsh.zsh
	./setup-shells/opam.zsh     minimal
	./setup-shells/casks.zsh    minimal
	./setup-shells/mas.zsh      minimal

base:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	./setup-shells/symlinks.zsh
	./setup-shells/mac-os.zsh
