require("ppatault.set")
require("ppatault.mappings")
require("ppatault.globals")

require("ppatault.highlights")
require("ppatault.ocaml")
require("ppatault.packer")
-- require("rust-tools").setup({})
require("impatient")

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
    pattern = {"c","tex","cpp"},
    command = "set sw=4",
    group   = iopt_grp
  })
vim.api.nvim_create_autocmd("FileType",
  {
    pattern = {"markdown","lua","kawa","ocaml","why3","lustre"},
    command = "set sw=2",
    group   = iopt_grp
  })
vim.api.nvim_create_autocmd("FileType",
  {
    pattern = {"tex"},
    command = "setlocal spell",
    group   = iopt_grp
  })

function R(name)
    require("plenary.reload").reload_module(name)
end
