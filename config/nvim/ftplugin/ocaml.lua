local nnoremap = require("ppatault.keymap").nnoremap
local inoremap = require("ppatault.keymap").inoremap

nnoremap("<localleader>af", "a assert false<esc>")
-- nnoremap("<leader>aft", "a assert false (* TODO *)<esc>")
nnoremap("<leader>d", [[i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i]])

nnoremap("s", function() vim.call("OCaml_switch", 0) end)
inoremap("<c-a>", " assert false")

nnoremap("<leader>f", function() vim.cmd("FloatermNew utop") end)

--[[ nnoremap("ml", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":ML " .. filename)
end)

nnoremap("mli", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":MLI " .. filename)
end) ]]
