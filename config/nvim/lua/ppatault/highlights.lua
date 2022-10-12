local cmd = vim.cmd
local utils = require("ppatault.utils")

_G.setHighlights = function()
  cmd("highlight LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl")
  cmd("highlight LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl")
  cmd("highlight LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl")
  cmd("highlight LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl")

  cmd("highlight CmpItemAbbr guifg=#a89984")
  cmd("highlight CmpItemKind guifg=#fabd2f")
  cmd("highlight CmpItemMenu guifg=#83a598")

  cmd("highlight CoqtailSent guibg=" .. vim.api.nvim_get_var("coq_sent_color"))
  cmd("highlight CoqtailChecked guibg=" .. vim.api.nvim_get_var("coq_check_color"))

  cmd("highlight Normal guibg=NONE ctermbg=NONE")
end

utils.create_augroup({
  {"ColorScheme", "*", "call", "v:lua.setHighlights()"}
}, "UndercurlDiags")
