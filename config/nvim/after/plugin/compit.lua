local function compit()
  require('compit').run({ prompt = false })
end

local function compit_prompt()
  require('compit').run({})
end

vim.keymap.set("n", "<localleader>bb", compit_prompt, { desc = "[BB]uild with prompt" })
vim.keymap.set("n", "<localleader>b",  compit, { desc = "[B]uild" })
vim.keymap.set("n", "<leader>m", vim.cmd.make, { desc = "[M]ake" })
