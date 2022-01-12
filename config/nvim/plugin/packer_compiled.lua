-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["LSP-pyls"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/LSP-pyls",
    url = "https://github.com/sublimelsp/LSP-pyls"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-vsnip"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  colorizer = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/colorizer",
    url = "https://github.com/lilydjwg/colorizer"
  },
  ["graphviz.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/graphviz.vim",
    url = "https://github.com/liuchengxu/graphviz.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["jupytext.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/jupytext.vim",
    url = "https://github.com/GCBallesteros/jupytext.vim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lexima.vim",
    url = "https://github.com/cohama/lexima.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/wbthomason/lsp-status.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["ocaml-lsp"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/ocaml-lsp",
    url = "https://github.com/ocaml/ocaml-lsp"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-cmake",
    url = "https://github.com/cdelledonne/vim-cmake"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-menhir"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-menhir",
    url = "https://github.com/ELLIOTTCABLE/vim-menhir"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-ocaml",
    url = "https://github.com/ocaml/vim-ocaml"
  },
  ["vim-ripple"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-ripple",
    url = "https://github.com/urbainvaes/vim-ripple"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-textobj-hydrogen"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-textobj-hydrogen",
    url = "https://github.com/GCBallesteros/vim-textobj-hydrogen"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-unicoder"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vim-unicoder",
    url = "https://github.com/arthurxavierx/vim-unicoder"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["virtual-types.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/virtual-types.nvim",
    url = "https://github.com/paulpatault/virtual-types.nvim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType md ++once lua require("packer.load")({'vim-unicoder'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'vimtex'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], true)
vim.cmd [[source /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]]
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/cls.vim]], false)
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], true)
vim.cmd [[source /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]]
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tex.vim]], false)
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], true)
vim.cmd [[source /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]]
time([[Sourcing ftdetect script at: /Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex/ftdetect/tikz.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
