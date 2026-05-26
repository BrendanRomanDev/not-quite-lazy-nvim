local logo = [[
░█▀▀▄░█▀▀▄░█▀▀░█▀▀▄░█▀▄░█▀▀░▄░░░▄
░█▀▀▄░█▄▄▀░█▀▀░█░▒█░█░█░█▀▀░░█▄█░
░▀▀▀▀░▀░▀▀░▀▀▀░▀░░▀░▀▀░░▀▀▀░░░▀░░
]]

return {
  -- snacks: notifications + dashboard
  {
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
  },

  -- buffer tabs with harpoon mark numbers
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        numbers = function(number_opts)
          local harpoon = require("harpoon")
          local list = harpoon:list()
          local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
          for i, item in ipairs(list.items) do
            if item.value == buf_name then
              return i
            end
          end
          return nil
        end,
      },
    },
  },

  -- noice: UI enhancements for messages, cmdline, popups
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },

  -- scrollbar
  { "petertriho/nvim-scrollbar", opts = {} },

  -- which-key: keybinding help
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- groups
        { "<leader>a", group = "ai/claude" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lazy/+liveserver" },
        { "<leader>o", group = "obsidian" },
        { "<leader>y", group = "harpoon" },
        { "<leader>z", group = "telekasten" },
      },
    },
  },

  -- disable nvim-cmp (replaced by blink.cmp)
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-emoji", enabled = false },
  { "roobert/tailwindcss-colorizer-cmp.nvim", enabled = false },
}
