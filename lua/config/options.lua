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
vim.api.nvim_set_hl(0, "Headline1", { fg = "#cb7676", bg = "#402626", italic = false })
vim.api.nvim_set_hl(0, "Headline2", { fg = "#c99076", bg = "#66493c", italic = false })
vim.api.nvim_set_hl(0, "Headline3", { fg = "#80a665", bg = "#3d4f2f", italic = false })
vim.api.nvim_set_hl(0, "Headline4", { fg = "#4c9a91", bg = "#224541", italic = false })
vim.api.nvim_set_hl(0, "Headline5", { fg = "#6893bf", bg = "#2b3d4f", italic = false })
vim.api.nvim_set_hl(0, "Headline6", { fg = "#d3869b", bg = "#6b454f", italic = false })

vim.opt.list = false
vim.opt.conceallevel = 2
