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

vim.opt.guicursor = "i:block"

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
utils.map('n', '<leader>sp', ':setlocal spell!<cr><cr>', {noremap = true, silent = true})

utils.map('n', '<leader>sc', ':luafile ~/.config/nvim/init.lua<cr>', {noremap = true})

utils.map('n', '<C-f>', ":!open . && open -a Finder<cr>", {noremap = true})

utils.map('v', 'J', [[:m '>+1<cr>gv=gv]], {noremap = true})
utils.map('v', 'K', [[:m '<-2<cr>gv=gv]], {noremap = true})

utils.map('n', '<leader>rt', [[:%s/\s\+$//e<cr>]], {noremap = true})

utils.map('n', '<A-Tab>', ':tabnext<cr>', {noremap = true})
utils.map('n', '<A-S-Tab>', ':tabprev<cr>', {noremap = true})

-- utils.map('n', '<Up>',    [[:echoerr "[ Interdit ]"<cr>]], {noremap = true})
-- utils.map('n', '<Down>',  [[:echoerr "[ Interdit ]"<cr>]], {noremap = true})
-- utils.map('n', '<Left>',  [[:echoerr "[ Interdit ]"<cr>]], {noremap = true})
-- utils.map('n', '<Right>', [[:echoerr "[ Interdit ]"<cr>]], {noremap = true})

utils.create_augroup({
  {'FileType', '*', 'setlocal', 'shiftwidth=4'},
  {'FileType',
    'ocaml,ocaml_interface,ocamllex,menhir,lua,markdown,why3,ept,lustre',
    'setlocal', 'shiftwidth=2'},
}, 'Tab2')

utils.create_augroup({
  {'BufNewFile,BufReadPost', '*.md', 'set', 'filetype=markdown'},
  {'BufRead,BufNewFile', '*.mli', 'set', 'filetype=ocaml_interface'},
  {'BufRead,BufNewFile', '*.mll', 'set', 'filetype=ocamllex'},
  {'BufRead,BufNewFile', '*.mly', 'set', 'filetype=menhir'},
  {'BufRead,BufNewFile', '*.mlw', 'set', 'filetype=why3'},
  {'BufRead,BufNewFile', '*.lus,*.ept', 'set', 'filetype=lustre'},
  {'BufRead,BufNewFile', '*.imp', 'set', 'filetype=imp'},
  {'BufRead,BufNewFile', '*.vips,*.vipsopt,*.gips,*.gipsopt', 'set', 'filetype=asm'},
  {'BufRead,BufNewFile', '*.rml', 'set', 'filetype=rml'},
}, 'BufE')

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
vim.api.nvim_set_var('python_host_prog', home .. "/opt/miniconda3/bin/python")
vim.api.nvim_set_var('python3_host_prog', home .. "/opt/miniconda3/bin/python3")
vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')
vim.api.nvim_set_var('merlin_python_version', 3)
utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')

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

utils.map_lua('n', '<leader>rc', 'RELOADER()', {noremap = true})

cmd [[colorscheme gruvbox]]

cmd [[set nohlsearch]]
