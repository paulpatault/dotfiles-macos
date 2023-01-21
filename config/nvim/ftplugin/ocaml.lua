vim.keymap.set("n", "<localleader>af", "a assert false<esc>")
-- vim.keymap.set("n", "<leader>aft", "a assert false (* TODO *)<esc>")
vim.keymap.set("n", "<leader>d", [[i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i]])

vim.keymap.set("n", "s", function() vim.call("OCaml_switch", 0) end)
vim.keymap.set("i", "<c-a>", " assert false")

vim.keymap.set("n", "<localleader>f", function() vim.cmd("FloatermNew utop") end)
vim.keymap.set("n", "<localleader>i", [[:!ocaml %<cr>]])

--[[ vim.keymap.set("n", "ml", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":ML " .. filename)
end)

vim.keymap.set("n", "mli", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":MLI " .. filename)
end) ]]
