DIR  = setup-shells

BREW = $(DIR)/homebrew.sh
OMZ  = $(DIR)/omz.sh
OPAM = $(DIR)/opam.sh
CASK = $(DIR)/casks.sh
MAS  = $(DIR)/mas.sh

MIN  = min

all:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
	./$(DIR)/symlinks.sh
	./$(DIR)/macos.sh
	ssh-keygen -t ed25519 -C "p.patault@gmail.com"
	eval "$(ssh-agent -s)"
	echo "Host *\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" > ~/.ssh/config
	ssh-add -K ~/.ssh/id_ed25519
	pbcopy < ~/.ssh/id_ed25519.pub
	echo "\033[31;1mAller sur github et ajouter la clé \!\033[0m"

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
