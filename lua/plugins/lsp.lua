local helpers = require("../helpers/lsp")

return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "marksman",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- Disables the inline 'ghost text'
        underline = true, -- Underlines the text with errors or warnings
        update_in_insert = false, -- Updates diagnostics in insert mode (set to true or false as per your preference)
        severity_sort = true, -- Sorts diagnostics by severity
        float = {
          source = "always", -- Shows the source of the diagnostic in the floating window
          border = "rounded", -- Sets the style of the border (e.g., "single", "double", "rounded", "solid", or "shadow")
          header = "", -- Header text for the floating window (set to "" to disable)
          prefix = "", -- Prefix for each diagnostic in the floating window
        },
      },
      servers = {
        tailwindcss = {
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  { "Variants \\=([^;]*);", '"([^"]*)"' },
                  { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                  { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                  { "([a-zA-Z0-9\\-:]+)" },
                },
              },
            },
          },
        },
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "gd",
        helpers.goToDefinition,
        { desc = "Goto Definition" },
      }
    end,
  },
}
