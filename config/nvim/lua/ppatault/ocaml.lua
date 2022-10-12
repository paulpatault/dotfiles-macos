local add_rtp = require("ppatault.utils").add_rtp
local nvim_set_var = vim.api.nvim_set_var

local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

nvim_set_var("python_host_prog", "/usr/bin/python")
nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
nvim_set_var("merlin_python_version", 3)

nvim_set_var("opamshare", opam_share)

add_rtp(opam_share .. "/merlin/vim/doc")
add_rtp(opam_share .. "/merlin/vim")
add_rtp(opam_share .. "/merlin/vimbufsync")
add_rtp(opam_share .. "/ocp-indent/vim")

vim.cmd ("source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim")

nvim_set_var("ocaml_noend_error", 1)
nvim_set_var("ocaml_revised", 1)

vim.g.neoformat_ocaml_ocamlformat = {
  exe = "ocamlformat",
  no_append = true,
  stdin = true,
  args = {
    "--disable-outside-detected-project",
    "--name",
    [[%:p"]],
    "-"
  }
}

vim.g.neoformat_enabled_ocaml = {"ocamlformat"}
