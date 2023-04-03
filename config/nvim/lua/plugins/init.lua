return {

    -- "nvim-treesitter/nvim-treesitter",
    -- LSP
    "neovim/nvim-lspconfig",
    "sublimelsp/LSP-pyls",
    "ocaml/ocaml-lsp",
    "scalameta/nvim-metals",

    -- Dependencies
    "nvim-lua/plenary.nvim",

    -- OCaml
    "ocaml/vim-ocaml",
    "ELLIOTTCABLE/vim-menhir",
    "bfontaine/conflicts.vim",
    "whonore/Coqtail",

    -- Languages
    "neovimhaskell/haskell-vim",
    "bohlender/vim-smt2",
    "fladson/vim-kitty",
    "isti115/agda.nvim",
    "wreien/vim-jasmin",

    -- Colors
    "rafi/awesome-vim-colorschemes",
    "ellisonleao/gruvbox.nvim",
    "kyazdani42/nvim-web-devicons",
    "lilydjwg/colorizer",

    -- Other
    "krady21/compiler-explorer.nvim",
    "wellle/targets.vim",
    "lewis6991/impatient.nvim",
    "machakann/vim-swap",

    -- { "unblevable/quick-scope", config = function() vim.g.qs_highlight_on_keys = {"f", "F", "t", "T"} end },

    "machakann/vim-sandwich",
    "cohama/lexima.vim",
    "machakann/vim-highlightedyank",
    { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

    { "GCBallesteros/vim-textobj-hydrogen", dependencies = "kana/vim-textobj-user" },

}
