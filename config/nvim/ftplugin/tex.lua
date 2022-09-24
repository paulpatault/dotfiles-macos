local keymap = require("ppatault.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
-- local tnoremap = keymap.tnoremap
-- local nunmap   = keymap.nunmap
-- local vunmap   = keymap.vunmap

vnoremap("<C-b>", "c\\textbf{}<esc>hp")
vnoremap("<C-i>", "c\\textit{}<esc>hp")
vnoremap("<C-t>", "c\\texttt{}<esc>hp")
nnoremap("<leader>i", "i~$$<esc>i")
nnoremap("tc", ":VimtexCompile<cr>")
