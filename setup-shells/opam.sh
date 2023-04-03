#!/bin/zsh

OPAM_MIN=(
ocaml
ocaml-lsp-server
menhir
dune
merlin
ocamlfind
utop
)

OPAM_ALL=(
alt-ergo
coq
core
graphics
ocaml-system
why3
why3-ide
)

bash -c "sh <(curl -fsSL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh)"

opam init
eval $(opam env --switch=default)

if [[ $1 ]]
then
    opam install ${OPAM_MIN[@]}
else
    opam install ${OPAM_MIN[@]}
    opam install ${OPAM_ALL[@]}
fi


