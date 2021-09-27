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
  local success, result = pcall(loadstring(s))
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
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/LSP-pyls"
  },
  colorizer = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/colorizer"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  kommentary = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lexima.vim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lexima.vim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["ocaml-lsp"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/ocaml-lsp"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["vim-cmake"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-cmake"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-ocaml"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-ocaml"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-unicoder"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-unicoder"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimtex = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/opt/vimtex"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
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