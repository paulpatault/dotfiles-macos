---------------------------------------------------------------------------------------------------

local g = vim.g
g.mapleader = ' '
g.langmenu = "en_US.UTF-8"

---------------------------------------------------------------------------------------------------

local b = vim.bo
b.autoindent = true
b.expandtab = true
b.softtabstop = 4
b.shiftwidth = 4
b.tabstop = 4
b.smartindent = true
b.modeline = false
b.spelllang = [[fr]]
b.undofile = true
b.synmaxcol = 4000

---------------------------------------------------------------------------------------------------

local w = vim.wo
w.cursorline = true
w.winfixwidth = true
w.list = false
w.lbr = true
w.number = true
w.relativenumber = true
w.list = true
w.colorcolumn = [[100]]
w.wrap = false

---------------------------------------------------------------------------------------------------

local vo = vim.opt
vo.guicursor = 'i:block'
vo.termguicolors = true

---------------------------------------------------------------------------------------------------

local o = vim.o
o.background = "dark"
o.backspace = [[indent,eol,start]]
o.hidden = true
o.lazyredraw = true
o.splitbelow = true
o.splitright = true
o.encoding = 'utf-8'
o.termguicolors = true
o.clipboard = "unnamed,unnamedplus"
o.scrolloff = 8
o.timeoutlen = 300
o.mouse = 'a'
o.completeopt = "menuone,noinsert,noselect"
if vim.fn.has('multi_byte') == 1 and o.encoding == 'utf-8' then
  o.listchars = [[tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…]]
else
  o.listchars = [[tab:> ,extends:>,precedes:<,nbsp:.,trail:_]]
end

---------------------------------------------------------------------------------------------------
