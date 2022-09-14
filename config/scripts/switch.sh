#!/bin/bash

echo "Enter switch name : "
read switch
echo "Enter OCaml version : "
read version

export OPAMYES=true

if opam switch create $switch $version
then
    eval $(opam env --switch=$switch)
    opam install \
        ocp-indent \
        ocaml-lsp-server \
else
    echo "nok"
fi
