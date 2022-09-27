vim.g.ripple_repls = {
  rml = {
    command = "rmltop", -- yrip / yR
    post = ";;",
    addcr  = 1
  },
  python = {
    command = "ipython --no-autoindent",
    addcr = 1
  },
  --[[ coq = {
    command = "coqtop",
    pre = "",
    post = "",
    addcr = 0
  }, ]]
  ocaml = {
    command = "utop",
    pre = "",
    post = ";;",
    addcr = 1
  }
}
