-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
-- }
--

return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}

-- return {
--   -- add gruvbox
--   { "ellisonleao/gruvbox.nvim" },
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
--
-- return {
--   "fynnfluegge/monet.nvim",
--   name = "monet",
--   opts = {
--     transparent_background = true,
--     styles = {
--       sidebars = "transparent",
--       floats = "transparent",
--     },
--   },
-- }

-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = true,
--   priority = 1000,
--   opts = function()
--     return {
--       transparent = true,
--       styles = {
--         sidebars = "transparent",
--         floats = "transparent",
--       },
--       floats = "transparent",
--       sidebars = { "qf", "help", "terminal" },
--       lualine_bold = true,
--       on_highlights = function(hl, c)
--         hl.NormalNC = { guibg = c.transparent, ctermbg = c.transparent }
--         hl.Normal = { guibg = c.transparent, ctermbg = c.transparent }
--         hl.NormalFloat = { guibg = c.transparent, ctermbg = c.transparent }
--         hl.TelescopeNormal = { bg = c.transparent }
--         hl.TelescopePromptNormal = { bg = c.transparent }
--         hl.TelescopeTitle = { bg = c.transparent }
--         hl.TelescopeBorder = { bg = c.transparent }
--         hl.NeoTreeNormal = { bg = c.transparent, ctermbg = c.transparent }
--         hl.NeoTreeNormalNC = { bg = c.transparent, ctermbg = c.transparent }
--       end,
--     }
--   end,
-- }
