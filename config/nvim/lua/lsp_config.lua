local lsp = require('lspconfig')
local util = require('lspconfig/util')

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon })
end

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#3c3836]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#3c3836]]

local border = {
      -- {"🭽", "FloatBorder"},
      {"╭", "FloatBorder"},
      -- {"▔", "FloatBorder"},
      {"-", "FloatBorder"},
      -- {"🭾", "FloatBorder"},
      {"╮", "FloatBorder"},
      -- {"▕", "FloatBorder"},
      {"|", "FloatBorder"},
      -- {"🭿", "FloatBorder"},
      {"╯", "FloatBorder"},
      -- {"▁", "FloatBorder"},
      {"-", "FloatBorder"},
      -- {"🭼", "FloatBorder"},
      {"╰", "FloatBorder"},
      -- {"▏", "FloatBorder"},
      {"|", "FloatBorder"},
}


-- LSP settings
local on_attach = function(client)
  --[[ vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border}) ]]
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
  };
  -- on_attach = on_attach
}

--------- OCAML ---------

lsp.ocamllsp.setup{
    cmd = { 'ocamllsp' };
    filetypes = {"ocaml", "ocaml.interface", "ocaml.ocamllex", "ocaml.menhir"};
    root_dir = function(fname)
      return
        lsp.util.find_git_ancestor(fname)
        or vim.loop.os_homedir()
        or util.root_pattern("*.opam", ".git", "dune-project")
      end;
    -- settings = {};
    on_attach = function(client)
      on_attach(client)
      -- require('virtualtypes').on_attach()
    end
}

--------- HTML ---------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup{
  capabilities = capabilities
}

--------- LATEX ---------

lsp.texlab.setup({
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

local sumneko_root_path = "/Users/paulpatault/Dev/DevUtil/lsp/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

--------- PYTHON ---------

lsp.pylsp.setup({
})

--------- TS/JS ---------

-- lsp.tsserver.setup{}
