-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Undercurl
vim.api.nvim_set_var("t_Cs", "e[4:3m")
vim.api.nvim_set_var("t_Ce", "e[4:0m")

vim.api.nvim_set_hl(0, "SpellBad", {
  sp = "red",
  undercurl = true,
  cterm = { underline = true },
})
vim.api.nvim_set_hl(0, "SpellCap", {
  sp = "yellow",
  undercurl = true,
  cterm = { underline = true },
})
vim.api.nvim_set_hl(0, "SpellRare", {
  sp = "blue",
  undercurl = true,
  cterm = { underline = true },
})
vim.api.nvim_set_hl(0, "SpellLocal", {
  sp = "orange",
  undercurl = true,
  cterm = { underline = true },
})

vim.opt.list = false
vim.opt.conceallevel = 2
vim.opt.spell = false
