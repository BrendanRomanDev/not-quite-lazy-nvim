return {
  "folke/noice.nvim",
  opts = function(_, opts)
    -- add border to hoverdoc
    opts.presets.lsp_doc_border = true
    -- get rid of no info available messages
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
  end,
}
