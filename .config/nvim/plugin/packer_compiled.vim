" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/paulpatault/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

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
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
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
  ["vim-mkdir"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-mkdir"
  },
  ["vim-noh"] = {
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vim-noh"
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
    loaded = true,
    path = "/Users/paulpatault/.local/share/nvim/site/pack/packer/start/vimtex"
  }
}

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
