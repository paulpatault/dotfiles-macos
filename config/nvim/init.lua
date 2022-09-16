---------------------------------------------------------------------------------------------------

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



---------------------------------------------------------------------------------------------------

local utils = require("utils")

utils.create_augroup({
  {"BufRead,BufNewFile", "*.zsh", "set", "filetype=sh"},
  {"BufRead,BufNewFile", "*.mlw", "set", "filetype=why3"},
  {"BufRead,BufNewFile", "*.mp",  "set", "filetype=patmat"},
  {"BufRead,BufNewFile", "*.lus", "set", "filetype=lustre"},
  {"BufRead,BufNewFile", "*.ept", "set", "filetype=lustre"},
}, "Buf_augrp")

utils.create_augroup({
  {"FileType", "c,tex,cpp", "set", "sw=4"},
  {"FileType", "markdown,lua,kawa,ocaml,why3,lustre", "set", "sw=2"},
  {"FileType", "tex", "setlocal", "spell"},
}, "Ft_augrp")

utils.create_augroup({
  {"FileType", "tex", "set", "makeprg=pdflatex\\ -shell-escape\\ %"},
  {"FileType", "ocaml", "set", "makeprg=dune\\ build"},
  {"FileType", "rust", "set", "makeprg=cargo\\ build"},
}, "Ft_makeprg")

---------------------------------------------------------------------------------------------------

local _ = require("hidiag")
local _ = require("ocaml")
local _ = require("rust-tools").setup({})
local _ = require("plugins")
local _ = require("impatient")

local ok, res = pcall(function() require("lsp_config") end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require("plenary.reload").reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

R("nvim-web-devicons").setup()
R("lspkind").init()
RELOADER = function()
  R("ppatault.nvim-cmp")
  -- R("ppatault.treesitter")
  R("ppatault.statusline")
  R("ppatault.plenary")
  R("ppatault.telescope")
  R("ppatault.ripple")
  R("ppatault.kommentary")
  R("mappings")
  R("globals")
end

RELOADER()

---------------------------------------------------------------------------------------------------

vim.cmd [[ colorscheme gruvbox ]]
