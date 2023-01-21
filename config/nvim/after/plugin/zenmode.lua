vim.api.nvim_set_var("pres", false)

vim.keymap.set("n", "<leader>pr", function()
  local pres = vim.api.nvim_get_var("pres")
  vim.api.nvim_set_var("pres", not pres)
  require("zen-mode").toggle()
  if pres then
    vim.wo.number = true
    vim.wo.relativenumber = true
  else
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
end)

require("zen-mode").setup {
    window = {
        width = 90,
        options = {
            number = true,
            relativenumber = true,
        }
    },
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
end)
