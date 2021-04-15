--{{{ compe
vim.cmd [[call lexima#set_default_rules()]]
utils.map('i', '<C-Space>', 'compe#complete()', {
  noremap = true,
  silent = true,
  expr = true
})
utils.map('i', '<CR>', [[compe#confirm(lexima#expand('<LT>CR>', 'i'))]], {
  noremap = true,
  silent = true,
  expr = true
})
utils.map('i', '<Tab>', [[v:lua.utils.tab_complete()]],{ expr = true })
utils.map('s', '<Tab>', [[v:lua.utils.tab_complete()]],{ expr = true })
utils.map('i', '<S-Tab>', [[v:lua.utils.s_tab_complete()]],{ expr = true })
utils.map('s', '<S-Tab>', [[v:lua.utils.s_tab_complete()]],{ expr = true })
-- }}}
