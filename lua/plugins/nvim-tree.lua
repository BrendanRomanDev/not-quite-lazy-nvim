function ToggleSize()
  local defaultWidth = 42
  local status_ok, view = pcall(require, "nvim-tree.view")

  if not status_ok then
    return
  end
  local width = view.View.width
  if width > defaultWidth then
    view.resize(defaultWidth)
  else
    view.resize(80)
  end
end

return {
  -- disabled neotree default lazyvim plugin. See full spec in ./inactive/neotree.lua
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
      {
        "<leader>t",
        ToggleSize,
        desc = "Toggle NvimTree Adaptive Size",
      },
    },
    opts = {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        adaptive_size = false,
        width = 42,
        side = "right",
      },
    },
  },
}
