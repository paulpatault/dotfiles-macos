---------------------------------------------------------------------------------------------------

local g = vim.g
g.mapleader = ' '
g.langmenu = "en_US.UTF-8"

---------------------------------------------------------------------------------------------------

local w = vim.wo
w.cursorline = true
w.winfixwidth = true
w.lbr = true
w.number = true
w.relativenumber = true
w.list = true
w.colorcolumn = [[100]]
w.wrap = false
w.list = false

---------------------------------------------------------------------------------------------------

local opt = vim.opt
opt.guicursor = 'i:block'
opt.termguicolors = true
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

---------------------------------------------------------------------------------------------------

local o = vim.o
o.completeopt = "menuone,noinsert,noselect"
if vim.fn.has("multi_byte") == 1 and o.encoding == "utf-8" then
  o.listchars = "tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:…"
else
  o.listchars = "tab:> ,extends:>,precedes:<,nbsp:.,trail:_]"
end

---------------------------------------------------------------------------------------------------

local utils = require("utils")

utils.create_augroup({
  {"BufRead,BufNewFile", "*.zsh", "set", "filetype=sh"},
  {"BufRead,BufNewFile", "*.mlw", "set", "filetype=why3"},
  {"BufRead,BufNewFile", "*.mp",  "set", "filetype=patmat"},
}, "Buf_augrp")

utils.create_augroup({
  {"FileType", "c,tex,cpp", "set", "sw=4"},
  {"FileType", "markdown,lua,kawa,ocaml,why3", "set", "sw=2"},
  {"FileType", "tex", "setlocal", "spell"},
}, "Ft_augrp")

---------------------------------------------------------------------------------------------------

local _ = require("hidiag")
local _ = require("ocaml")
local _ = require("plugs")

vim.cmd [[colorscheme gruvbox]]
