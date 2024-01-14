return {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>l"] = { name = "+lazy" },
      -- which-key needs an initial 'key' to set the leader prefix, then others will still work
      ["<leader>o"] = { name = "+obsidian", c = "toggle checkbox" },
    },
  },
}
