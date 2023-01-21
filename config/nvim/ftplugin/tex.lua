vim.keymap.set("v", "<localleader>b", "<Plug>(sandwich-add)ctextbf<cr>")
vim.keymap.set("v", "<localleader>i", "<Plug>(sandwich-add)ctextit<cr>")
vim.keymap.set("v", "<localleader>t", "<Plug>(sandwich-add)ctexttt<cr>")
vim.keymap.set("n", "<leader>i", "i~$$<esc>i")
vim.keymap.set("n", "<localleader>tc", vim.cmd("VimtexCompile"))

vim.g.tex_flavor = "latex"
vim.g.vimtex_view_method = "skim"
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
