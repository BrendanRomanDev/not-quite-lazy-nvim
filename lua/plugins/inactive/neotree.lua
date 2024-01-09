return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  keys = {
    { "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    { "<leader>E", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      commands = {
        copy_filepath_opts = function(state)
          local node = state.tree:get_node()
          local filepath = node:get_id()
          local filename = node.name
          local modify = vim.fn.fnamemodify

          local results = {
            filepath,
            modify(filepath, ":."),
            modify(filepath, ":~"),
            filename,
            modify(filename, ":r"),
            modify(filename, ":e"),
          }

          local i = vim.fn.inputlist({
            "Choose to copy to clipboard:",
            "1. Absolute path: " .. results[1],
            "2. Path relative to CWD: " .. results[2],
            "3. Path relative to HOME: " .. results[3],
            "4. Filename: " .. results[4],
            "5. Filename without extension: " .. results[5],
            "6. Extension of the filename: " .. results[6],
          })

          if i > 0 then
            local result = results[i]
            if not result then
              return print("Invalid choice: " .. i)
            end
            vim.fn.setreg("*", result)
            vim.notify("Copied: " .. result)
          end
        end,
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
