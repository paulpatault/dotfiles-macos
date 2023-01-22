_G.setHighlights = function()
  vim.cmd.highlight("LspDiagnosticsUnderlineError cterm=undercurl guifg=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineHint  cterm=undercurl gui=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl")

  vim.cmd.highlight("CmpItemAbbr guifg=#a89984")
  vim.cmd.highlight("CmpItemKind guifg=#fabd2f")
  vim.cmd.highlight("CmpItemMenu guifg=#83a598")

  vim.cmd.highlight("CoqtailSent guibg=" .. vim.api.nvim_get_var("coq_sent_color"))
  vim.cmd.highlight("CoqtailChecked guibg=" .. vim.api.nvim_get_var("coq_check_color"))

  vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
end

local undergrp = vim.api.nvim_create_augroup("UndercurlDiags", {clear = true})

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    group = undergrp,
    pattern = { "*" },
    command = "call v:lua.setHighlights()"
  }
)
