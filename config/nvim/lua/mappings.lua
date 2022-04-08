local utils = require('utils')

local options = {
  noremap = true,
  silent = true
}

-- {{{ telescope
utils.map_lua('n', '<leader>p'  , [[require('telescope.builtin').find_files()]], options)
utils.map_lua('n', '<leader>b'  , [[require('telescope.builtin').buffers()]], options)
utils.map_lua('n', '<leader>ds' , [[require('telescope.builtin').lsp_document_symbols()]], options)
utils.map_lua('n', '<leader>dg' , [[require('telescope.builtin').diagnostics()]], options)
-- 'n', 'gd']     ,   = [[require('telescope.builtin').lsp_definitions()]],
-- 'n', 'gd']     ,   = [[require('telescope.builtin').lsp_implementations()]],
utils.map_lua('n', '<leader>ca' , [[require('telescope.builtin').lsp_code_actions()]], options)
utils.map_lua('n', '<leader>gf' , [[require('telescope.builtin').git_files()]], options)
utils.map_lua('n', '<leader>rg' , [[require('telescope.builtin').live_grep()]], options)
utils.map_lua('n', '<leader>fb' , [[require('telescope').extensions.file_browser.file_browser()]], options)

-- }}}

-- {{{ lsp
utils.map_lua('n', '<leader>rn', [[vim.lsp.buf.rename()]], options)
utils.map_lua('n', 'grf', [[vim.lsp.buf.references()]], options)
utils.map_lua('n', 'gd', [[vim.lsp.buf.definition()]], options)
utils.map_lua('n', 'gD', [[vim.lsp.buf.implementation()]], options)
utils.map_lua('n', 'dc', [[vim.lsp.buf.hover()]], options)
utils.map_lua('n', 'ds', [[vim.lsp.buf.signature_help()]], options)
utils.map_lua('n', 'gT', [[vim.lsp.buf.type_definition()]], options)
-- utils.map_lua-- ('n', 'gf', [[vim.lsp.buf.formatting()]], options)
utils.map_lua('n', 'dl', [[vim.diagnostic.open_float()]], options)
utils.map_lua('n', 'dn', [[vim.diagnostic.goto_next()]], options)
utils.map_lua('n', 'dN', [[vim.diagnostic.goto_prev()]], options)
utils.map_lua('n', 'do', [[vim.diagnostic.enable()]], options)
utils.map_lua('n', 'df', [[vim.diagnostic.disable()]], options)
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
function Switch_ml(x)
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
utils.map_lua('n', 'ml',  "Switch_ml(true)", options)
utils.map_lua('n', 'mli', "Switch_ml(false)", options)
-- }}}

-- {{{ format
utils.map('n', 'ff', ':Neoformat<cr>', options)
utils.map('v', 'ff', ':Neoformat<cr>', options)
-- }}}
--

-- {{ general
utils.map('n', '<leader>sp', [[:setlocal spell!<cr>]], options)
utils.map('n', '<leader>sc', [[:luafile ~/.config/nvim/init.lua<cr>]], {noremap = true})
utils.map('n', '<leader>rt', [[:%s/\s\+$//e<cr>]], {noremap = true})
utils.map('n', '<A-Tab>',    [[:tabnext<cr>]], {noremap = true})
utils.map('n', '<A-S-Tab>',  [[:tabprev<cr>]], {noremap = true})
utils.map('v', 'J',  [[:m '>+1<cr>gv=gv]], {noremap = true})
utils.map('v', 'K',  [[:m '<-2<cr>gv=gv]], {noremap = true})
utils.map('n', '<esc><esc>',  [[:noh<cr>]], {noremap = true})
utils.map_lua('n', '<leader>w', "utils.Wrap_toogle()", options)


local pres = false
function Toogle_nu()
  pres = not pres
  vim.cmd ":ZenMode"
  if (pres) then
    vim.wo.number = false
    vim.wo.relativenumber = false
  else
    vim.wo.number = true
    vim.wo.relativenumber = true
  end
end

utils.map_lua('n', 'pr', "Toogle_nu()", options)
-- }}
