local utils = require("utils")

local options = {
  noremap = true,
  silent = true
}

local function nnoremap(key, map)
  utils.map("n", key, map, options)
end

local function nnoremap_lua(key, map)
  utils.map_lua("n", key, map, options)
end

local function vnoremap(key, map)
  utils.map("v", key, map, options)
end

-- {{{ telescope
nnoremap("<leader>te", ":Telescope<cr>")
nnoremap_lua("<leader>p",  "require('telescope.builtin').find_files()")
nnoremap_lua("<leader>b",  "require('telescope.builtin').buffers()")
nnoremap_lua("<leader>ds", "require('telescope.builtin').lsp_document_symbols()")
nnoremap_lua("<leader>dg", "require('telescope.builtin').diagnostics()")
nnoremap_lua("<leader>ca", "require('telescope.builtin').lsp_code_actions()")
nnoremap_lua("<leader>gf", "require('telescope.builtin').git_files()")
nnoremap_lua("<leader>rg", "require('telescope.builtin').live_grep()")
nnoremap_lua("<leader>fb", "require('telescope').extensions.file_browser.file_browser()")
-- 'n', 'gd']     ,   = "require('telescope.builtin').lsp_definitions()",
-- 'n', 'gd']     ,   = "require('telescope.builtin').lsp_implementations()",
-- }}}

-- {{{ lsp
nnoremap_lua("<leader>rn", "vim.lsp.buf.rename()")
nnoremap_lua("grf", "vim.lsp.buf.references()")
nnoremap_lua("gd",  "vim.lsp.buf.definition()")
nnoremap_lua("gD",  "vim.lsp.buf.implementation()")
nnoremap_lua("dc",  "vim.lsp.buf.hover()")
nnoremap_lua("ds",  "vim.lsp.buf.signature_help()")
nnoremap_lua("gT",  "vim.lsp.buf.type_definition()")
nnoremap_lua("dl",  "vim.diagnostic.open_float()")
nnoremap_lua("dn",  "vim.diagnostic.goto_next()")
nnoremap_lua("dN",  "vim.diagnostic.goto_prev()")
nnoremap_lua("do",  "vim.diagnostic.enable()")
nnoremap_lua("df",  "vim.diagnostic.disable()")
-- }}}

utils.map('t', '<esc>', '<c-\\><c-n>', options)

vnoremap("<leader>c", "<Plug>kommentary_visual_default")
nnoremap("<leader>c", "<Plug>kommentary_line_default")

nnoremap('<leader>tg', ':FloatermNew lazygit<cr>')
nnoremap('<leader>tr', ':TroubleToggle<cr>')
nnoremap('tc', ':VimtexCompile<cr>')
-- }}}

-- {{{ format
nnoremap("ff", ":Neoformat<cr>")
vnoremap("ff", ":Neoformat<cr>")
-- }}}
--

-- {{ general
nnoremap("<leader>sp", ":setlocal spell!<cr>")
nnoremap("<leader>m",  ":make<cr>")
nnoremap("<leader>sc", ":luafile ~/.config/nvim/init.lua<cr>")
nnoremap("<leader>rt", [[:%s/\s\+$//e<cr>]])
nnoremap("<A-Tab>",    ":tabnext<cr>")
nnoremap("<A-S-Tab>",  ":tabprev<cr>")

vnoremap("J", ":m '>+1<cr>gv=gv")
vnoremap("K", ":m '<-2<cr>gv=gv")

-- nnoremap("<C-p>", "\"_dP")


nnoremap('<esc><esc>',  ":noh<cr>")

vnoremap('<Tab>',   ">gv")
vnoremap('<S-Tab>', "<gv")

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
nnoremap_lua('<leader>w', "utils.Wrap_toogle()")

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

nnoremap_lua("pr", "Toogle_nu()")
-- }}
