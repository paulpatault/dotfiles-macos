vim.keymap.set("n", "s", vim.cmd("CoqNext")
vim.keymap.set("n", "S", vim.cmd("CoqUndo")

vim.keymap.set("n", "<down>",  "<Plug>CoqNext")
vim.keymap.set("n", "<up>",    "<Plug>CoqUndo")
vim.keymap.set("n", "<right>", "<Plug>CoqToLine")
-- vim.keymap.set("n", "<left>",  "<Plug>CoqToTop")
