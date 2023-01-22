vim.cmd.packadd("packer.nvim")

return require("packer").startup({function(use)

    use { "wbthomason/packer.nvim", opt = true }

    ----- lsp -----
    use "neovim/nvim-lspconfig"
    -- use "wbthomason/lsp-status.nvim"
    use "sublimelsp/LSP-pyls"
    use "ocaml/ocaml-lsp"
    use {
      "scalameta/nvim-metals",
      requires = { "nvim-lua/plenary.nvim" }
    }

    ----- cmp -----
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-cmdline"
    use "kdheepak/cmp-latex-symbols"

    ----- languages -----
    use "ocaml/vim-ocaml"
    use "ELLIOTTCABLE/vim-menhir"
    use "bfontaine/conflicts.vim"
    use "neovimhaskell/haskell-vim"
    use "sbdchd/neoformat"
    -- use "liuchengxu/graphviz.vim"
    use "simrat39/rust-tools.nvim"
    use "whonore/Coqtail"
    use "bohlender/vim-smt2"
    use "fladson/vim-kitty"
    use "isti115/agda.nvim"

    use "lervag/vimtex"
    use "wreien/vim-jasmin"

    ----- telescope -----
    use {
      "nvim-telescope/telescope.nvim", tag = "0.1.1",
      requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"

    ----- theme -----
    use "rafi/awesome-vim-colorschemes"
    use "morhetz/gruvbox"
    use "kyazdani42/nvim-web-devicons"
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "lilydjwg/colorizer"

    ----- utils -----
    use "wellle/targets.vim"
    use "lewis6991/impatient.nvim"
    -- use "arthurxavierx/vim-unicoder"
    use "machakann/vim-sandwich"
    use "cohama/lexima.vim"
    use "mbbill/undotree"
    use "voldikss/vim-floaterm"
    use "b3nj5m1n/kommentary"
    use "tpope/vim-fugitive"
    use "onsails/lspkind-nvim"
    use "GCBallesteros/jupytext.vim"
    use "urbainvaes/vim-ripple"
    use "urbainvaes/vim-remembrall"
    use "folke/zen-mode.nvim"
    use {
      "GCBallesteros/vim-textobj-hydrogen",
      requires = "kana/vim-textobj-user",
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use "machakann/vim-highlightedyank"
    use "machakann/vim-swap"
    use {
      "sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim"
    }
    use {
      "max397574/better-escape.nvim",
      config = function() require("better_escape").setup() end
    }
    use { "paulpatault/compit" }
  end
})
