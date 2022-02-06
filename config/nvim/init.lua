local home = os.getenv('HOME')
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

g.vimtex_compiler_progname = 'nvr'

vim.opt.guicursor = 'i:block'

b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false
b.spelllang = [[fr]]

o.backspace = [[indent,eol,start]]
o.hidden = true
w.winfixwidth = true

o.lazyredraw = true

o.splitbelow = true
o.splitright = true

w.cursorline = true
b.synmaxcol = 4000

w.list = false
w.lbr = true
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
local n_map_tbl = {
  ['<leader>sp']  = {'n', [[:setlocal spell!<cr>]], {noremap = true, silent = true}},
  ['<leader>sc']  = {'n', [[:luafile ~/.config/nvim/init.lua<cr>]], {noremap = true}},
  ['<leader>rt']  = {'n', [[:%s/\s\+$//e<cr>]], {noremap = true}},
  ['<A-Tab>']     = {'n', [[:tabnext<cr>]], {noremap = true}},
  ['<A-S-Tab>']   = {'n', [[:tabprev<cr>]], {noremap = true}},
  ['J']           = {'v', [[:m '>+1<cr>gv=gv]], {noremap = true}},
  ['K']           = {'v', [[:m '<-2<cr>gv=gv]], {noremap = true}},
}

for key, value in pairs(n_map_tbl) do
    utils.map(value[1], key, value[2], value[3])
end

utils.map_lua('n', '<leader>w', "utils.Wrap_toogle()", {noremap = true, silent = true})

local tabW_assoc = {
  ['c']               = '4',
  ['cpp']             = '4',
  ['markdown']        = '2',
  ['lua']             = '2',
  ['kawa']            = '2',
  ['ocaml']           = '2',
  ['ocaml_interface'] = '2',
  ['ocamllex']        = '2',
  ['menhir']          = '2',
  ['why3']            = '2'
}

local ft_assoc = {
  ['*.md']  = 'markdown',
  ['*.zsh'] = 'sh',
  ['*.mli'] = 'ocaml_interface',
  ['*.mly'] = 'menhir',
  ['*.mll'] = 'ocamllex',
  ['*.ll']  = 'llvm',
  ['*.mlw'] = 'why3',
}

local ftTable = {}
for key, value in pairs(ft_assoc) do
  table.insert(ftTable, {'BufRead,BufNewFile', key, 'set', 'filetype=' .. value})
end

local tabWtbl = {}
for key, value in pairs(tabW_assoc) do
  table.insert(tabWtbl, {'FileType', key, 'set', 'sw=' .. value})
end

utils.create_augroup(ftTable, 'BufE')
utils.create_augroup(tabWtbl, 'Tab2')

_G.setHighlights = function()
  cmd [[highlight LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl]]
  cmd [[highlight CmpItemAbbr guifg=#a89984]]
  cmd [[highlight CmpItemKind guifg=#fabd2f]]
  cmd [[highlight CmpItemMenu guifg=#83a598]]
  cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
end

utils.create_augroup({
  {"ColorScheme", "*", "call", "v:lua.setHighlights()"}
}, "UndercurlDiags")

-- OCAML / PYTHON
vim.api.nvim_set_var('python_host_prog', "/usr/bin/python")
vim.api.nvim_set_var('python3_host_prog', "/opt/homebrew/bin/python3")
vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')
vim.api.nvim_set_var('merlin_python_version', 3)
utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')
-- utils.add_rtp(home .. '/.opam/default/share/ocp-indent/vim')


-- RELOAD

require('plugins')
require('impatient')

local ok, res = pcall(function() require('lsp_config') end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

R('nvim-web-devicons').setup()
R('lspkind').init()
RELOADER = function()
  R('ppatault.nvim-cmp')
  R('ppatault.treesitter')
  R('ppatault.statusline')
  R('ppatault.plenary')
  R('ppatault.telescope')
  R('ppatault.ripple')
  R('ppatault.kommentary')
  R('ppatault.todo')
  R('mappings')
  R('globals')
end

RELOADER()

cmd [[colorscheme gruvbox]]

cmd [[set nohlsearch]]
