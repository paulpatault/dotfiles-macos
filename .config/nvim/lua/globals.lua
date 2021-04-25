local cmd = vim.cmd

-- {{ Floaterm
-- note : Fy = C-Fx | y = x + 24
vim.g.floaterm_keymap_new = '<F33>'
vim.g.floaterm_keymap_prev = '<F34>'
vim.g.floaterm_keymap_next = '<F35>'
vim.g.floaterm_keymap_toggle = '<F36>'
-- }}


vim.g.markdown_fenced_languages = {
  'plsql', 'sql', 'python', 'lua', 'html', 'php', 'c', 'cpp'
}


-- {{ Vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_latexmk = {
  options = {
    '-pdf',
    '-shell-escape',
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode'
  }
}
-- }}



-- {{ LSP
-- cmd [[ sign_define("LspDiagnosticsErrorSign", {"text" : "E", "texthl" : "LspDiagnosticsError"}) ]]
-- cmd [[ sign_define("LspDiagnosticsWarningSign", {"text" : "W", "texthl" : "LspDiagnosticsWarning"}) ]]
-- cmd [[ sign_define("LspDiagnosticInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"}) ]]
-- cmd [[ sign_define("LspDiagnosticHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"}) ]]
-- }}
