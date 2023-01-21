local utils = require("ppatault.utils")

_G.setHighlights = function()
  vim.cmd.highlight("LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl")
  vim.cmd.highlight("LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl")

  vim.cmd.highlight("CmpItemAbbr guifg=#a89984")
  vim.cmd.highlight("CmpItemKind guifg=#fabd2f")
  vim.cmd.highlight("CmpItemMenu guifg=#83a598")

  vim.cmd.highlight("CoqtailSent guibg=" .. vim.api.nvim_get_var("coq_sent_color"))
  vim.cmd.highlight("CoqtailChecked guibg=" .. vim.api.nvim_get_var("coq_check_color"))

  vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
end

utils.create_augroup({
  {"ColorScheme", "*", "call", "v:lua.setHighlights()"}
}, "UndercurlDiags")
