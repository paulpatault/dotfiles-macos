local utils = require('utils')

utils.create_augroup({
  {'BufRead,BufNewFile', '*.zsh', 'set', 'filetype=sh'},
  {'BufRead,BufNewFile', '*.mlw', 'set', 'filetype=why3'},
  {'BufRead,BufNewFile', '*.mp', 'set', 'filetype=patmat'}},
'BufE')

utils.create_augroup({
  {'FileType', 'c,tex,cpp', 'set', 'sw=4'},
  {'FileType', 'markdown,lua,kawa,ocaml,why3', 'set', 'sw=2'},
} , 'Tabs_len')
