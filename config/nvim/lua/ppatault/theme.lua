
vim.g.gruvbox_contrast_dark = "medium"
vim.g.materialbox_contrast_light = "hard"
vim.g.materialbox_invert_selection = false
vim.g.gruvbox_invert_selection = false


local cs = os.getenv("COLORSCHEME")

if cs ~= nil then
  vim.cmd.colorscheme(cs)
else
  vim.cmd.colorscheme("gruvbox")
end

if os.getenv("THEME") == "dark" then
  vim.opt.background = "dark"
  vim.api.nvim_set_var("coq_sent_color", "#574300")
  vim.api.nvim_set_var("coq_check_color", "#30423c")
else
  vim.opt.background = "light"
  vim.api.nvim_set_var("coq_sent_color", "#fff6c0")
  vim.api.nvim_set_var("coq_check_color", "#bcffbe")
  vim.cmd.colorscheme("github")
end
