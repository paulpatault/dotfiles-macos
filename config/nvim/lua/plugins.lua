--[[ local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end ]]

vim.cmd [[packadd packer.nvim]]

return require("packer").startup({
  function(use)

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
    use "sbdchd/neoformat"
    use "liuchengxu/graphviz.vim"
    -- use 'whonore/Coqtail'

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
    --[[ use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      ft = { 'tex', 'c', 'cpp', 'python', 'lua', 'html', 'css' }
    } ]]

    use "morhetz/gruvbox"
    use "kyazdani42/nvim-web-devicons"
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "lilydjwg/colorizer"
    -- use 'emilienlemaire/tree-sitter-menhir'
    -- use "projekt0n/github-nvim-theme"

    ----- utils -----
    use "wellle/targets.vim"
    use "lewis6991/impatient.nvim"
    use {
      "arthurxavierx/vim-unicoder",
      ft = 'markdown'
    }
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
    -- use "folke/which-key.nvim"

    use "folke/zen-mode.nvim"
    -- use {'soywod/himalaya', rtp = 'vim'}
    use {
      "GCBallesteros/vim-textobj-hydrogen",
      requires = "kana/vim-textobj-user",
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use "machakann/vim-highlightedyank"
    use "machakann/vim-swap"
  end,
  config =  {
    display = {
      _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require("plenary.window.float").percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]
          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, "winblend", 10)

        return win, bufnr
      end
    },
  }
})
