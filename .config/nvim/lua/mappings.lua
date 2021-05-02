local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

--{{{ kommentary
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default", {})
--}}}

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
utils.map('i', '<Tab>', [[v:lua.utils.tab_complete()]], { expr = true })
utils.map('s', '<Tab>', [[v:lua.utils.tab_complete()]], { expr = true })
-- utils.map('i', '<S-Tab>', [[v:lua.utils.s_tab_complete()]],{ expr = true })
-- utils.map('s', '<S-Tab>', [[v:lua.utils.s_tab_complete()]],{ expr = true })
-- }}}

-- {{{ telescope
utils.map_lua('n', '<leader>p',  [[require'telescope.builtin'.find_files{}]], options)
utils.map_lua('n', '<leader>b', [[require'telescope.builtin'.buffers{}]], options)
utils.map_lua('n', '<leader>n',  [[require'telescope.builtin'.file_browser{}]], options)

utils.map_lua('n', '<leader>ds', [[require'telescope.builtin'.lsp_document_symbols{}]], options)
utils.map_lua('n', '<leader>dg', [[require'telescope.builtin'.lsp_document_diagnostics{}]], options)
utils.map_lua('n', '<leader>ld', [[require'telescope.builtin'.lsp_definition{}]], options)
utils.map_lua('n', '<leader>ca', [[require'telescope.builtin'.lsp_code_actions{}]], options)

utils.map_lua('n', '<leader>sf', [[require'telescope.builtin'.git_files{}]], options)
utils.map_lua('n', '<leader>rg', [[require'telescope.builtin'.live_grep{}]], options)
-- utils.map_lua('n', '<leader>ls', [[require'telescope.builtin'.lsp_references{}]], options)
-- utils.map_lua('n', '<leader>ws', [[require'telescope.builtin'.lsp_workspace_symbols{}]], options)
-- utils.map_lua('n', '<leader>wg', [[require'telescope.builtin'.lsp_workspace_diagnostics{}]], options)
-- utils.map('v', '<leader>ca', [[<cmd>'<,'>lua require'telescope.builtin'.lsp_range_code_actions{}<CR>]], options)
-- }}}

-- {{{ Floaterm
utils.map('n', '<leader>tg', ':FloatermNew lazygit<cr>', options)
-- }}}

-- {{{ lspsaga
utils.map_lua('n', 'ds', [[require'lspsaga.signaturehelp'.signature_help()]], options)
utils.map_lua('n', 'df', [[require'lspsaga.provider'.preview_definition()]], options)
utils.map_lua('n', 'dc', [[require'lspsaga.hover'.render_hover_doc()]], options)
utils.map_lua('n', 'rn', [[require'lspsaga.rename'.rename()]], options)
utils.map_lua('n', 'ff', [[require'lspsaga.provider'.lsp_finder()]], options)
utils.map_lua('n', 'dn', [[require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()]], options)
utils.map_lua('n', 'dN', [[require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()]], options)
utils.map_lua('n', '<C-f>', [[require'lspsaga.action'.smart_scroll_with_saga(1)]], options)
utils.map_lua('n', '<C-d>', [[require'lspsaga.action'.smart_scroll_with_saga(2)]], options)

-- }}}

-- {{{ lsp
utils.map_lua('n', 'gd', [[vim.lsp.buf.definition()]], options)
utils.map_lua('n', 'gD', [[vim.lsp.buf.implementation()]], options)
utils.map_lua('n', '<c-K>', [[vim.lsp.buf.signature_help()]], options)
utils.map_lua('n', 'gT', [[vim.lsp.buf.type_definition()]], options)
utils.map_lua('n', 'grf', [[vim.lsp.buf.references()]], options)
-- utils.map_lua('n', 'g0', [[vim.lsp.buf.document_symbol()]], options)
-- utils.map_lua('n', 'gW', [[vim.lsp.buf.workspace_symbol()]], options)
-- utils.map('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
-- }}}

-- {{{ vimtex
utils.map('n', 'tc', ':VimtexCompile<cr>', options)
-- }}}
