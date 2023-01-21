require("ppatault.set")
require("ppatault.mappings")
require("ppatault.globals")

require("ppatault.highlights")
require("ppatault.ocaml")
require("ppatault.plugins")
require("rust-tools").setup({})
require("impatient")

local augroup = require("ppatault.utils").create_augroup

augroup({
  {"BufRead,BufNewFile", "*.zsh", "set", "filetype=sh"},
  {"BufRead,BufNewFile", "*.mlw", "set", "filetype=why3"},
  {"BufRead,BufNewFile", "*.mp",  "set", "filetype=patmat"},
  {"BufRead,BufNewFile", "*.lus", "set", "filetype=lustre"},
  {"BufRead,BufNewFile", "*.ept", "set", "filetype=lustre"},
  {"BufRead,BufNewFile", "*.proof", "set", "filetype=proof"},
  {"BufRead,BufNewFile", "*.mll", "set", "filetype=ocaml.ocamllex"},
  -- {"BufRead,BufNewFile", "*.mly", "set", "filetype=ocaml.menhir"},
  {"BufRead,BufNewFile", "*.mli", "set", "filetype=ocaml.interface"},
}, "Buf_augrp")

augroup({
  {"FileType", "c,tex,cpp", "set", "sw=4"},
  {"FileType", "markdown,lua,kawa,ocaml,why3,lustre", "set", "sw=2"},
  {"FileType", "tex", "setlocal", "spell"},
  -- {"FileType", "ocaml", "setlocal", "spell"},
}, "Ft_augrp")

augroup({
  {"FileType", "tex", "set", "makeprg=pdflatex\\ -shell-escape\\ %"},
  {"FileType", "ocaml", "set", "makeprg=dune\\ build"},
  {"FileType", "rust", "set", "makeprg=cargo\\ build"},
}, "Ft_makeprg")


function R(name)
    require("plenary.reload").reload_module(name)
end
