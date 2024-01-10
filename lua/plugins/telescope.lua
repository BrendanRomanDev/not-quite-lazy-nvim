local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fF", Util.telescope("files"), desc = "Find Files (root dir)" },
    { "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { ".git/", "node_modules" },
    },
  },
}
