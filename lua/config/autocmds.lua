-- turn off paste mode when leaving InsertMode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- fix conceal level for json files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- prevent the annoying leader spaces and comment continuations
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd("set formatoptions-=cro")
  end,
})

-- highlight the yanked work for 400ms before timing out
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 400 })
  end,
})
