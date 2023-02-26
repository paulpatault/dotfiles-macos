vim.g['vimtex_log_ignore'] = ({
  'Underfull',
  'Overfull',
  -- 'specifier changed to',
  -- 'Token not allowed in a PDF string',
})

vim.g.tex_flavor = "latex"
vim.g['vimtex_view_method'] = "skim"
vim.g['vimtex_compiler_method'] = "latexmk"
vim.g['vimtex_compiler_latexmk'] = {
  -- executable = "lualatex",
  build_dir  = "_build",
  -- build_dir  = 1,
  options = {
    -- "-pdf",
    -- "-lualatex",
    -- "-output-directory=_build",
    "-shell-escape",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode"
  }
}

