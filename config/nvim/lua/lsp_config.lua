local lsp = require('lspconfig')
local util = require('lspconfig/util')

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon })
end

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#3c3836]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#3c3836]]

--------- C/C++  ---------

local rootd = function(fname)
  return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
end

lsp.clangd.setup({
  default_config = {
    cmd = { 'clangd', '--background-index' };
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' };
    root_dir = rootd;
    settings = {};
  };
})

--------- OCAML ---------

local rootd2 = function(fname)
  return
    lsp.util.find_git_ancestor(fname)
    or vim.loop.os_homedir()
    or util.root_pattern("*.opam", ".git", "dune-project")
end

lsp.ocamllsp.setup{
    cmd = { 'ocamllsp' },
    filetypes = {"ocaml", "ocaml.interface", "ocaml.ocamllex", "ocaml.menhir"},
    root_dir = rootd2,
}

--------- HTML ---------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup({ capabilities = capabilities })

--------- LATEX ---------

lsp.texlab.setup({ })

--------- LUA ---------

local home = os.getenv('HOME')

local sumneko_root_path = home .. "/dotfiles/config/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

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

--------- JS -------------

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp.tsserver.setup{
    on_attach = on_attach,
    flags = {debounce_text_changes = 150}
}
