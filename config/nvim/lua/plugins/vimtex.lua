return {
  "lervag/vimtex",

  config = function()

    vim.g["vimtex_log_ignore"] = ({
      ".*Underfull.*",
      ".*Overfull.*"
    }) -- FIX


    -- vim.g.tex_flavor = "latex"
    vim.g["vimtex_view_method"] = "skim"
    -- vim.cmd [[ let g:vimtex_view_method = 'preview']]
    vim.cmd [[ let g:vimtex_view_skim_sync = 1]]

    vim.g["vimtex_compiler_method"] = "latexmk"


    vim.g['vimtex_compiler_latexmk'] = {
      -- executable = "lualatex",
      engine = "lualatex",
      options = {
        -- "-pdf",
        -- "-lualatex",
        [[-output-directory="_build"]],
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode"
      }
    }
  end
}
