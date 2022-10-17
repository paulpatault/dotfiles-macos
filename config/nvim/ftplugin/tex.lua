local keymap = require("ppatault.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap

vnoremap("<localleader>b", "<Plug>(sandwich-add)ctextbf<cr>")
vnoremap("<localleader>i", "<Plug>(sandwich-add)ctextit<cr>")
vnoremap("<localleader>t", "<Plug>(sandwich-add)ctexttt<cr>")
nnoremap("<leader>i", "i~$$<esc>i")
nnoremap("<localleader>tc", ":VimtexCompile<cr>")
