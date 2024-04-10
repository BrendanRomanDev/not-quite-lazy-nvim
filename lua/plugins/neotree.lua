local helpers = require("../helpers/neotree")

return {
  "nvim-neo-tree/neo-tree.nvim",
  -- locking to tag until below issue is resolved
  -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1310
  -- tag = "3.14",
  keys = {
    { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      bind_to_cwd = true,
      commands = {
        copy_filepath_opts = helpers.copyFilePathOpts,
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
}
