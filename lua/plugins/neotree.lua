return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      window = {
        mappings = {
          --  mapping over 'o' which will override the 'show help' and
          --  subsequent 'sort' mappings
          --  https://github.com/nvim-neo-tree/neo-tree.nvim/blob/77d9f484b88fd380386b46ed9206e5374d69d9d8/lua/neo-tree/defaults.lua#L544C3-L556C9
          ["o"] = "open",
          -- unmap the default sort options
          ["oc"] = "",
          ["od"] = "",
          ["og"] = "",
          ["om"] = "",
          ["on"] = "",
          ["os"] = "",
          ["ot"] = "",
          -- remap the sort options to work with 's' instead
          ["s"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "s" } },
          ["sc"] = { "order_by_created", nowait = false },
          ["sd"] = { "order_by_diagnostics", nowait = false },
          ["sg"] = { "order_by_git_status", nowait = false },
          ["sm"] = { "order_by_modified", nowait = false },
          ["sn"] = { "order_by_name", nowait = false },
          ["ss"] = { "order_by_size", nowait = false },
          ["st"] = { "order_by_type", nowait = false },
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
