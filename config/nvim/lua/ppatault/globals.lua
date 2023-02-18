vim.g.markdown_fenced_languages = {
  "plsql", "sql", "python", "lua", "html", "php", "c", "cpp", "ocaml", "asm"
}

vim.g.coqtail_noimap = true
vim.g.coqtail_map_prefix = "<localleader>c"

vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"}
vim.g.qs_max_chars=80
vim.g.qs_buftype_blacklist = {"terminal", "nofile"}

-- vim.g.ripple_winpos = "split" -- or vertical

--[[ vim.api.nvim_set_hl(0, "Normal", {bg="none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg="none"}) ]]
