local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

-- {{{ telescope
local telescope = {
  ['<leader>p']  = [[require'telescope.builtin'.find_files{}]],
  ['<leader>b']  = [[require'telescope.builtin'.buffers{}]],
  ['<leader>n']  = [[require'telescope.builtin'.file_browser{}]],
  ['<leader>ds'] = [[require'telescope.builtin'.lsp_document_symbols{}]],
  ['<leader>dg'] = [[require'telescope.builtin'.lsp_document_diagnostics{}]],
  ['<leader>ld'] = [[require'telescope.builtin'.lsp_definition{}]],
  ['<leader>ca'] = [[require'telescope.builtin'.lsp_code_actions{}]],
  ['<leader>sf'] = [[require'telescope.builtin'.git_files{}]],
  ['<leader>rg'] = [[require'telescope.builtin'.live_grep{}]],
}

for key, map in pairs(telescope) do
    utils.map_lua('n', key, map, options)
end
-- }}}

-- {{{ lsp
local lsp = {
  ['<leader>rn'] = [[vim.lsp.buf.rename()]],
  ['grf'] = [[vim.lsp.buf.references()]],
  ['gd'] = [[vim.lsp.buf.definition()]],
  ['gD'] = [[vim.lsp.buf.implementation()]],
  ['dc'] = [[vim.lsp.buf.hover()]],
  ['ds'] = [[vim.lsp.buf.signature_help()]],
  ['gT'] = [[vim.lsp.buf.type_definition()]],
  ['dl'] = [[vim.lsp.diagnostic.show_line_diagnostics()]],
  ['dn'] = [[vim.lsp.diagnostic.goto_next()]],
  ['dN'] = [[vim.lsp.diagnostic.goto_prev()]],
  ['do'] = [[vim.lsp.diagnostic.enable()]],
  ['df'] = [[vim.lsp.diagnostic.disable()]],
}

for key, map in pairs(lsp) do
    utils.map_lua('n', key, map, options)
end
-- }}}

--{{{ Terminal Mode
utils.map('t', '<esc>', '<c-\\><c-n>', options)
--}}}

--{{{ Kommentary
utils.map("n", "<leader>c", "<Plug>kommentary_line_default", {})
utils.map("v", "<leader>c", "<Plug>kommentary_visual_default", {})
--}}}

-- {{{ Floaterm
utils.map('n', '<leader>tg', ':FloatermNew lazygit<cr>', options)
-- }}}

-- {{{ Todo + trouble
utils.map('n', '<leader>tt', ':TodoTelescope<cr>', options)
utils.map('n', '<leader>tr', ':TroubleToggle<cr>', options)
-- }}}

-- {{{ vimtex
utils.map('n', 'tc', ':VimtexCompile<cr>', options)
-- }}}
