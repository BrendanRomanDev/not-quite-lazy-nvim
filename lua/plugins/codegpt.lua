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
    vim.g["codegpt_commands"] = {
      ["tests"] = {
        callback_type = "code_popup",
      },
      ["explain"] = {
        callback_type = "code_popup",
      },
    }
  end,
}
