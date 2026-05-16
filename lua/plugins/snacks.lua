-- https://github.com/folke/snacks.nvim?tab=readme-ov-file#-usage
local logo = [[
░█▀▀▄░█▀▀▄░█▀▀░█▀▀▄░█▀▄░█▀▀░▄░░░▄
░█▀▀▄░█▄▄▀░█▀▀░█░▒█░█░█░█▀▀░░█▄█░
░▀▀▀▀░▀░▀▀░▀▀▀░▀░░▀░▀▀░░▀▀▀░░░▀░░
]]

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
    dashboard = {
      width = 64,
      preset = {
        header = logo,
      },
      sections = {
        { section = "header", padding = 1 },
        {
          pane = 1,
          section = "keys",
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "r", desc = "Recent Files",    action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "g", desc = "Grep Text",       action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "󰈔 ", key = "n", desc = "New File",        action = ":ene | startinsert" },
            { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
            { icon = "󰒲 ", key = "l", desc = "Lazy",            action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit",             action = ":qa" },
          },
          padding = 1,
        },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
