return {
  "sidebar-nvim/sidebar.nvim",
  config = function()
    require("sidebar-nvim").setup({
      -- bindings = { ["q"] = function() require("sidebar-nvim").close() end },
      open = false,
      side = "left",
      initial_width = 40,
      -- hide_statusline = false,
      -- update_interval = 1000,
      sections = { "git", "diagnostics", "buffers", "todos" },
      -- section_separator = {"", "-----", ""},
      -- section_title_separator = {""},
      --[[ containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
      }, ]]
      -- datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
      -- TODO:
      todos = { ignored_paths = { "~" } },

    })
  end
}

