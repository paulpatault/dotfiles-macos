local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

-- {{{ telescope
local telescope = {
  ['<leader>p']  = [[require('telescope.builtin').find_files()]],
  ['<leader>b']  = [[require('telescope.builtin').buffers()]],
  ['<leader>ds'] = [[require('telescope.builtin').lsp_document_symbols()]],
  ['<leader>dg'] = [[require('telescope.builtin').diagnostics()]],
  -- ['gd']         = [[require('telescope.builtin').lsp_definitions()]],
  -- ['gd']         = [[require('telescope.builtin').lsp_implementations()]],
  ['<leader>ca'] = [[require('telescope.builtin').lsp_code_actions()]],
  ['<leader>gf'] = [[require('telescope.builtin').git_files()]],
  ['<leader>rg'] = [[require('telescope.builtin').live_grep()]],
  ['<leader>fb'] = [[require('telescope').extensions.file_browser.file_browser()]],
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
  -- ['gf'] = [[vim.lsp.buf.formatting()]],
  ['dl'] = [[vim.diagnostic.open_float()]],
  ['dn'] = [[vim.diagnostic.goto_next()]],
  ['dN'] = [[vim.diagnostic.goto_prev()]],
  ['do'] = [[vim.diagnostic.enable()]],
  ['df'] = [[vim.diagnostic.disable()]],
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

-- {{{ ocaml
function Switcher_ml(x)
  local filename = vim.fn.expand('%:t:r')
  if x then
    vim.cmd (":ML " .. filename)
  else
    vim.cmd (":MLI " .. filename)
  end
end

utils.map('n', '<leader>af', 'a assert false<esc>', options)
utils.map('n', '<leader>aft', 'a assert false (* TODO *)<esc>', options)
utils.map('n', '<leader>d', 'i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i', options)
utils.map_lua('n', 'ml', "Switcher_ml(true)", options)
utils.map_lua('n', 'mli', "Switcher_ml(false)", options)
-- }}}

-- {{{ format
utils.map('n', 'ff', ':Neoformat<cr>', options)
utils.map('v', 'ff', ':Neoformat<cr>', options)
-- }}}
--

-- {{ general
utils.map('n', '<leader>sp', [[:setlocal spell!<cr>]], {noremap = true, silent = true})
utils.map('n', '<leader>sc', [[:luafile ~/.config/nvim/init.lua<cr>]], {noremap = true})
utils.map('n', '<leader>rt', [[:%s/\s\+$//e<cr>]], {noremap = true})
utils.map('n', '<A-Tab>',    [[:tabnext<cr>]], {noremap = true})
utils.map('n', '<A-S-Tab>',  [[:tabprev<cr>]], {noremap = true})
utils.map('v', 'J',  [[:m '>+1<cr>gv=gv]], {noremap = true})
utils.map('v', 'K',  [[:m '<-2<cr>gv=gv]], {noremap = true})
utils.map('n', '<esc><esc>',  [[:noh<cr>]], {noremap = true})
utils.map_lua('n', '<leader>w', "utils.Wrap_toogle()", {noremap = true, silent = true})
-- }}
