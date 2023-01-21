
vim.keymap.set("n", "<leader>ff", function() vim.cmd("Neoformat")() end)
--vim.keymap.set("n", "<leader>sp", function() vim.cmd.setlocal("spell!")() end)
vim.keymap.set("n", "<leader>sc", function() vim.cmd.luafile("~/.config/nvim/init.lua")() end)
vim.keymap.set("n", "<leader>m",  function() vim.cmd.make() end)

vim.keymap.set("n", "<leader>pv",vim.cmd.Ex)

vim.keymap.set("t", "<esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<leader>vec", function()
  vim.cmd("tabnew")
  vim.cmd.tcd("~/.config/nvim/")
  vim.cmd.e("~/.config/nvim/init.lua")
end)

vim.keymap.set("n", "<leader>rt", [[:%s/\s\+$//e<cr>]])

vim.keymap.set("v", "<C-d>", "<C-d>zz")
vim.keymap.set("v", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "(", "(zz")
vim.keymap.set("v", ")", ")zz")
vim.keymap.set("v", "{", "{zz")
vim.keymap.set("v", "}", "}zz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "(", "(zz")
vim.keymap.set("n", ")", ")zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<A-Tab>",   vim.cmd.tabnext)
vim.keymap.set("n", "<A-S-Tab>", vim.cmd.tabprev)

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- vim.keymap.set("n", "P", "\"_dP")

vim.keymap.set("n", "<esc><esc>", vim.cmd.nohlsearch)

vim.keymap.set("n", "<right>", "xp")
vim.keymap.set("n", "<left>", "xhhp")

vim.keymap.set("v", "<Tab>",   ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

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

local function wrap_toogle ()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        vim.keymap.set("n", "j", "gj")
        vim.keymap.set("n", "k", "gk")
        vim.keymap.set("n", "0", "g0")
        vim.keymap.set("n", "$", "g$")
        vim.keymap.set("v", "j", "gj")
        vim.keymap.set("v", "k", "gk")
        vim.keymap.set("v", "0", "g0")
        vim.keymap.set("v", "$", "g$")
        vim.cmd.let("&showbreak='❯❯❯ '")
        vim.cmd.set("cpoptions+=n")
    else
        vim.keymap.del("n", "j")
        vim.keymap.del("n", "k")
        vim.keymap.del("n", "0")
        vim.keymap.del("n", "$")
        vim.keymap.del("v", "j")
        vim.keymap.del("v", "k")
        vim.keymap.del("v", "0")
        vim.keymap.del("v", "$")
        vim.cmd.set("showbreak=")
        vim.cmd.set("cpoptions-=n")
    end
end

vim.keymap.set("n", "<leader>w", wrap_toogle)
