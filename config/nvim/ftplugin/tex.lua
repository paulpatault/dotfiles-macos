local keymap = require("ppatault.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap

vnoremap("<C-b>", "<Plug>(sandwich-add)ctextbf<cr>")
vnoremap("<C-i>", "<Plug>(sandwich-add)ctextit<cr>")
vnoremap("<C-t>", "<Plug>(sandwich-add)ctexttt<cr>")
nnoremap("<leader>i", "i~$$<esc>i")
nnoremap("tc", ":VimtexCompile<cr>")
