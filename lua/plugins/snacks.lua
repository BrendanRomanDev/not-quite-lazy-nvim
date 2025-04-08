-- https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
      timeout = 3000,
      top_down = false,
    },
  },
}
