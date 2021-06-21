-- vim.cmd [[ packadd nlua.nvim ]]

local lsp = require('lspconfig')
local util = require('lspconfig/util')
local nvim_status = require('lsp-status')
local status = require('ppatault.lsp_status')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

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

--------- TS/JS ---------

lsp.tsserver.setup{}

--------- OCAML ---------

lsp.ocamllsp.setup{
    cmd = { 'ocamllsp' };
    filetypes = {"ocaml", "ocaml_interface", "ocamllex", "menhir"};
    root_dir = function(fname)
      return
        lsp.util.find_git_ancestor(fname)
        or vim.loop.os_homedir()
        or util.root_pattern("*.opam", "esy.json", "package.json", ".git")
      end;
    settings = {};
}

lsp.ocamllsp.setup({
  on_attach = custom_attach
})

--------- HTML ---------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup{
  capabilities = capabilities,
}
require'lspconfig'.html.setup{}

--------- LATEX ---------

lsp.texlab.setup({
  on_attach = custom_attach,
})

--------- LUA ---------

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = "/Users/paulpatault/DevUtil/lsp/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
