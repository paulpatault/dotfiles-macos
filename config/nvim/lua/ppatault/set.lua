local g = vim.g
g.mapleader = " "
g.langmenu = "en_US.UTF-8"
g.completeopt = "menuone,noinsert,noselect"
g.highlightedyank_highlight_duration = 100

---------------------------------------------------------------------------------------------------

local w = vim.wo
w.cursorline = true
w.winfixwidth = true
w.lbr = true
w.number = true
w.relativenumber = true
w.list = true
w.colorcolumn = "100"
w.wrap = false
w.list = false

---------------------------------------------------------------------------------------------------

local opt = vim.opt
opt.guicursor = "i:block"
opt.autoindent = true
opt.modeline = false
opt.undofile = true
opt.synmaxcol = 4000
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.background = "dark"
opt.backspace = "indent,eol,start"
opt.hidden = true
opt.lazyredraw = true
opt.splitbelow = true
opt.splitright = true
opt.encoding = "utf-8"
opt.spelllang = "fr"
opt.termguicolors = true
opt.clipboard = "unnamed,unnamedplus"
opt.scrolloff = 8
opt.timeoutlen = 300
opt.mouse = "a"
opt.list = true
opt.ignorecase = true
opt.smartcase = true
opt.listchars = {tab = '▸ ', trail = '·', extends='❯',precedes='❮',nbsp='±'}
