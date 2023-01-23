local undergrp = vim.api.nvim_create_augroup("UndercurlDiags", {clear = true})

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    group = undergrp,
    pattern = { "*" },
    callback = function()
      vim.cmd("hi! DiagnosticUnderlineError       cterm=undercurl gui=undercurl")
      vim.cmd("hi! DiagnosticUnderlineHint        cterm=undercurl gui=undercurl")
      vim.cmd("hi! DiagnosticUnderlineInformation cterm=undercurl gui=undercurl")
      vim.cmd("hi! DiagnosticUnderlineWarning     cterm=undercurl gui=undercurl")

      vim.cmd.highlight("CmpItemAbbr guifg=#a89984")
      vim.cmd.highlight("CmpItemKind guifg=#fabd2f")
      vim.cmd.highlight("CmpItemMenu guifg=#83a598")

      vim.cmd.highlight("CoqtailSent guibg=" .. vim.api.nvim_get_var("coq_sent_color"))
      vim.cmd.highlight("CoqtailChecked guibg=" .. vim.api.nvim_get_var("coq_check_color"))

      vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")

      --[[ if vim.bo.filetype == "ocaml" then
        vim.cmd("hi! link Keyword GruvboxRedBold")
      end

      if vim.bo.filetype == "coq" then
        vim.cmd("hi! link Keyword GruvboxRedBold")
        vim.cmd("hi! link PreProc GruvboxAquaBold")
        vim.cmd("hi! link Type    GruvboxYellowBold")
        vim.cmd("hi! link Underlined UnderlinedBold")
      end ]]

    end
  }
)

vim.api.nvim_create_autocmd(
  "BufRead,BufNewFile",
  {
    group = undergrp,
    pattern = { "*.v" },
    callback = function()
        vim.cmd("hi! link Keyword GruvboxRedBold")
        vim.cmd("hi! link PreProc GruvboxAquaBold")
        vim.cmd("hi! link Type    GruvboxYellowBold")
        vim.cmd("hi! link Underlined UnderlinedBold")
    end
  })

vim.api.nvim_create_autocmd(
  "BufRead,BufNewFile",
  {
    group = undergrp,
    pattern = { "*.ml" },
    callback = function()
        vim.cmd("hi! link Keyword GruvboxRedBold")
    end
  }
)

