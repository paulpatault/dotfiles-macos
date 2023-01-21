
vim.keymap.set("n", "<localleader>cc", function()
  require('compit').run({})
end)

-- to disable the prompt
-- require('compit').run({ prompt = false })
