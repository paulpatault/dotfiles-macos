-- note : Fy = C-Fx | y = x + 24
--[[ vim.g.floaterm_keymap_new = "<F6>"
vim.g.floaterm_keymap_prev = "<F7>"
vim.g.floaterm_keymap_next = "<F8>"
vim.g.floaterm_keymap_toggle = "<F5>"
vim.g.floaterm_keymap_kill = "<F10>" ]]

vim.g.markdown_fenced_languages = {
  "plsql", "sql", "python", "lua", "html", "php", "c", "cpp", "ocaml", "asm"
}

vim.g.vimtex_compiler_progname = "nvr"
vim.g.tex_flavor = "latex"
vim.g.vimtex_compiler_latexmk = {
  -- executable = "lualatex",
  build_dir  = "_build",
  options = {
    "-pdf",
    -- "-lualatex",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode"
  }
}

vim.g.jupytext_fmt = "py"
vim.g.jupytext_style = "hydrogen"

-- vim.g.ripple_winpos = "split" -- or vertical

vim.g.coqtail_noimap = true
