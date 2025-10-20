return {
  {
    "nvim-mini/mini.animate",
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
  },
  {
    "nvim-mini/mini.bufremove",
    keys = {
      {
        "<S-q>",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
      { "<leader>bd", false },
    },
    opts = {},
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "yf",
        find_left = "yF",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
      search_method = "cover_or_next",
    },
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
}
