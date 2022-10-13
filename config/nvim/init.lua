require("ppatault")

if (vim.api.nvim_get_var("the_bg_is_dark") == 1) then
  vim.cmd("colorscheme gruvbox")
else
  vim.cmd("colorscheme materialbox")
end
