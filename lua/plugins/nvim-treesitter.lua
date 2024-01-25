return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    opts.ensure_installed = {
      -- .md issue
      -- https://www.reddit.com/r/neovim/comments/vr9m43/comment/ieur3oj/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
      -- markdown_inline handles bold / italics showing in terminal. Does not
      -- does not handle code fence highlighting.
      "markdown_inline",
      -- markdown overrides markdown_inline, toggled ON when file loads.
      -- handles link conceal, code fence language syntax highlighting
      -- Does NOT handle bold / italics in terminal.
      -- <leader>uT on file load will toggle 'markdown' off of tree_sitter, so
      -- markdown_inline will run on bold / italics. But code fences adn
      "markdown",
    }

    -- parse env files as 'sh'
    vim.filetype.add({
      extension = { sh = "dotenv" },
      filename = {
        [".env"] = "dotenv",
        ["env"] = "dotenv",
      },
      pattern = {
        -- INFO: Match filenames like - ".env.example", ".env.local" and so on
        ["%.env%.[%w_.-]+"] = "sh",
      },
    })
  end,
}
