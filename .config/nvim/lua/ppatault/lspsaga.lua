local saga = require('lspsaga')

saga.init_lsp_saga{
  border_style = "round",
  rename_prompt_prefix = "Rename ➤",
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 's',
    quit = 'q',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>' -- quit can be a table
  },
  max_preview_lines = 20, -- preview lines of lsp_finder and definition preview
  error_sign = '',
  warn_sign = '',
  hint_sign = '!',
  infor_sign = '',
  code_action_prompt = {
    enable = false,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },

}
--
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon =   ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}