return {
  "folke/zen-mode.nvim",

  config = function()

    local zen_mode = require("zen-mode")
    vim.api.nvim_set_var("pres_mode", false)

    vim.keymap.set("n", "<leader>zp", function()
      local pres = vim.api.nvim_get_var("pres_mode")
      vim.api.nvim_set_var("pres_mode", not pres)
      zen_mode.toggle()
      if pres then
        vim.wo.number = true
        vim.wo.relativenumber = true
      else
        vim.wo.number = false
        vim.wo.relativenumber = false
      end
    end, { desc = "[Z]en mode [P]resentation" })

    zen_mode.setup {
      window = {
        width = 90,
        options = {
          number = true,
          relativenumber = true,
        }
      },
    }

    vim.keymap.set("n", "<leader>zz", function()
      zen_mode.toggle()
      vim.wo.wrap = false
    end, { desc = "[Z]en mode" })

  end }
