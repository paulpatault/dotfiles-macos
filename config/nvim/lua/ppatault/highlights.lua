
local undergrp = vim.api.nvim_create_augroup("UndercurlDiags", {clear = true})

local function set_hl(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

local function cocaml()

  if vim.o.background ~= "dark" then return end
  -- if 1 == 1 then return end

  set_hl("ocamlKeyword", { link = "GruvboxRedBold" })
  -- set_hl("@function", { link = "GruvboxRedBold" })
  -- set_hl("@function", { fg = "#d5c4a1" })

  -- set_hl("ocamlOperator", { bold = true })
  -- set_hl("ocamlArrow", { link = "GruvboxRedBold" })
  local strs = {
    "ocamlModule";
    "ocamlModPath";
    "ocamlObject";
    "ocamlModule";
    "ocamlModParam1";
    "ocamlGenMod";
    "ocamlModType";
    "ocamlMPRestr3";
    "ocamlFullMod";
    "ocamlFuncWith";
    "ocamlModParam";
    "ocamlModTypeRestr";
    "ocamlWith";
    "ocamlMTDef";
    "ocamlScript";
    "ocamlMethod";
  }
  for _, str in ipairs(strs) do
    set_hl(str, { fg = "#d5c4a1", bold = true, italic = true })
  end
end

local function ccoq()
  if vim.o.background ~= "dark" then return end
  set_hl("Keyword",    { link = "GruvboxRedBold" })
  set_hl("PreProc",    { link = "GruvboxAquaBold" })
  set_hl("Type",       { link = "GruvboxYellowBold" })
  set_hl("Underlined", { link = "GruvboxBlueBold" })
  set_hl("CoqtailSent",    { bg = vim.api.nvim_get_var("coq_sent_color")})
  set_hl("CoqtailChecked", { bg = vim.api.nvim_get_var("coq_check_color")})
end

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    group = undergrp,
    pattern = { "*" },
    callback = function()
      set_hl("DiagnosticUnderlineWarning",     { undercurl = true, })
      set_hl("DiagnosticUnderlineError",       { undercurl = true, sp = "#fb4934" })
      set_hl("DiagnosticUnderlineHint",        { undercurl = true })
      set_hl("DiagnosticUnderlineInformation", { undercurl = true })
      set_hl("QuickScopePrimary",              { underline = true })
      set_hl("QuickScopeSecondary",            { undercurl = true })

      set_hl("CmpItemAbbr", { fg = "#a89984" })
      set_hl("CmpItemKind", { fg = "#fabd2f" })
      set_hl("CmpItemMenu", { fg = "#83a598" })

      vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")

      if vim.bo.filetype == "ocaml" then cocaml() end
      if vim.bo.filetype == "coq" then ccoq() end

    end
  }
)

vim.api.nvim_create_autocmd(
  "Filetype",
  {
    group = undergrp,
    pattern = { "coq" },
    callback = ccoq
  })

vim.api.nvim_create_autocmd(
  { "Filetype" },
  {
    group = undergrp,
    pattern = { "scala" },
    callback = function()
      set_hl("scalaKeyword", { link = "GruvboxRedBold" })
      set_hl("scalaKeywordModifier", { link = "GruvboxRedBold" })
      set_hl("Keyword", { link = "GruvboxRedBold" })
    end
  }
)

vim.api.nvim_create_autocmd(
  { "Filetype" },
  {
    group = undergrp,
    pattern = { "ocaml", "ocaml.interface", "ocaml.ocamllex" },
    callback = cocaml
  }
)

