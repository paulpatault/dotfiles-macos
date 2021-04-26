local g = vim.g
local o = vim.o
local w = vim.wo
local b = vim.bo

local utils = require('utils')
local cmd = vim.cmd

g.mapleader = ' '
g.langmenu = [[en_US.UTF-8]]

g.gruvbox_invert_selection = false
g.background = [[dark]]

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false
b.spelllang = [[fr,en]]

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.lazyredraw = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.number = true
w.relativenumber = true

w.list = true
if vim.fn.has('multi_byte') == 1 and o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

w.colorcolumn = [[100]]
w.wrap = false

o.encoding = 'utf-8'

o.termguicolors = true


o.clipboard = [[unnamed,unnamedplus]]

o.scrolloff = 8

o.timeoutlen = 300

o.mouse = 'a'

o.completeopt = [[menuone,noinsert,noselect]]

-- General mappings, not depending on any plugins
utils.map('n', '<leader>sp', [[:setlocal spell!<CR>]], {noremap = true})

utils.map('n', '<C-f>', [[:!open . && open -a Finder<CR>]], {noremap = true})

utils.map('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
utils.map('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

utils.map('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
utils.map('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})

utils.map('n', '<Up>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Down>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Left>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})
utils.map('n', '<Right>', [[:echoerr "Do not do that!!"<cr>]], {noremap = true})

utils.create_augroup({
  {'FileType', '*', 'setlocal', 'shiftwidth=4'},
  {'FileType', 'ocaml,lua', 'setlocal', 'shiftwidth=2'},
  {'FileType', 'dap-rel', [[lua require('dap.ext.autocompl').attach()]]}
}, 'Tab2')

utils.create_augroup({
  {'BufNewFile,BufReadPost', '*.md', 'set', 'filetype=markdown'},
  {'BufWritePre', '*',  [[%s/\s\+$//e]]},
  {'BufRead,BufNewFile', '*.mli', 'set', 'filetype=ocaml_interface'}
}, 'BufE')


-- OCAML
local home = os.getenv('HOME')

vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')
vim.api.nvim_set_var('merlin_python_version', 3)
utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')


-- RELOAD
cmd [[packadd vimball]]

local ok, _ = pcall(function() require('lsp_config') end)

if not ok then
  print("No LSP")
end

RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

R('plugins')
RELOADER = function()
    R('ppatault.treesitter')
    R('ppatault.telescope')
    R('ppatault.plenary')
    R('ppatault.kommentary')
    R('ppatault.nvim-compe')
    R('ppatault.statusline')
    R('mappings')
    R('globals')
end

RELOADER()

utils.map_lua('n', '<leader>rc', 'RELOADER()', {noremap = true})

cmd [[colorscheme gruvbox]]
cmd [[highlight LspDiagnosticsUnderline cterm=undercurl gui=undercurl]]
