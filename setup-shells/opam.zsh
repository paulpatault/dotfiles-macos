OPAM_MIN=(
utop
ocaml-lsp-server
merlin
menhir
dune
)

OPAM_ALL=(
alt-ergo
coq
core
graphics
ocamlfind
ocaml-system
why3
why3-ide
)

opam init

if [[ $1 ]]
then
    opam install ${OPAM_MIN[@]}
else
    opam install ${OPAM_MIN[@]}
    opam install ${OPAM_ALL[@]}
fi


