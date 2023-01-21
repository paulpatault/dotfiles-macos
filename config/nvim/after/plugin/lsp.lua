local lsp = require('lspconfig')
local util = require('lspconfig/util')

--[[ local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon })
end ]]

vim.cmd.autocmd("ColorScheme * highlight NormalFloat guibg=#3c3836")
vim.cmd.autocmd("ColorScheme * highlight FloatBorder guifg=white guibg=#3c3836")

vim.diagnostic.config({
  -- virtual_text = false;
  signs = false;
  virtual_text = {
    format = function(_) return "" end
  }
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "grf", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gT", function() vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "dc", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "ds", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "dl", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "dn", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "dN", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "do", function() vim.diagnostic.enable() end, opts)
  vim.keymap.set("n", "df", function() vim.diagnostic.disable() end, opts)
end

--
--------- Scala  ---------

require("lspconfig").metals.setup({
  on_attach = on_attach
})

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
  on_attach = on_attach
})

--------- RUST ---------

require'lspconfig'.rust_analyzer.setup{ on_attach = on_attach }

--------- OCAML ---------

local rootd2 = function(fname)
  return
    lsp.util.find_git_ancestor(fname)
    or vim.loop.os_homedir()
    or util.root_pattern("*.opam", ".git", "dune-project")
end

lsp.ocamllsp.setup{
    cmd = { 'ocamllsp' },
    filetypes = {"ocaml", "ocaml.interface", "ocaml.ocamllex", "ocaml.menhir", "menhir"},
    root_dir = rootd2,
    on_attach = on_attach
}

--------- HTML ---------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup({
  on_attach = on_attach;
  capabilities = capabilities })

--------- LATEX ---------

lsp.texlab.setup({ on_attach = on_attach })

--------- LUA ---------

local home = os.getenv('HOME')

local sumneko_root_path = home .. "/dotfiles/config/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  on_attach = on_attach;
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
lsp.pylsp.setup({ on_attach = on_attach })

--------- HASKELL ---------
lsp.hls.setup({
    on_attach = on_attach
})

--------- JS -------------
local on_attach_js = function(_, bufnr)
  on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lsp.tsserver.setup({
    on_attach = on_attach_js;
    flags = {debounce_text_changes = 150}
})
