return {
  "voldikss/vim-floaterm",
  config = function()

    vim.keymap.set("n", "<leader>tlg",
      function() vim.cmd("FloatermNew lazygit") end, { desc = "[T]erminal + [G]it" })

  end
}
