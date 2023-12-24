local logo = [[
░█▀▀▄░█▀▀▄░█▀▀░█▀▀▄░█▀▄░█▀▀░▄░░░▄
░█▀▀▄░█▄▄▀░█▀▀░█░▒█░█░█░█▀▀░░█▄█░
░▀▀▀▀░▀░▀▀░▀▀▀░▀░░▀░▀▀░░▀▀▀░░░▀░░
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      header = vim.split(logo, "\n"),
      center = {
        { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
        { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
        { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
        { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "g" },
        {
          action = [[lua require("lazyvim.util").telescope.config_files()()]],
          desc = " Config",
          icon = " ",
          key = "c",
        },
        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
        { action = "qa", desc = " Quit", icon = " ", key = "q" },
      },
    },
  },
}
