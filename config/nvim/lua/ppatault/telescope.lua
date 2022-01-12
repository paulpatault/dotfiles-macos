if not pcall(require, 'telescope') then
  return
end

local should_reload = true

local reloader = function()
  if should_reload then
    RELOAD('plenary')
    RELOAD('popup')
    RELOAD('telescope')
  end
end

reloader()

local tbl  = {
  ['md']      = 'markdown',
  ['mli']     = 'ocaml_interface',
  ['mll']     = 'ocamllex',
  ['mlw']     = 'why3',
  ['lus,ept'] = 'lustre',
  ['imp']     = 'imp',
  ['pimp']    = 'imp',
  ['pmimp']   = 'imp',
  ['kawa']    = 'kawa',
  ['vips']    = 'asm',
  ['vipsopt'] = 'asm',
  ['gips']    = 'asm',
  ['gipsopt'] = 'asm',
  ['rml']     = 'rml'
}

require('plenary.filetype').add_file(tbl)

require('telescope').setup{
  defaults = {
    --[[ vimgrep_arguments = {
      'fzf'
    }, ]]
    file_ignore_patterns = {
      [[undodir/%.*]],
      [[_build/*]],
      [[%.cmo]],
      [[%.cmi]],
      [[%.cmx]],
      [[%.o]],
      [[%.gz]],
      [[%.cmt]],
      [[%.cmti]],
      [[%.pyc]],
      [[%.aux]],
      [[%.jpg]],
      [[%.png]],
      [[%.pdf]]},

    layout_config = {prompt_position = "bottom"},

    file_sorter = require("telescope.sorters").get_fzy_sorter,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true
      }
    }
  }
}

pcall(require('telescope').load_extension, 'fzy_native')
