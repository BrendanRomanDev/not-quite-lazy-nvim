return {
  "neovim/nvim-lspconfig",
  init = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change default formatting keymap (was <leader>cf)
    keys[#keys + 1] = { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>" }
  end,
}
