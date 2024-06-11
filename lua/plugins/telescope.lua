local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fF", Util.pick("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", Util.pick("files", { cwd = false }), desc = "Find Files (cwd)" },
  },
  opts = {
    defaults = {
      path_display = { shorten = 5, truncate = 5, "smart" },
      file_ignore_patterns = { ".git/", "node_modules" },
    },
  },
}
