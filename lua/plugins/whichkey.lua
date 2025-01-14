return {
  "folke/which-key.nvim",
  opts = {
    -- plugins = {
    --   presets = {
    --     z = false,
    --   },
    -- },
    spec = {
      { "<leader>l", group = "lazy/+liveserver" },
      { "<leader>ld", desc = "Live Server Down" },
      { "<leader>lu", desc = "Live Server Up" },
      { "<leader>o", group = "obsidian" },
      { "<leader>oc", desc = "toggle checkbox" },
      { "<leader>z", group = "telekasten" },
      { "<leader>zn", desc = "new note" },
      { "<leader>zt", desc = "tag search" },
    },
  },
}
