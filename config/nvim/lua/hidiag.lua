local cmd = vim.cmd

_G.setHighlights = function()
  cmd [[highlight LspDiagnosticsUnderlineError cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineHint cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineInformation cterm=undercurl gui=undercurl]]
  cmd [[highlight LspDiagnosticsUnderlineWarning cterm=undercurl gui=undercurl]]
  cmd [[highlight CmpItemAbbr guifg=#a89984]]
  cmd [[highlight CmpItemKind guifg=#fabd2f]]
  cmd [[highlight CmpItemMenu guifg=#83a598]]
  cmd [[highlight Normal guibg=NONE ctermbg=NONE]]

end

utils.create_augroup({
  {"ColorScheme", "*", "call", "v:lua.setHighlights()"}
}, "UndercurlDiags")

utils.create_augroup({
  {"ColorScheme", "*", "hi def", "CoqtailSent",   "guibg=#a77e1f"},
  {"ColorScheme", "*", "hi def", "CoqtailChecked","guibg=#5b5d13"},
}, "CoqtailHighlights")
