
local opam_share = os.getenv("OPAM_SWITCH_PREFIX") .. "/share"

vim.api.nvim_set_var("python_host_prog", "/usr/bin/python")
vim.api.nvim_set_var("python3_host_prog", "/opt/homebrew/bin/python3")
vim.api.nvim_set_var("merlin_python_version", 3)

vim.api.nvim_set_var("opamshare", opam_share)

vim.opt.rtp:append(opam_share .. "/merlin/vim/doc")
vim.opt.rtp:append(opam_share .. "/merlin/vim")
vim.opt.rtp:append(opam_share .. "/merlin/vimbufsync")
vim.opt.rtp:append(opam_share .. "/ocp-indent/vim")

vim.api.nvim_create_autocmd( "BufWinEnter", {
    group = vim.api.nvim_create_augroup("ocaml_grp", {clear = true}),
    pattern = { "*.ml", "*.mli" }, -- "ocaml_interface"
    callback = function ()

      if vim.bo.ft ~= "ocaml" then return end

      vim.cmd("unlet b:did_indent")

      vim.cmd.source(opam_share .. "/ocp-indent/vim/indent/ocaml.vim")
      vim.opt.iskeyword:append("_")

      -- insert code
      -- vim.keymap.set("n", "<leader>d", [[i<cr><esc>kaif debug then Format.eprintf "%a@." ;<esc>i]])
      vim.keymap.set("n", "<localleader>f", function() vim.cmd("FloatermNew utop") end, { desc = "OCaml - [F]loaterm with utop" })
      vim.keymap.set("n", "<localleader>i", function() vim.cmd("!ocaml %") end, { desc = "OCaml - [I]nterpret file" })

      -- switch
      vim.keymap.set("n", "s", function() vim.call("OCaml_switch", 0) end)
      vim.keymap.set("n", "S", function() vim.call("OCaml_switch", 1) end)

      vim.keymap.set("i", "<C-a>", " assert false", { desc = "OCaml - insert [A]ssert false" })
      vim.keymap.set("n", "<C-a>", "a assert false<ESC>", { desc = "OCaml - insert [A]ssert false" })

    end
})

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

vim.g.neoformat_enabled_ocaml = { "ocamlformat" }

--[[ vim.keymap.set("n", "ml", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":ML " .. filename)
end)

vim.keymap.set("n", "mli", function()
  local filename = vim.fn.expand("%:t:r")
  vim.cmd (":MLI " .. filename)
end) ]]
