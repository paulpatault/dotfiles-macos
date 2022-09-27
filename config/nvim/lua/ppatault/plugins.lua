--[[ local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end ]]

vim.cmd [[packadd packer.nvim]]

return require("packer").startup({function(use)

    use {"wbthomason/packer.nvim", opt = true}

    ----- lsp -----
    use "neovim/nvim-lspconfig"
    use "wbthomason/lsp-status.nvim"
    use "sublimelsp/LSP-pyls"
    use "ocaml/ocaml-lsp"

    ----- cmp -----
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "kdheepak/cmp-latex-symbols"

    ----- languages -----
    use "ocaml/vim-ocaml"
    use "neovimhaskell/haskell-vim"
    use "sbdchd/neoformat"
    use "liuchengxu/graphviz.vim"
    use "simrat39/rust-tools.nvim"
    -- use "jvoorhis/coq.vim"
    -- use "https://framagit.org/manu/coq-au-vim"
    use "whonore/Coqtail"

    use { "lervag/vimtex", ft = { "tex" } }

    ----- telescope -----
    use "nvim-lua/popup.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        {"nvim-lua/popup.nvim"},
        {"nvim-lua/plenary.nvim"}
      }
    }
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "nvim-telescope/telescope-file-browser.nvim"

    ----- theme -----
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
    use { "arthurxavierx/vim-unicoder", ft = 'markdown' }
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
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  end
})
