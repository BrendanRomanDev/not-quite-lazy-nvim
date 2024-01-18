return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- open harpoon marks in bufferline tabs
      numbers = function(number_opts)
        local harpoon = require("harpoon.mark")
        local buf_name = vim.api.nvim_buf_get_name(number_opts.id)
        local harpoon_mark = harpoon.get_index_of(buf_name)
        return harpoon_mark
      end,
    },
  },
}
