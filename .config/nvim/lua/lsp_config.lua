-- vim.cmd [[ packadd nlua.nvim ]]

local lsp = require('lspconfig')
local nvim_status = require('lsp-status')
local configs = require('lspconfig/configs')
local status = require('ppatault.lsp_status')

-- local completion = require('completion')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end


-- require('vim.lsp.log').set_level("debug")

status.activate()

local custom_attach = function(client)
  status.on_attach(client)
end

--------- C/C++  ---------

lsp.clangd.setup{
  default_config = {
    cmd = { 'clangd', '--background-index' };
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' };
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  }
}

lsp.clangd.setup{
  on_attach = custom_attach
}


--------- PYTHON ---------

lsp.pyls.setup{
  on_attach = custom_attach
}

--------- OCAML ---------

configs.ocamllsp = {
  default_config = {
    cmd = { 'ocamllsp' };
    filtypes = {'ocaml'};
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  }
}

lsp.ocamllsp.setup{
  on_attach = custom_attach
}

--------- LATEX ---------

lsp.texlab.setup({
  on_attach = custom_attach,
})
