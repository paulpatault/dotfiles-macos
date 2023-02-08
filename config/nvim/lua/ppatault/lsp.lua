local lsp = require("lspconfig")

vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
]]

vim.fn.sign_define("DiagnosticSignError", {text=nil, texthl="DiagnosticSignError", linehl=nil, numhl="DiagnosticLineNrError"})
vim.fn.sign_define("DiagnosticSignWarn",  {text=nil, texthl="DiagnosticSignWarn" , linehl=nil, numhl="DiagnosticLineNrWarn"})
vim.fn.sign_define("DiagnosticSignInfo",  {text=nil, texthl="DiagnosticSignInfo" , linehl=nil, numhl="DiagnosticLineNrInfo"})
vim.fn.sign_define("DiagnosticSignHint",  {text=nil, texthl="DiagnosticSignHint" , linehl=nil, numhl="DiagnosticLineNrHint"})

vim.cmd.autocmd("ColorScheme * highlight NormalFloat guibg=#3c3836")
vim.cmd.autocmd("ColorScheme * highlight FloatBorder guifg=white guibg=#3c3836")

vim.diagnostic.config({
  underline = true,
  virtual_text = false -- { format = function(_) return "" end }
})

local function gd(jump_type)
    local ok, _ = pcall(function() require("telescope.builtin").lsp_definitions({ jump_type=jump_type }) end)
    if not ok then
      vim.cmd(jump_type) vim.lsp.buf.definition()
    end
end


local on_attach = function(client, bufnr)

  local map = function(mod, key, f, desc)
    vim.keymap.set(mod, key, f, { desc = "lsp - " .. desc, buffer = bufnr, remap = false })
  end

  map("n", "<leader>ca", function() vim.lsp.buf.code_action() end, "[C]ode [A]ction")
  map("n", "<leader>rn", function() vim.lsp.buf.rename()   end, "[R]e[N]ame")
  map("n", "grf", function() vim.lsp.buf.references()      end, "[G]o [R]e[F]erences")
  map("n", "gd",  function() vim.lsp.buf.definition()      end, "[G]o [D]efinition")
  map("n", "gi",  function() vim.lsp.buf.implementation()  end, "[G]o [I]mplementation")
  map("n", "gT",  function() vim.lsp.buf.type_definition() end, "[G]o [T]ype definition")
  map("n", "dc",  function() vim.lsp.buf.hover()           end, "[D]iagnostic [C]heck type")
  map("n", "ds",  function() vim.lsp.buf.signature_help()  end, "[D] [S]ignature_help")
  map("n", "dl",  function() vim.diagnostic.open_float()   end, "[D]iagnostic [L]ine")
  map("n", "dn",  function() vim.diagnostic.goto_next()    end, "[D]iagnostic [N]ext")
  map("n", "dN",  function() vim.diagnostic.goto_prev()    end, "[D]iagnostic [N]prev")
  map("n", "do",  function() vim.diagnostic.enable()       end, "[D]iagnostic [O]n")
  map("n", "df",  function() vim.diagnostic.disable()      end, "[D]iagnostic of[F]")

  map("n", "<leader>dsh", function() vim.lsp.semantic_tokens.stop(bufnr, client["id"]) end, "[D]isable [S]emantic [H]ighlight")
  map("n", "<leader>esh", function() vim.lsp.semantic_tokens.start(bufnr, client["id"]) end, "[D]isable [S]emantic [H]ighlight")

  map("n", "gdv", function()
         local ok, _ = pcall(function() gd("vsplit") end)
         if not ok then print("Internal Error") end
     end,
     "[G]o [D]efinition")

  map("n", "gds", function()
         local ok, _ = pcall(function() gd("split") end)
         if not ok then print("Internal Error") end
     end,
     "[G]o [D]efinition")
end


--------- Scala  ---------

lsp.metals.setup({ on_attach = on_attach })

--------- C/C++  ---------

lsp.clangd.setup({
  default_config = {
    cmd = { "clangd", "--background-index" };
    filetypes = { "c", "cpp", "objc", "objcpp" };
    root_dir = function(fname)
      return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
  on_attach = on_attach
})

--------- RUST ---------
lsp.rust_analyzer.setup({ on_attach = on_attach })

--------- OCAML ---------

--[[ local function switch_impl_int_splitcmd(bufnr, splitcmd)
  bufnr = lsp.util.validate_bufnr(bufnr)
  local ocaml_client = lsp.util.get_active_client_by_name(bufnr, "ocamllsp")
  local params = vim.uri_from_bufnr(bufnr)
  print( "coucou 1" )
  if ocaml_client then
    print( "coucou 2" )
    ocaml_client.request("ocamllsp/switchImplIntf", params, function(err, result)
      print( "coucou 3")
      if err then
        error(tostring(err))
      end
      if not result then
        print("Corresponding file can’t be determined")
        return
      end
      vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print 'ocamllsp/switchImplIntf is not supported by the ocamllsp server active on the current buffer'
  end
end ]]

lsp.ocamllsp.setup({
  cmd = { "ocamllsp" };
  filetypes = {"ocaml", "ocaml.interface", "ocaml.ocamllex", "ocaml.menhir", "menhir"};
  root_dir = function(fname)
    return
    lsp.util.find_git_ancestor(fname)
    or vim.loop.os_homedir()
    or lsp.util.root_pattern("*.opam", ".git", "dune-project")
  end;
  on_attach = on_attach;
  --[[ commands = {
    MOcamlSwitchVsplit = {
      function() switch_impl_int_splitcmd(0, "vsplit") end;
      description = "Open source/header in a new vsplit";
    },
  } ]]
  -- handlers=handlers
})

--------- COQ ---------

--[[ vim.lsp.start({
  name = "coq_language_server";
  path = "/Users/paulpatault/.opam/coq/bin/coq-lsp";
  filetypes = { "coq" };
  cmd = { "coq-lsp" };
  root_dir = require("lspconfig").util.find_git_ancestor;
}) ]]

--------- HTML ---------

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.html.setup({
  on_attach = on_attach;
  capabilities = capabilities })

--------- LATEX ---------

lsp.texlab.setup({ on_attach = on_attach })

--------- LUA ---------

local home = os.getenv("HOME")

local sumneko_root_path = home .. "/dotfiles/config/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  on_attach = on_attach;
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = {"vim"},
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
lsp.hls.setup({ on_attach = on_attach })

--------- JS -------------
local on_attach_js = function(_, bufnr)
  on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

lsp.tsserver.setup({
    on_attach = on_attach_js;
    flags = {debounce_text_changes = 150}
})
