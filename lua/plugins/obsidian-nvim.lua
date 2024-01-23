return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above commented line with below if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/ObsVaults/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/ObsVaults/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "BrenDev",
        path = "~/ObsVaults/BrenDev/",
      },
      {
        name = "ThriveNotes",
        path = "~/ObsVaults/ThriveNotes/",
      },
    },
    note_id_func = function(title)
      -- Create new note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,
      -- stylua: ignore
    mappings = {
      ["ow"] = {
        -- TODO: export / import as util for readability connect telekasten switch too?
        action = function()
          local workspaceNames = { bd = 'BrenDev', brendev = 'BrenDev', tw = 'ThriveNotes', ThriveNotes = 'ThriveNotes'}
          local input = vim.fn.input({prompt = "Obsidian Workspace:"})
            if (workspaceNames[input] == nil) then
                 vim.notify(input .. 'does not map to an Obsidian workspace')
                 return nil
            end
          vim.cmd("ObsidianWorkspace " .. workspaceNames[input] )
        end,
          -- vim.cmd("ObsidianWorkspace") end,
        opts = { buffer = true, desc = "Obsidian Workspace" },
      },
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function() return require("obsidian").util.gf_passthrough() end,
        opts = { noremap = false, expr = true, buffer = true, desc = "go to file" },
      },
      -- follow link in nvim > obsidian UI also follows
      ["gF"] = {
        action = function() vim.cmd("ObsidianOpen") return require("obsidian").util.gf_passthrough() end,
        opts = { noremap = false, expr = true, buffer = true, desc = "go to file +ui" },
      },
      ["<leader>oo"] = {
        action = function() vim.cmd("ObsidianOpen") end,
        opts = { buffer = true, desc = "ObsidianOpen (UI)" },
      },
      ["<leader>on"] = {
        action = function() vim.cmd("ObsidianNew") end,
        opts = { buffer = true, desc = "ObsidianNew" },
      },
      ["<leader>od"] = { action = function() vim.cmd("ObsidianToday") end,
        opts = { buffer = true, desc = "Obsidian to[d]ay" },
      },
      ["<leader>om"] = { action = function() vim.cmd("ObsidianTomorrow") end,
        opts = { buffer = true, desc = "Obsidian to[m]orrow" },
      },
      ["<leader>oy"] = { action = function() vim.cmd("ObsidianYesterday") end,
        opts = { buffer = true, desc = "Obsidian [y]esterday" },
      },
      ["<leader>or"] = { action = function() vim.cmd("ObsidianRename") end,
        opts = { buffer = true, desc = "ObsidianRename" },
      },
      ["<leader>ot"] = { action = function() vim.cmd("ObsidianTemplate") end,
        opts = { buffer = true, desc = "ObsidanTemplate" },
      },
      ["<leader>op"] = { action = function() vim.cmd("ObsidianPasteImg") end,
        opts = { buffer = true, desc = "paste image" },
      },
      ["<leader>ob"] = { action = function() vim.cmd("ObsidianBacklinks") end,
        opts = { buffer = true, desc = "backlinks" },
      },
          -- Run the ObsidianLink command
      ["<leader>ol"] = { action = function() vim.cmd("normal! viw<Esc>") vim.cmd("ObsidianLink") end,
        opts = { buffer = true, desc = "Link Existing" },
      },
      ["<leader>oL"] = {
        action = function() vim.cmd("normal! viw<Esc>") vim.cmd("ObsidianLinkNew") end,
        opts = { buffer = true, desc = "Link new" },
      },
      ["<leader>os"] = { action = function() vim.cmd("ObsidianSearch") end,
        opts = { buffer = true, desc = "ObsidianSearch" },
      },
      -- Toggle check-boxes.
      ["<leader>oc"] = { action = function() return require("obsidian").util.toggle_checkbox() end,
        opts = { buffer = true },
      },
    },
  },
}
