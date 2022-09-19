local M = {}

local cmd = vim.cmd

function M.create_augroup(autocmds, name)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

function M.add_rtp(path)
  vim.opt.rtp:append(path)
end


function M.reload_plugins()
    cmd [[luafile ~/.config/nvim/lua/plugins.lua]]
    local packer = require('packer')
    packer.sync()
    packer.compile()
end


function M.s_tab_complete()
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  if vim.fn.pumvisible() then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

function M.completion_confirm()
  local npairs = require('nvim-autopairs')
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return npairs.esc("<c-y>")
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.check_break_line_char()
  end
end


local options = { noremap = true, silent = true }

function M.Wrap_toogle ()
    local w = vim.wo
    w.wrap = not w.wrap
    if w.wrap then
        utils.map('n', 'j', 'gj', options)
        utils.map('n', 'k', 'gk', options)
        utils.map('n', '0', 'g0', options)
        utils.map('n', '$', 'g$', options)
        utils.map('v', 'j', 'gj', options)
        utils.map('v', 'k', 'gk', options)
        utils.map('v', '0', 'g0', options)
        utils.map('v', '$', 'g$', options)
        cmd [[ let &showbreak='❯❯❯ ' ]]
        -- cmd [[ let &showbreak='❮❮❮ ' ]]
        cmd [[ set cpoptions+=n ]]
    else
        utils.unmap('n', 'j')
        utils.unmap('n', 'k')
        utils.unmap('n', '0')
        utils.unmap('n', '$')
        utils.unmap('v', 'j')
        utils.unmap('v', 'k')
        utils.unmap('v', '0')
        utils.unmap('v', '$')
        cmd [[ set showbreak= ]]
        cmd [[ set cpoptions-=n ]]
    end
end

_G.utils = M
return M
