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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function()
    vim.wo.spell = false
  end,
})

-- undo telekasten.nvim setting md filetype to telekasten
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "telekasten" },
  callback = function()
    vim.cmd("set filetype=markdown")
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

-- fix for harpoon to tie it ot buffers and prevent swap file issues
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function(_, list)
    for bufnr = 1, vim.fn.bufnr("$") do
      if vim.fn.buflisted(bufnr) == 1 then
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local item = nil
        for _, it in ipairs(list.items) do
          local value = it.value
          if value == bufname then
            item = it
            break
          end
        end
        if item then
          vim.api.nvim_set_current_buf(bufnr)
          local pos = vim.api.nvim_win_get_cursor(0)
          item.context.row = pos[1]
          item.context.col = pos[2]
        end
      end
    end
  end,
})
