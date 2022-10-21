#!/bin/bash

echo "Enter switch name : "
read switch
echo "Enter OCaml version : "
read version

export OPAMYES=true

if opam switch create $switch $version
then
    echo "$(tput setaf 0)$(tput setab 2)[ Installation du switch OK ]$(tput sgr 0)"
else
    echo "$(tput setaf 1)$(tput setab 3)[ Erreur d'installation du switch ]$(tput sgr 0)"
    exit 1
fi

eval "$(opam env --switch=$switch)"

opam update

opam install \
    ocp-indent \
    ocaml-lsp-server \
    utop \
    ocamlformat-rpc \
    merlin

