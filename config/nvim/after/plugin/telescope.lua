
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf",  builtin.find_files, { desc = "p + [F]iles" })
vim.keymap.set("n", "<leader>ph",  builtin.help_tags, { desc = "p + [H]elp tags" })
vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "p + [G]it files" })
vim.keymap.set("n", "<leader>pb",  builtin.buffers, { desc = "p + [B]uffer" })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "p + [D]iagnostics" })
vim.keymap.set("n", "<leader>pr", builtin.live_grep, { desc = "p + [R]ipgrep" })
vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "p + [K]eymaps" })
vim.keymap.set("n", "<leader>ps", function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "p + [S]tring grep search" })
-- vim.keymap.set("n", "<leader>fb", builtin.file_browser, {})
-- vim.keymap.set("n", "<leader>ca", builtin.lsp_code_actions, {})
-- vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, {})

local telescope = require('telescope')

require('plenary.filetype').add_file({
  ['md']      = 'markdown',
  ['mlw']     = 'why3',
  ['v']       = 'coq',
  ['lus,ept'] = 'lustre'})

telescope.setup({
  defaults = {
    --[[ vimgrep_arguments = {
      'fzf'
    }, ]]
    file_ignore_patterns = {
      [[undo/%.*]],
      [[_build/*]],
      [[%.key]],
      [[%.agdai]],
      [[_opam/*]],
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
      [[%.aux]],
      [[%.fdb_latexmk]],
      [[%.fls]],
      [[%.log]],
      [[%.synctex.gz]],
      [[%.bbl]],
      [[%.bcf]],
      [[%.blg]],
      [[%.out]],
      [[%.toc]],
      [[%.vrb]],
      [[%.run.xml]],
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
})

pcall(telescope.load_extension, "fzy_native")
