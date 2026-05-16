local neotreeHelpers = require("helpers.neotree")

return {
  -- file navigation marks
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>Y",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>y",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },

  -- label-jump navigation
  {
    "folke/flash.nvim",
    enabled = true,
    opts = {
      modes = {
        -- disable flash in regular search to keep /? behavior normal
        search = { enabled = false },
        -- keep flash active for f/t/F/T motions
        char = { enabled = true },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },

  -- inline git blame
  {
    "f-person/git-blame.nvim",
    keys = { { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame Toggle" } },
    opts = {
      enabled = false,
    },
  },

  -- incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        bind_to_cwd = true,
        commands = {
          copy_filepath_opts = neotreeHelpers.copyFilePathOpts,
        },
        window = {
          mappings = {
            ["o"] = "open",
            ["oc"] = "",
            ["od"] = "",
            ["og"] = "",
            ["om"] = "",
            ["on"] = "",
            ["os"] = "",
            ["ot"] = "",
            ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
            ["sc"] = { "order_by_created", nowait = false },
            ["sd"] = { "order_by_diagnostics", nowait = false },
            ["sg"] = { "order_by_git_status", nowait = false },
            ["sm"] = { "order_by_modified", nowait = false },
            ["sn"] = { "order_by_name", nowait = false },
            ["ss"] = { "order_by_size", nowait = false },
            ["st"] = { "order_by_type", nowait = false },
            ["Y"] = { "copy_filepath_opts" },
          },
        },
      },
      window = {
        position = "right",
        mappings = {
          ["s"] = "",
          ["v"] = "open_vsplit",
          ["h"] = "open_split",
        },
      },
    },
  },
}
