return {
  "barrett-ruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop" },
  keys = {
    { "<leader>lu", "<cmd>LiveServerStart<cr>", { desc = "Live Server Up" } },
    { "<leader>ld", "<cmd>LiveServerStop<cr>", { desc = "Live Server Down" } },
  },
  opts = {},
}
