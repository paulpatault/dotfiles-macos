vim.cmd.packadd("packer.nvim")

return require("packer").startup({function(use)

    use { "wbthomason/packer.nvim", opt = true }

    ----- lsp -----
    use "nvim-treesitter/nvim-treesitter"
    use "neovim/nvim-lspconfig"
    use "sublimelsp/LSP-pyls"
    use "ocaml/ocaml-lsp"
    use "nvim-lua/plenary.nvim"
    use "scalameta/nvim-metals"

    ----- cmp -----
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-cmdline"
    use "kdheepak/cmp-latex-symbols"

    ----- ocaml -----
    use "ocaml/vim-ocaml"
    use "ELLIOTTCABLE/vim-menhir"
    use "bfontaine/conflicts.vim"
    use "whonore/Coqtail"

    ----- other languages-----
    use "neovimhaskell/haskell-vim"
    use "bohlender/vim-smt2"
    use "fladson/vim-kitty"
    use "isti115/agda.nvim"
    use "lervag/vimtex"
    use "wreien/vim-jasmin"

    ----- telescope -----
    use { "nvim-telescope/telescope.nvim", tag = "0.1.1" }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"

    ----- theme -----
    use "rafi/awesome-vim-colorschemes"
    use "morhetz/gruvbox"
    use "kyazdani42/nvim-web-devicons"
    use "lilydjwg/colorizer"
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    ----- utils -----
    use "wellle/targets.vim"
    use "lewis6991/impatient.nvim"
    use "folke/zen-mode.nvim"
    use "machakann/vim-swap"
    use "max397574/better-escape.nvim"
    use "unblevable/quick-scope"
    use "bkad/CamelCaseMotion"
    use "paulpatault/compit"
    use "machakann/vim-sandwich"
    use "cohama/lexima.vim"
    use "mbbill/undotree"
    use "voldikss/vim-floaterm"
    use "b3nj5m1n/kommentary"
    use "tpope/vim-fugitive"
    use "GCBallesteros/jupytext.vim"
    use "urbainvaes/vim-ripple"
    use "sbdchd/neoformat"
    use "machakann/vim-highlightedyank"
    use "sindrets/diffview.nvim"
    use {
      "GCBallesteros/vim-textobj-hydrogen",
      requires = "kana/vim-textobj-user",
    }

  end
})

    -- PAST --
    -- use "arthurxavierx/vim-unicoder"
    -- use "onsails/lspkind-nvim"
    -- use "liuchengxu/graphviz.vim"
    -- use "simrat39/rust-tools.nvim"
    --[[ use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    } ]]
