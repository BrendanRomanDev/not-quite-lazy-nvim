return {
  "folke/which-key.nvim",
  opts = {
    -- plugins = {
    --   presets = {
    --     z = false,
    --   },
    -- },
    defaults = {
      ["<leader>l"] = { name = "+lazy/+liveserver", u = "Live Server Up", d = "Live Server Down" },
      ["<leader>z"] = { name = "+telekasten", n = "new note", t = "tag search" },
      -- which-key needs an initial  to set the leader prefix, then others will still work
      ["<leader>o"] = { name = "+obsidian", c = "toggle checkbox" },
    },
  },
}
