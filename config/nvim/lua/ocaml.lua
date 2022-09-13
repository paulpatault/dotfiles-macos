local home = os.getenv("HOME")

local options = {
  noremap = true,
  silent = true
}

vim.api.nvim_set_var("python_host_prog", "/usr/bin/python")
vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
vim.api.nvim_set_var("merlin_python_version", 3)

local utils = require("utils")

local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_set_var("opamshare", opam_share)

utils.add_rtp(opam_share .. "/merlin/vim/doc")
utils.add_rtp(opam_share .. "/merlin/vim")
utils.add_rtp(opam_share .. "/merlin/vimbufsync")
utils.add_rtp(opam_share .. "/ocp-indent/vim")

vim.cmd ("source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim")

function Switch_ml(x)
  local filename = vim.fn.expand("%:t:r")
  if x then
    vim.cmd (":ML " .. filename)
  else
    vim.cmd (":MLI " .. filename)
  end
end

utils.map("n", "<leader>af", "a assert false<esc>", options)
utils.map("n", "<leader>aft", "a assert false (* TODO *)<esc>", options)
utils.map("n", "<leader>d", [[i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i]], options)
utils.map_lua("n", "ml",  "Switch_ml(true)", options)
utils.map_lua("n", "mli", "Switch_ml(false)", options)


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
