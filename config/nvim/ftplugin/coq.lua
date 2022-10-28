local nnoremap = require("ppatault.keymap").nnoremap
-- local inoremap = require("ppatault.keymap").inoremap

nnoremap("s", ":CoqNext<cr>")
nnoremap("S", ":CoqUndo<cr>")

nnoremap("<down>",  "<Plug>CoqNext")
nnoremap("<up>",    "<Plug>CoqUndo")
nnoremap("<right>", "<Plug>CoqToLine")
nnoremap("<left>",  "<Plug>CoqToTop")
