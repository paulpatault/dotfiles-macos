vim.keymap.set("n", "<leader>ff", function() vim.cmd("Neoformat")() end, { desc = "[F]ile + [F]ormat" })
