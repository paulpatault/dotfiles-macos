local add_rtp = require("ppatault.utils").add_rtp

local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_set_var("python_host_prog", "/usr/bin/python")
vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
vim.api.nvim_set_var("merlin_python_version", 3)

vim.api.nvim_set_var("opamshare", opam_share)

add_rtp(opam_share .. "/merlin/vim/doc")
add_rtp(opam_share .. "/merlin/vim")
add_rtp(opam_share .. "/merlin/vimbufsync")
add_rtp(opam_share .. "/ocp-indent/vim")

-- vim.cmd ("source " .. opam_share .. "/ocp-indent/vim/indent/ocaml.vim")

local ocaml_callback = function ()
  if vim.opt_local.filetype:get() == "ocaml" then
    vim.cmd [[unlet b:did_indent]]
  end
  vim.cmd.source(opam_share .. "/ocp-indent/vim/indent/ocaml.vim")
  vim.opt.iskeyword:append("_")

  vim.keymap.set("n", "<localleader>af", "a assert false<esc>")
  -- vim.keymap.set("n", "<leader>aft", "a assert false (* TODO *)<esc>")
  vim.keymap.set("n", "<leader>d", [[i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i]])

  vim.keymap.set("n", "s", function() vim.call("OCaml_switch", 0) end)
  vim.keymap.set("i", "<c-a>", " assert false")

  vim.keymap.set("n", "<localleader>f", function() vim.cmd("FloatermNew utop") end)
  vim.keymap.set("n", "<localleader>i", [[:!ocaml %<cr>]])
end

vim.api.nvim_create_augroup("randomcmds", {clear = true})

vim.api.nvim_create_autocmd(
  "FileType",
  {
    group = "randomcmds",
    pattern = {
      "ocaml",
      -- "ocaml_interface",
    },
    callback = ocaml_callback,
  }
)

-- nvim_set_var("ocaml_noend_error", 1)
-- nvim_set_var("ocaml_revised", 1)

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
