require('plugins')
require('impatient')

local ok, res = pcall(function() require('lsp_config') end)

if not ok then
  print("No LSP")
  print(res)
end

RELOAD = require('plenary.reload').reload_module

R = function(name)
  RELOAD(name)
  return require(name)
end

R('nvim-web-devicons').setup()
R('lspkind').init()
RELOADER = function()
  R('ppatault.nvim-cmp')
  -- R('ppatault.treesitter')
  R('ppatault.statusline')
  R('ppatault.plenary')
  R('ppatault.telescope')
  R('ppatault.ripple')
  R('ppatault.kommentary')
  R('ppatault.todo')
  R('mappings')
  R('globals')
end

RELOADER()
