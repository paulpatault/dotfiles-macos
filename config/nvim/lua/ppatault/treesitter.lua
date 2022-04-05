vim.cmd [[ packadd nvim-treesitter ]]

-- local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

-- parser_config.ocaml_interface.filetype_to_parsername = "ocaml.ocaml_interface"
-- parser_config.ocamllex.filetype_to_parsername = "ocaml.ocamllex"

--[[ parser_config.menhir = {
  install_info = {
    url = "https://github.com/emilienlemaire/tree-sitter-menhir",
    files = { "src/parser.c", "src/scanner.cc" },
  },
  filetype = "ocaml.menhir",
} ]]

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- false will disable the whole extension
  },
   ensure_installed = {
     -- "ocaml",
     -- "ocaml_interface",
     -- "ocamllex",
     "cpp",
     "c",
     "python",
     "lua",
     "latex",
     "bash",
     "html",
     "css",
   },
}
