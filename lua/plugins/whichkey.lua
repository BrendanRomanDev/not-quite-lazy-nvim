return {
  "folke/which-key.nvim",
  opts = {
    -- plugins = {
    --   presets = {
    --     z = false,
    --   },
    -- },
    defaults = {
      ["<leader>l"] = { name = "+lazy" },
      -- which-key needs an initial 'key' to set the leader prefix, then others will still work
      ["<leader>o"] = { name = "+obsidian", c = "toggle checkbox" },
      ["<leader>z"] = { name = "+telekasten", n = "new note" },
    },
  },
}
