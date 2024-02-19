return {
  "dpayne/CodeGPT.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("codegpt.config")
    vim.g["codegpt_commands"] = {
      ["explain"] = {
        callback_type = "code_popup",
      },
    }
  end,
}
