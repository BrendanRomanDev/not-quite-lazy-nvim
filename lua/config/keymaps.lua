local Util = require("lazyvim.util")
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--
---- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local keymap = vim.keymap.set
local keydel = vim.keymap.del

local opts = {
  noremap = true,
  silent = true,
}

-- formatting
keymap({ "n", "v" }, "<leader>lf", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- create a copy rel path cmd for use in neotree (or anywhere else)
vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

--  default lazy keymap conflicts with format, make it <leader>ll instead
keydel("n", "<leader>l", opts)
keymap("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Neovim makes <Esc>[j|K] emulate <Alt-[j|k]> for some reason, which causes line
-- swapping for some reason, which causes line swapping.
-- Unmap <Alt-[j|k]>
keymap("n", "<A-j>", "<Nop>", opts)
keymap("n", "<A-k>", "<Nop>", opts)
keymap("x", "<A-j>", "<Nop>", opts)
keymap("x", "<A-j>", "<Nop>", opts)

-- clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- do not yank with x key
keymap("n", "x", '"_x')

-- Select All
keymap("n", "<C-a>", "gg<S-v>G")

-- Move text up and down
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
