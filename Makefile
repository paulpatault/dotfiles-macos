DIR  = setup-shells

BREW = $(DIR)/homebrew.zsh
OMZ  = $(DIR)/omzsh.zsh
OPAM = $(DIR)/opam.zsh
CASK = $(DIR)/casks.zsh
MAS  = $(DIR)/mas.zsh

MIN  = min

all:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	./$(DIR)/symlinks.zsh
	./$(DIR)/mac-os.zsh
	ssh-keygen -t ed25519 -C "p.patault@gmail.com"
	eval "$(ssh-agent -s)"
	echo "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
	ssh-add -K ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
	echo "aller sur github et ajouter la clé"

full:
	./$(BREW)
	./$(OMZ)
	./$(OPAM)
	./$(CASK)
	./$(MAS)

minimal:
	./$(BREW) $(MIN)
	./$(OMZ)
	./$(OPAM) $(MIN)
	./$(CASK) $(MIN)
	./$(MAS)  $(MIN)
