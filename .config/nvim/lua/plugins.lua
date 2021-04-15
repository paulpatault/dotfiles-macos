vim.cmd('packadd packer.nvim')

return require('packer').startup({
  function(use)

    use {'wbthomason/packer.nvim', opt = true}

    use 'neovim/nvim-lspconfig'
    use 'wbthomason/lsp-status.nvim'
    use 'hrsh7th/nvim-compe'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- use 'emilienlemaire/clang-tidy.nvim'

    use 'glepnir/lspsaga.nvim'

    use 'cohama/lexima.vim' -- autopairs

    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'


    use 'arthurxavierx/vim-unicoder'
    use 'machakann/vim-sandwich'

    use 'pbrisbin/vim-mkdir'
    -- use 'junegunn/vim-easy-align' 


    use 'mbbill/undotree'
    use 'voldikss/vim-floaterm'

    -- use 'lervag/vimtex'

    use 'jesseleite/vim-noh'
    use 'b3nj5m1n/kommentary'

    use 'kevinhwang91/nvim-hlslens' -- better search

    use 'sublimelsp/LSP-pyls'
    use 'ocaml/ocaml-lsp'
    use 'ocaml/vim-ocaml'
    use 'cdelledonne/vim-cmake'
    use 'tpope/vim-markdown'

    use 'morhetz/gruvbox'
    use 'nvim-lua/plenary.nvim'
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
