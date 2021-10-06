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
utils.map_lua('n', 'ff', [[require'lspsaga.provider'.lsp_finder()]], options)
-- }}}

-- {{{ lsp
utils.map_lua('n', 'gd', [[vim.lsp.buf.definition()]], options)
utils.map_lua('n', 'gD', [[vim.lsp.buf.implementation()]], options)
utils.map_lua('n', 'dc', [[vim.lsp.buf.hover()]], options)
utils.map_lua('n', 'ds', [[vim.lsp.buf.signature_help()]], options)
-- utils.map_lua('n', 'df', [[vim.lsp.buf.preview_definition()]], options)
utils.map_lua('n', 'gT', [[vim.lsp.buf.type_definition()]], options)
utils.map_lua('n', 'grf', [[vim.lsp.buf.references()]], options)
utils.map_lua('n', '<leader>rn', [[vim.lsp.buf.rename()]], options)

utils.map_lua('n', 'dl', [[vim.lsp.diagnostic.show_line_diagnostics()]], options)
utils.map_lua('n', 'dn', [[vim.lsp.diagnostic.goto_next()]], options)
utils.map_lua('n', 'dN', [[vim.lsp.diagnostic.goto_prev()]], options)
utils.map_lua('n', 'do', [[vim.lsp.diagnostic.enable()]], options)
utils.map_lua('n', 'df', [[vim.lsp.diagnostic.disable()]], options)
-- utils.map('n', '<leader>sh', ':ClangdSwitchSourceHeader<cr>', options)
-- }}}

-- {{{ vimtex
utils.map('n', 'tc', ':VimtexCompile<cr>', options)
-- }}}
