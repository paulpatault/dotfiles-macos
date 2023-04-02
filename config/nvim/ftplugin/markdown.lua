vim.keymap.set("v", "q", "<Plug>(sandwich-add)`", { desc = "quote visual selection" })
vim.keymap.set("n", "qiw", "viw<Plug>(sandwich-add)`", { desc = "quote inner word" })

--[[ vim.keymap.set("v", "<localleader>b", "<Plug>(sandwich-add)*<Plug>(sandwich-add)*<cr>")
vim.keymap.set("v", "<localleader>i", "<Plug>(sandwich-add)*<cr>") ]]

