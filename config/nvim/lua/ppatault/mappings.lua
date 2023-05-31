
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "file browser" })

vim.keymap.set("n", "<leader>bc", "f,a<cr><esc>", { desc = "[B]reak on [C]omma" })
vim.keymap.set("n", "<leader>bs", "f;a<cr><esc>", { desc = "[B]reak on [S]emicolon" })

vim.keymap.set("n", "<leader>sc", function() vim.cmd.source("~/.config/nvim/init.lua") end, { desc = "[S]ource + [C]onfig" })

-- vim.keymap.set("n", "<leader>io", "ebb%beve%eeeebdbb*vepNbv%ed", { desc = "inline ocaml" })

-- vim.keymap.set("n", "<leader>sp", function() vim.cmd.setlocal("spell!")() end)
-- vim.keymap.set("n", "<leader>m",  function() vim.cmd.make() end)

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "[esc] from terminal"})

vim.keymap.set("n", "<leader>vec", function()
  vim.cmd("tabnew")
  local path = vim.fn.stdpath("config")
  vim.cmd.tcd(path)
  vim.cmd.e(path .. "/init.lua")
end, { desc = "[V]im [E]dit [C]onfig" })

vim.keymap.set("n", "<leader>rt", [[:%s/\s\+$//e<cr>]], { desc = "[R]emove + [T]railling" })

vim.keymap.set("v", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("v", "(", "(zz", { desc = "" })
vim.keymap.set("v", ")", ")zz", { desc = "" })
vim.keymap.set("v", "{", "{zz", { desc = "" })
vim.keymap.set("v", "}", "}zz", { desc = "" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("n", "(", "(zz", { desc = "" })
vim.keymap.set("n", ")", ")zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz", { desc = "" })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "" })

vim.keymap.set("n", "<f7>", "<cmd>cnext<CR>zz", { desc = "" })
vim.keymap.set("n", "<f8>", "<cmd>cprev<CR>zz", { desc = "" })

vim.keymap.set("n", "n", "nzz", { desc = "" })
vim.keymap.set("n", "N", "Nzz", { desc = "" })

vim.keymap.set("i", "jj", "<esc>", { desc = "" })
vim.keymap.set("i", "jk", "<esc>", { desc = "" })

vim.keymap.set("n", "<A-Tab>",   vim.cmd.tabnext, { desc = "" })
vim.keymap.set("n", "<A-S-Tab>", vim.cmd.tabprev, { desc = "" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "" })

-- vim.keymap.set("n", "P", "\"_dP", { desc = "" })

vim.keymap.set("n", "²", [["_]], { desc = "" })

vim.keymap.set("n", "<esc><esc>", vim.cmd.nohlsearch, { desc = "[esc] hlsearch" })

vim.keymap.set("n", "<right>", "xp", { desc = "move char [right]" })
vim.keymap.set("n", "<left>", "xhhp", { desc = "move char [left]" })

vim.keymap.set("v", "<Tab>",   ">gv", { desc = "indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "unindent" })

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
        vim.keymap.set("n", "j", "gj", { desc = "auto" })
        vim.keymap.set("n", "k", "gk", { desc = "auto" })
        vim.keymap.set("n", "0", "g0", { desc = "auto" })
        vim.keymap.set("n", "$", "g$", { desc = "auto" })
        vim.keymap.set("v", "j", "gj", { desc = "auto" })
        vim.keymap.set("v", "k", "gk", { desc = "auto" })
        vim.keymap.set("v", "0", "g0", { desc = "auto" })
        vim.keymap.set("v", "$", "g$", { desc = "auto" })
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

vim.keymap.set("n", "<leader>w", wrap_toogle, { desc = "[W]rap toogle" })
