local undergrp = vim.api.nvim_create_augroup("UndercurlDiags", {clear = true})

local function cocaml()
    vim.api.nvim_set_hl(0, "ocamlKeyword", { link = "GruvboxRedBold" })
    -- vim.api.nvim_set_hl(0, "ocamlOperator", { bold = true })
    -- vim.api.nvim_set_hl(0, "ocamlArrow", { link = "GruvboxRedBold" })
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
      vim.api.nvim_set_hl(0, str, { fg = "#d5c4a1", bold = true, italic = true })
    end
end
local function ccoq()
    vim.api.nvim_set_hl(0, "Keyword",    { link = "GruvboxRedBold" })
    vim.api.nvim_set_hl(0, "PreProc",    { link = "GruvboxAquaBold" })
    vim.api.nvim_set_hl(0, "Type",       { link = "GruvboxYellowBold" })
    vim.api.nvim_set_hl(0, "Underlined", { link = "GruvboxBlueBold" })
end

vim.api.nvim_create_autocmd(
  "ColorScheme",
  {
    group = undergrp,
    pattern = { "*" },
    callback = function()
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarning",     { undercurl = true, })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineError",       { undercurl = true, sp = "#fb4934" })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",        { undercurl = true })
      vim.api.nvim_set_hl(0, "DiagnosticUnderlineInformation", { undercurl = true })

      vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#a89984" })
      vim.api.nvim_set_hl(0, "CmpItemKind", { fg = "#fabd2f" })
      vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#83a598" })

      vim.api.nvim_set_hl(0, "CoqtailSent",    { bg = vim.api.nvim_get_var("coq_sent_color")})
      vim.api.nvim_set_hl(0, "CoqtailChecked", { bg = vim.api.nvim_get_var("coq_check_color")})

      vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")

      if vim.bo.filetype == "ocaml" then
          cocaml()
      end

      if vim.bo.filetype == "coq" then
          ccoq()
      end

    end
  }
)

vim.api.nvim_create_autocmd(
  -- "BufRead,BufNewFile",
  "Filetype",
  {
    group = undergrp,
    pattern = { "coq" },
    callback = ccoq
  })

vim.api.nvim_create_autocmd(
  -- "BufRead,BufNewFile",
  "Filetype",
  {
    group = undergrp,
    -- pattern = { "*.ml", "*.mll", "*.mly" },
    pattern = { "ocaml", "ocaml.interface", "ocaml.ocamllex" },
    callback = cocaml
  }
)

