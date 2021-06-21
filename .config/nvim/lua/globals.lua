local g = vim.g

-- {{ Floaterm
-- note : Fy = C-Fx | y = x + 24
g.floaterm_keymap_new = '<F6>'
g.floaterm_keymap_prev = '<F7>'
g.floaterm_keymap_next = '<F8>'
g.floaterm_keymap_toggle = '<F5>'
g.floaterm_keymap_kill = '<F10>'
-- }}


g.markdown_fenced_languages = {
  'plsql', 'sql', 'python', 'lua', 'html', 'php', 'c', 'cpp', 'ocaml'
}


-- {{ Vimtex
g.tex_flavor = 'latex'
g.vimtex_compiler_latexmk = {
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
