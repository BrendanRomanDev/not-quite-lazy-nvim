local mdHelper = require("helpers.markdown")

return {
  -- claude code CLI integration
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    opts = {
      terminal = {
        split_side = "right",
        split_width_percentage = 0.35,
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>a",  nil,                              desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>",             desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",        desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",    desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>",  desc = "Continue Claude" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",        desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",         mode = "v", desc = "Send selection" },
      { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",      desc = "Add file (tree)", ft = { "neo-tree" } },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",   desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",     desc = "Reject diff" },
    },
  },

  -- live server for web dev
  {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop" },
    keys = {
      { "<leader>lu", "<cmd>LiveServerStart<cr>", desc = "Live Server Up" },
      { "<leader>ld", "<cmd>LiveServerStop<cr>", desc = "Live Server Down" },
    },
    opts = {},
  },

  -- obsidian vault integration
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/Notes/**.md",
      "BufNewFile " .. vim.fn.expand("~") .. "/Notes/**.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      workspaces = {
        {
          name = "BrenDev",
          path = "~/Notes/BrenDev/",
        },
        {
          name = "ThriveNotes",
          path = "~/Notes/ThriveNotes/",
        },
      },
      detect_cwd = true,
      daily_notes = {
        folder = "/dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = "daily.md",
      },
      templates = {
        subdir = "templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
        substitutions = {},
      },
      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return suffix
      end,
      -- stylua: ignore
      mappings = {
        ["gf"] = {
          action = function() return require("obsidian").util.gf_passthrough() end,
          opts = { noremap = false, expr = true, buffer = true, desc = "go to file" },
        },
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
        ["<leader>od"] = {
          action = function() vim.cmd("ObsidianToday") end,
          opts = { buffer = true, desc = "Obsidian to[d]ay" },
        },
        ["<leader>om"] = {
          action = function() vim.cmd("ObsidianTomorrow") end,
          opts = { buffer = true, desc = "Obsidian to[m]orrow" },
        },
        ["<leader>oy"] = {
          action = function() vim.cmd("ObsidianYesterday") end,
          opts = { buffer = true, desc = "Obsidian [y]esterday" },
        },
        ["<leader>or"] = {
          action = function() vim.cmd("ObsidianRename") end,
          opts = { buffer = true, desc = "ObsidianRename" },
        },
        ["<leader>ot"] = {
          action = function() vim.cmd("ObsidianTemplate") end,
          opts = { buffer = true, desc = "ObsidanTemplate" },
        },
        ["<leader>op"] = {
          action = function() vim.cmd("ObsidianPasteImg") end,
          opts = { buffer = true, desc = "paste image" },
        },
        ["<leader>ob"] = {
          action = function() vim.cmd("ObsidianBacklinks") end,
          opts = { buffer = true, desc = "backlinks" },
        },
        ["<leader>ol"] = {
          action = function() vim.cmd("normal! viw<Esc>") vim.cmd("ObsidianLink") end,
          opts = { buffer = true, desc = "Link Existing" },
        },
        ["<leader>oL"] = {
          action = function() vim.cmd("normal! viw<Esc>") vim.cmd("ObsidianLinkNew") end,
          opts = { buffer = true, desc = "Link new" },
        },
        ["<leader>os"] = {
          action = function() vim.cmd("ObsidianSearch") end,
          opts = { buffer = true, desc = "ObsidianSearch" },
        },
        ["<leader>ov"] = {
          action = mdHelper.promptObsidianWorkspace,
          opts = { buffer = true, desc = "Obsidian Vault" },
        },
        ["<leader>oh"] = {
          action = mdHelper.promptObsidianTags,
          opts = { buffer = true, desc = "ObsidianTags" },
        },
        ["<leader>oc"] = {
          action = function() return require("obsidian").util.toggle_checkbox() end,
          opts = { buffer = true },
        },
      },
    },
  },

  -- tailwind class folding
  {
    "razak17/tailwind-fold.nvim",
    opts = {},
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
}
