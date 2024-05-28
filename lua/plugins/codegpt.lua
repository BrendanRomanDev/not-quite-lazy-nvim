return {
  "dpayne/CodeGPT.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("codegpt.config")
    vim.g["codegpt_global_commands_defaults"] = {
      model = "gpt-4o",
    }
  end,
}
