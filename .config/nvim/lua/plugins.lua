local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

--vim.cmd('packadd packer.nvim')
vim.cmd [[packadd packer.nvim]]


return require('packer').startup({
  function(use)

    use {'wbthomason/packer.nvim', opt = true}

    ----- lsp -----
    use 'neovim/nvim-lspconfig'
    use 'wbthomason/lsp-status.nvim'
    use 'glepnir/lspsaga.nvim'
    use 'sublimelsp/LSP-pyls'
    use 'ocaml/ocaml-lsp'
    use 'hrsh7th/nvim-compe'

    use 'junegunn/goyo.vim'

    ----- languages -----
    use 'ocaml/vim-ocaml'
    use 'cdelledonne/vim-cmake'
    use 'tpope/vim-markdown'
    use 'lervag/vimtex'

    ----- telescope -----
    use 'nvim-lua/popup.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'}
      }
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    ----- utils -----
    use 'arthurxavierx/vim-unicoder'
    use 'machakann/vim-sandwich'
    use 'cohama/lexima.vim' -- autopairs
    use 'mbbill/undotree'
    use 'voldikss/vim-floaterm'
    use 'b3nj5m1n/kommentary'
    -- use 'junegunn/vim-easy-align'

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    ----- theme -----
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'morhetz/gruvbox'
    use 'kyazdani42/nvim-web-devicons'
    use 'tjdevries/express_line.nvim'
    use 'lilydjwg/colorizer'

  end,
  config =  {
    display = {
      _open_fn = function(name)
        -- Can only use plenary when we have our plugins.
        --  We can only get plenary when we don't have our plugins ;)
        local ok, float_win = pcall(function()
          return require('plenary.window.float').percentage_range_window(0.8, 0.8)
        end)

        if not ok then
          vim.cmd [[65vnew  [packer] ]]
          return vim.api.nvim_get_current_win(), vim.api.nvim_get_current_buf()
        end

        local bufnr = float_win.buf
        local win = float_win.win

        vim.api.nvim_buf_set_name(bufnr, name)
        vim.api.nvim_win_set_option(win, 'winblend', 10)

        return win, bufnr
      end
    },
  }
})
