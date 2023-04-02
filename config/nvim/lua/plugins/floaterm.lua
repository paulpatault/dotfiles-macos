return {
  "voldikss/vim-floaterm",
  config = function()

    vim.keymap.set("n", "<leader>tg",
      function() vim.cmd("FloatermNew lazygit") end, { desc = "[T]erminal + [G]it" })

  end
}
