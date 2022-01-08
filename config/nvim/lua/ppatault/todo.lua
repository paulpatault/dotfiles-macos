-- TODO: aa
-- FIX: text
-- HACK: Text
-- WARN: Text
-- PERF: Text
-- NOTE: Text

require("todo-comments").setup {
  colors = {
    error   = { "DiagnosticError",   "ErrorMsg",   "#fb4934" },
    warning = { "DiagnosticWarning", "WarningMsg", "#fabd2f" },
    info    = { "DiagnosticInfo",                  "#83a598" },
    hint    = { "DiagnosticHint",                  "#8ec07c" },
    default = { "Identifier",                      "#d3869b" },
  },
  command = "rg",
  args = {
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "-g",
    "!vendor/*"
  },
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
}
