local openai_key = os.getenv("OPENAI_API_KEY")

if not openai_key then
  vim.notify("OPENAI_API_KEY is not set in your environment", vim.log.levels.WARN)
end

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>ai",
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Toggle CodeCompanion Chat",
    },
    {
      "<leader>aI",
      ":CodeCompanion ",
      desc = "Run CodeCompanion Prompt",
      mode = "n",
    },
    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Run CodeCompanion Actions",
      mode = "n",
    },

    {
      "<leader>aa",
      "<cmd>CodeCompanionActions<cr>",
      desc = "Run CodeCompanion Actions",
      mode = "n",
    },
  },
  config = function()
    local codecompanion = require("codecompanion")
    local adapters = require("codecompanion.adapters")

    codecompanion.setup({
      adapters = {
        openai = adapters.extend("openai", {
          env = {
            api_key = openai_key,
          },
          schema = {
            model = {
              default = function()
                return "gpt-4o"
              end,
            },
          },
        }),
      },
      strategies = {
        inline = {
          adapter = "openai",
          keymaps = {
            accept_change = {
              modes = { n = "ga" },
              description = "Accept the suggested change",
            },
            reject_change = {
              modes = { n = "gr" },
              description = "Reject the suggested change",
            },
          },
        },
      },
    })
  end,
}
