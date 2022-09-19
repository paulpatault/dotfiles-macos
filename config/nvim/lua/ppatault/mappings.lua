local keymap = require("ppatault.keymap")
local nnoremap = keymap.nnoremap
local vnoremap = keymap.vnoremap
local tnoremap = keymap.tnoremap


nnoremap("<leader>te", ":Telescope<cr>")
nnoremap("<leader>p",  function() require('telescope.builtin').find_files() end)
nnoremap("<leader>b",  function() require('telescope.builtin').buffers() end)
nnoremap("<leader>ds", function() require('telescope.builtin').lsp_document_symbols() end)
nnoremap("<leader>dg", function() require('telescope.builtin').diagnostics() end)
nnoremap("<leader>ca", function() require('telescope.builtin').lsp_code_actions() end)
nnoremap("<leader>gf", function() require('telescope.builtin').git_files() end)
nnoremap("<leader>rg", function() require('telescope.builtin').live_grep() end)
nnoremap("<leader>fb", function() require('telescope').extensions.file_browser.file_browser() end)
-- 'n', 'gd']     ,   = "require('telescope.builtin').lsp_definitions()",
-- 'n', 'gd']     ,   = "require('telescope.builtin').lsp_implementations()",

nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
nnoremap("grf", function() vim.lsp.buf.references() end)
nnoremap("gd", function() vim.lsp.buf.definition() end)
nnoremap("gD", function() vim.lsp.buf.implementation() end)
nnoremap("dc", function() vim.lsp.buf.hover() end)
nnoremap("ds", function() vim.lsp.buf.signature_help() end)
nnoremap("gT", function() vim.lsp.buf.type_definition() end)
nnoremap("dl", function() vim.diagnostic.open_float() end)
nnoremap("dn", function() vim.diagnostic.goto_next() end)
nnoremap("dN", function() vim.diagnostic.goto_prev() end)
nnoremap("do", function() vim.diagnostic.enable() end)
nnoremap("df", function() vim.diagnostic.disable() end)


tnoremap('<esc>', '<c-\\><c-n>')


vnoremap("<leader>c", "<Plug>kommentary_visual_default")
nnoremap("<leader>c", "<Plug>kommentary_line_default")


nnoremap("<leader>tg", ":FloatermNew lazygit<cr>")
nnoremap("<leader>tr", ":TroubleToggle<cr>")
nnoremap("tc", ":VimtexCompile<cr>")


nnoremap("ff", ":Neoformat<cr>")
vnoremap("ff", ":Neoformat<cr>")


nnoremap("<leader>sp", ":setlocal spell!<cr>")
nnoremap("<leader>m",  ":make<cr>")
nnoremap("<leader>sc", ":luafile ~/.config/nvim/init.lua<cr>")
nnoremap("<leader>rt", [[:%s/\s\+$//e<cr>]])


nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")


nnoremap("<A-Tab>",   ":tabnext<cr>")
nnoremap("<A-S-Tab>", ":tabprev<cr>")


vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")


nnoremap('<esc><esc>',  ":noh<cr>")


vnoremap("<Tab>",   ">gv")
vnoremap("<S-Tab>", "<gv")

--[[ local gospel = false
function Toogle_gospel()
  gospel = not gospel
  if gospel then
    vim.opt.makeprg = "gospel check %"
    print "gospel [on]"
  else
    -- vim.opt.makeprg = "dune build"
    vim.cmd ":e"
    print "gospel [off]"
  end
end

utils.map_lua('n', '<C-g>',  "Toogle_gospel()", options) ]]

nnoremap("<leader>i", "i~$$<esc>i")
nnoremap("<leader>w", "utils.Wrap_toogle()")

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

nnoremap("pr", "Toogle_nu()")
