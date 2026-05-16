-- blink.cmp is the active completion engine (via LazyVim v8+).
-- nvim-cmp and its ecosystem plugins are no longer used.
--
-- If you need to customize blink.cmp, configure it here:
-- https://github.com/Saghen/blink.cmp

return {
  -- disable nvim-cmp (replaced by blink.cmp)
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-emoji", enabled = false },
  { "roobert/tailwindcss-colorizer-cmp.nvim", enabled = false },
}
