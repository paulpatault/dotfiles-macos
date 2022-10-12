require("ppatault.bg")

local v = "dark"
if (vim.api.nvim_get_var("the_bg_is_dark") == 1) then
  v = "dark"
  vim.api.nvim_set_var("coq_sent_color", "#574300")
  vim.api.nvim_set_var("coq_check_color", "#34463e")
else
  v = "light"
  vim.api.nvim_set_var("coq_sent_color", "#574300")
  vim.api.nvim_set_var("coq_check_color", "#34463e")
end

vim.opt.background = v
