vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("ppatault")

-- Styled and colored underline support
-- vim.cmd [[ let &t_AU = "\e[58:5:%dm" ]]
-- vim.cmd [[ let &t_8u = "\e[58:2:%lu:%lu:%lum" ]]
-- vim.cmd [[ let &t_Us = "\e[4:2m" ]]
-- vim.cmd [[ let &t_Cs = "\e[4:3m" ]]
-- vim.cmd [[ let &t_ds = "\e[4:4m" ]]
-- vim.cmd [[ let &t_Ds = "\e[4:5m" ]]
-- vim.cmd [[ let &t_Ce = "\e[4:0m" ]]
-- Strikethrough
-- vim.cmd [[ let &t_Ts = "\e[9m" ]]
-- vim.cmd [[ let &t_Te = "\e[29m" ]]
-- Truecolor support
-- vim.cmd [[ let &t_8f = "\e[38:2:%lu:%lu:%lum" ]]
-- vim.cmd [[ let &t_8b = "\e[48:2:%lu:%lu:%lum" ]]
-- vim.cmd [[ let &t_RF = "\e]10;?\e\\" ]]
-- vim.cmd [[ let &t_RB = "\e]11;?\e\\" ]]
-- Bracketed paste
-- vim.cmd [[ let &t_BE = "\e[?2004h" ]]
-- vim.cmd [[ let &t_BD = "\e[?2004l" ]]
-- vim.cmd [[ let &t_PS = "\e[200~" ]]
-- vim.cmd [[ let &t_PE = "\e[201~" ]]
-- Cursor control
-- vim.cmd [[ let &t_RC = "\e[?12$p" ]]
-- vim.cmd [[ let &t_SH = "\e[%d q" ]]
-- vim.cmd [[ let &t_RS = "\eP$q q\e\\" ]]
-- vim.cmd [[ let &t_SI = "\e[5 q" ]]
-- vim.cmd [[ let &t_SR = "\e[3 q" ]]
-- vim.cmd [[ let &t_EI = "\e[1 q" ]]
-- vim.cmd [[ let &t_VS = "\e[?12l" ]]
-- Focus tracking
-- vim.cmd [[ let &t_fe = "\e[?1004h" ]]
-- vim.cmd [[ let &t_fd = "\e[?1004l" ]]
--vim.cmd [[ execute "set <FocusGained>=\<Esc>[I" ]]
--vim.cmd [[ execute "set <FocusLost>=\<Esc>[O" ]]
-- Window title
-- vim.cmd [[ let &t_ST = "\e[22;2t" ]]
-- vim.cmd [[ let &t_RT = "\e[23;2t" ]]
