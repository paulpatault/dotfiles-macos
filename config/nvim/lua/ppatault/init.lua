require("ppatault.set")
require("ppatault.highlights")
-- require("ppatault.ocaml")
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
}, "Buf_augrp")

augroup({
  {"FileType", "c,tex,cpp", "set", "sw=4"},
  {"FileType", "markdown,lua,kawa,ocaml,why3,lustre", "set", "sw=2"},
  {"FileType", "tex", "setlocal", "spell"},
}, "Ft_augrp")

augroup({
  {"FileType", "tex", "set", "makeprg=pdflatex\\ -shell-escape\\ %"},
  {"FileType", "ocaml", "set", "makeprg=dune\\ build"},
  {"FileType", "rust", "set", "makeprg=cargo\\ build"},
}, "Ft_makeprg")


local ok, res = pcall(function() require("ppatault.lsp_config") end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require("plenary.reload").reload_module

function R(name)
  RELOAD(name)
  return require(name)
end

R("nvim-web-devicons").setup()
R("lspkind").init()
RELOADER = function()
  R("ppatault.nvim-cmp")
  R("ppatault.statusline")
  R("ppatault.plenary")
  R("ppatault.telescope")
  R("ppatault.ripple")
  R("ppatault.kommentary")
  R("ppatault.mappings")
  R("ppatault.globals")
end

RELOADER()
