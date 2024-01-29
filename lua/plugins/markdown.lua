--- borrowed from https://github.com/Alan-Kuan/nvim-config/blob/master/lua/plugins/markdown.lua
return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    cmd = "MarkdownPreview",
    ft = "markdown",
    event = "VeryLazy",
    init = function()
      vim.api.nvim_create_augroup("MD_Preview", { clear = true })
    end,
    config = function()
      vim.g.mkdp_page_title = "${name} - Preview"
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
  -- tag searching and zettlekasten workflow in telescope
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    commit = "8c2b3889eb31009ae510a43384d1957b37654176",
    -- stylua: ignore
      keys = {
			{ '<leader>zn', function() require('telekasten').new_note() end, { desc = "new note" } },
			{ '<leader>zN', function() require('telekasten').new_templated_note() end, { desc = "new templated note" } },
			{ '<leader>zf', function() require('telekasten').find_notes() end, { desc = "find notes" }  },
			{ '<leader>zg', function() require('telekasten').search_notes() end, { desc = 'search notes'} },
			{ '<leader>zo', function() require('telekasten').panel() end, { desc = "panel" } },
			{ '<leader>zt', function() require('telekasten').show_tags() end, { desc = "show tags" } },
			{ '<leader>zv', function() require('telekasten').switch_vault() end, { desc = "switch vault" } },
			{ '<leader>zd', function() require('telekasten').find_daily_notes() end, { desc = "find daily notes" } },
			{ '<leader>zb', function() require('telekasten').show_backlinks() end, { desc = "show backlinks" } },
			{ '<leader>zl', function() require('telekasten').find_friends() end, { desc = "find friends" }  },
			{ '<leader>zm', function() require('telekasten').browse_media() end, { desc = "browse media" } },
		},
    opts = {
      -- these next 2 do not work. You have to set them in the actual plugin
      -- folder, which is why you locked the commit
      auto_set_filetype = false,
      take_over_my_home = false,
      -- this is not documented by the plugin. You either must set a
      -- default_vault or one of your vaults must be named 'default'
      -- https://github.com/renerocksai/telekasten.nvim/blob/617469cd0690c84264f7d472cf1fe860ccfc0832/lua/telekasten.lua#L2804
      default_vault = "BrenDev",
      vaults = {
        BrenDev = {
          home = vim.fn.expand("~/ObsVaults/BrenDev"),
        },
        ThriveNotes = {
          home = vim.fn.expand("~/ObsVaults/ThriveNotes"),
        },
      },
    },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    opts = {
      mappings = {
        MkdnFoldSection = false,
        MkdnUnfoldSection = false,
        MkdnEnter = false,
      },
      to_do = { symbols = { " ", "⧖", "✓" } },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    event = "VeryLazy",
    config = function()
      require("headlines").setup({
        markdown = {
          query = vim.treesitter.query.parse(
            "markdown",
            [[
              (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
              ] @headline)

              (thematic_break) @dash

              (fenced_code_block) @codeblock

              (block_quote_marker) @quote
              (block_quote (paragraph (inline (block_continuation) @quote)))
            ]]
          ),
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          dash_string = "-",
          quote_highlight = "Quote",
          quote_string = "┃",
          fat_headlines = true,
          fat_headline_upper_string = " ",
          fat_headline_lower_string = " ",
        },
      })

      vim.api.nvim_set_hl(0, "Headline1", { fg = "#E6B450", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "Headline2", { fg = "#B4E650", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "Headline3", { fg = "#50E6C2", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "Headline4", { fg = "#5079E6", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "Headline5", { fg = "#A350E6", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "Headline6", { fg = "#E6507A", bg = "NONE", italic = false })
      vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#2E3440", italic = false })
    end,
  },
}
