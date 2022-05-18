-- TODO: aa
-- FIX: text
-- HACK: Text
-- WARN: Text
-- PERF: Text
-- NOTE: Text

require("todo-comments").setup {
  signs = false, -- show icons in the signs column
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  colors = {
    error   = { "DiagnosticError",   "ErrorMsg",   "#fb4934" },
    warning = { "DiagnosticWarning", "WarningMsg", "#fabd2f" },
    info    = { "DiagnosticInfo",                  "#83a598" },
    hint    = { "DiagnosticHint",                  "#8ec07c" },
    default = { "Identifier",                      "#d3869b" },
  },
  keywords = {
    FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "", -- "fg" or "bg" or empty
    -- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    -- pattern = [[.*<(KEYWORDS)\s*(:)*]], -- pattern or table of patterns, used for highlightng (vim regex)
    pattern = [[(KEYWORDS)]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },

  search = {
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
    pattern = [[\b(KEYWORDS)(:)?\b]]
  },
}
