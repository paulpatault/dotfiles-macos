require("ppatault.packer")
require("impatient")
require("ppatault.set")
require("ppatault.mappings")
require("ppatault.globals")

-- require("rust-tools").setup({})
require("ppatault.highlights")
require("ppatault.theme")
require("ppatault.ocaml")

local fts = {
  zsh = "sh",
  mlw = "why3",
  mp = "patmat",
  lus = "lustre",
  ept = "lustre",
  proof = "proof",
  mll = "ocaml.ocamllex",
  --mly = "ocaml.menhir",
  mli = "ocaml.interface",
  fx = "scala.no_lsp",
}

local iopt_grp = vim.api.nvim_create_augroup("Opts_grp", {clear = true})

for k, v in pairs(fts) do
  vim.api.nvim_create_autocmd("BufRead,BufNewFile",
    {
      pattern = "*." .. k,
      command = "set filetype=" .. v,
      group = iopt_grp,
    }
  )
end

vim.api.nvim_create_autocmd("FileType",
  {
    pattern = {"c","latex","cpp"},
    command = "set sw=4",
    group   = iopt_grp
  })
vim.api.nvim_create_autocmd("FileType",
  {
    pattern = {"markdown","lua","kawa","ocaml","wh3","lustre"},
    command = "set sw=2",
    group   = iopt_grp
  })
vim.api.nvim_create_autocmd("FileType",
  {
    pattern = {"*.tex"},
    command = "setlocal spell",
    group   = iopt_grp
  })

local ok, res = pcall(function() require("ppatault.lsp") end)

if not ok then
  print("No LSP")
  print(res)
end

function R(name)
    require("plenary.reload").reload_module(name)
end
