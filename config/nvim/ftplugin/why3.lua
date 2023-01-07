local nnoremap = require("ppatault.keymap").nnoremap

nnoremap("<localleader>i", [[:!why3 ide %&<cr>]])
