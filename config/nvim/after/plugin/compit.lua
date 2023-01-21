local function compit()
  require('compit').run({ prompt = false })
end

local function compit_prompt()
  require('compit').run({})
end

vim.keymap.set("n", "<localleader>bb", compit_prompt)
vim.keymap.set("n", "<localleader>b",  compit)
vim.keymap.set("n", "<leader>m", vim.cmd.make)
