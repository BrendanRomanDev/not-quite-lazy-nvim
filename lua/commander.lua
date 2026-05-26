-- Commander: a layered modal launcher for non-Neovim hotkeys.
--
-- Press <leader>; to open. Then:
--   1 -> WezTerm pane/tab actions   (via `wezterm cli`)
--   2 -> Yabai layout actions       (via `yabai -m ...`)
--   3 -> Display & space movement   (via `yabai -m ...`)
--
-- Each submenu shows a boxed floating window. Press a single key to fire the
-- action and close the modal. Esc, q, or <BS> exit / step back.

local M = {}

local function sh(cmd)
  return function()
    vim.system({ "/bin/sh", "-c", cmd }, { detach = true })
  end
end

local function wez(args)
  return function()
    vim.system({ "/bin/sh", "-c", "/opt/homebrew/bin/wezterm cli " .. args }, { detach = true })
  end
end

local menus = {
  root = {
    title = "Commander",
    items = {
      { key = "1", label = "WezTerm: panes & tabs",  submenu = "wez" },
      { key = "2", label = "Yabai: layout",          submenu = "yabai" },
      { key = "3", label = "Display: move windows",  submenu = "display" },
    },
  },
  wez = {
    title = "WezTerm",
    items = {
      -- WezTerm global chords come from ~/.dotfiles/wezterm.lua (CTRL+CMD = ⌃⌘)
      { key = "b", chord = "⌃⌘ b",  label = "split horizontal",       action = wez("split-pane --horizontal") },
      { key = "u", chord = "⌃⌘ u",  label = "split vertical",         action = wez("split-pane") },
      { key = "x", chord = "⌃⌘ -",  label = "close current pane",     action = wez("kill-pane") },
      { key = "n", chord = "⌃⌘ n",  label = "next pane",              action = wez("activate-pane-direction Next") },
      { key = "p", chord = "⌃⌘ p",  label = "previous pane",          action = wez("activate-pane-direction Prev") },
      { key = "h", chord = "⌃⌘ h",  label = "resize / focus left",    action = wez("activate-pane-direction Left") },
      { key = "j", chord = "⌃⌘ j",  label = "resize / focus down",    action = wez("activate-pane-direction Down") },
      { key = "k", chord = "⌃⌘ k",  label = "resize / focus up",      action = wez("activate-pane-direction Up") },
      { key = "l", chord = "⌃⌘ l",  label = "resize / focus right",   action = wez("activate-pane-direction Right") },
      { key = "t", chord = "⌘ T",   label = "new tab",                action = wez("spawn") },
    },
  },
  yabai = {
    title = "Yabai",
    items = {
      -- Yabai/skhd global chords come from ~/.dotfiles/skhdrc (⇧⌥ = shift+alt, ⌃⌥ = ctrl+alt)
      { key = "r", chord = "⇧⌥ r",  label = "rotate space 270",       action = sh("yabai -m space --rotate 270") },
      { key = "y", chord = "⇧⌥ y",  label = "mirror y-axis",          action = sh("yabai -m space --mirror y-axis") },
      { key = "x", chord = "⇧⌥ x",  label = "mirror x-axis",          action = sh("yabai -m space --mirror x-axis") },
      { key = "e", chord = "⇧⌥ e",  label = "balance windows",        action = sh("yabai -m space --balance") },
      { key = "m", chord = "⇧⌥ m",  label = "toggle zoom-fullscreen", action = sh("yabai -m window --toggle zoom-fullscreen") },
      { key = "t", chord = "⇧⌥ t",  label = "toggle float (centered)",action = sh("yabai -m window --toggle float --grid 4:4:1:1:2:2") },
      { key = "h", chord = "⇧⌥ h",  label = "swap window west",       action = sh("yabai -m window --swap west") },
      { key = "j", chord = "⇧⌥ j",  label = "swap window south",      action = sh("yabai -m window --swap south") },
      { key = "k", chord = "⇧⌥ k",  label = "swap window north",      action = sh("yabai -m window --swap north") },
      { key = "l", chord = "⇧⌥ l",  label = "swap window east",       action = sh("yabai -m window --swap east") },
      { key = "H", chord = "⌃⌥ h",  label = "warp window west",       action = sh("yabai -m window --warp west") },
      { key = "J", chord = "⌃⌥ j",  label = "warp window south",      action = sh("yabai -m window --warp south") },
      { key = "K", chord = "⌃⌥ k",  label = "warp window north",      action = sh("yabai -m window --warp north") },
      { key = "L", chord = "⌃⌥ l",  label = "warp window east",       action = sh("yabai -m window --warp east") },
    },
  },
  display = {
    title = "Display & spaces",
    items = {
      -- Display & space chords from ~/.dotfiles/skhdrc (⌥ = alt alone, ⇧⌥ = shift+alt)
      { key = "u", chord = "⌥ u",   label = "focus display west",          action = sh("yabai -m display --focus west") },
      { key = "i", chord = "⌥ i",   label = "focus display east",          action = sh("yabai -m display --focus east") },
      { key = "U", chord = "⇧⌥ u",  label = "move window to west display", action = sh("yabai -m window --display west; yabai -m display --focus west") },
      { key = "I", chord = "⇧⌥ i",  label = "move window to east display", action = sh("yabai -m window --display east; yabai -m display --focus east") },
      { key = "p", chord = "⇧⌥ p",  label = "send window to prev space",   action = sh("yabai -m window --space prev") },
      { key = "n", chord = "⇧⌥ n",  label = "send window to next space",   action = sh("yabai -m window --space next") },
      { key = "1", chord = "⇧⌥ 1",  label = "send window to space 1",      action = sh("yabai -m window --space 1") },
      { key = "2", chord = "⇧⌥ 2",  label = "send window to space 2",      action = sh("yabai -m window --space 2") },
      { key = "3", chord = "⇧⌥ 3",  label = "send window to space 3",      action = sh("yabai -m window --space 3") },
      { key = "4", chord = "⇧⌥ 4",  label = "send window to space 4",      action = sh("yabai -m window --space 4") },
      { key = "5", chord = "⇧⌥ 5",  label = "send window to space 5",      action = sh("yabai -m window --space 5") },
      { key = "6", chord = "⇧⌥ 6",  label = "send window to space 6",      action = sh("yabai -m window --space 6") },
      { key = "7", chord = "⇧⌥ 7",  label = "send window to space 7",      action = sh("yabai -m window --space 7") },
    },
  },
}

-- Display-cell width (handles multi-byte glyphs like ⌃⌘).
local function dwidth(s) return vim.fn.strdisplaywidth(s) end

-- Pad `s` on the right with spaces to reach `n` display cells.
local function rpad(s, n)
  local pad = n - dwidth(s)
  if pad <= 0 then return s end
  return s .. string.rep(" ", pad)
end

-- Build lines for `menu` plus the column ranges (in bytes) used for highlighting.
-- Returns: lines, width, layout = { key_col, label_col, chord_col, chord_width }
-- where *_col is the starting byte index of each column on an item line.
local function render_lines(menu)
  local max_label = 0
  local max_chord = 0
  for _, item in ipairs(menu.items) do
    if dwidth(item.label) > max_label then max_label = dwidth(item.label) end
    if item.chord and dwidth(item.chord) > max_chord then max_chord = dwidth(item.chord) end
  end

  -- Layout: "  K  <label padded>   <chord>"
  --         ^^  ^                  ^
  --        gut key gut    label-col   gap   chord-col
  local left_gutter = 2  -- "  "
  local key_width = 1
  local key_gap = 2      -- "  " between key and label
  local label_gap = 3    -- "   " between label and chord
  local key_col_byte = left_gutter + 1                              -- 1-indexed display, byte = 3
  local label_col_byte = left_gutter + key_width + key_gap + 1      -- byte = 6
  local chord_col_display = left_gutter + key_width + key_gap + max_label + label_gap

  local lines = {}
  for _, item in ipairs(menu.items) do
    local left  = string.format("  %s  %s", item.key, rpad(item.label, max_label))
    local chord = item.chord or ""
    lines[#lines + 1] = left .. string.rep(" ", label_gap) .. chord
  end
  lines[#lines + 1] = ""
  lines[#lines + 1] = "  ESC / q  quit     BS  back"

  -- Total display width: gutter + key + gap + label + gap + chord + right padding
  local content_width = left_gutter + key_width + key_gap + max_label + label_gap + max_chord + 2
  if content_width < dwidth(menu.title) + 4 then content_width = dwidth(menu.title) + 4 end
  if content_width < 36 then content_width = 36 end

  return lines, content_width, {
    key_byte = left_gutter,        -- byte offset where key starts (0-indexed)
    chord_display = chord_col_display,  -- display column where chord starts
  }
end

local state = { win = nil, buf = nil }

local function close()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
  end
  state = { win = nil, buf = nil }
end

local function open(menu_name)
  close()
  local menu = menus[menu_name]
  if not menu then return end

  local lines, content_width, layout = render_lines(menu)
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].filetype = "commander"

  local ui = vim.api.nvim_list_uis()[1]
  local height = #lines
  local width = content_width
  local row = math.floor((ui.height - height) / 2) - 1
  local col = math.floor((ui.width - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    title = " " .. menu.title .. " ",
    title_pos = "left",
    noautocmd = true,
  })

  vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,FloatTitle:FloatTitle"
  vim.wo[win].cursorline = false

  local ns = vim.api.nvim_create_namespace("commander_keys")
  for i, item in ipairs(menu.items) do
    -- Highlight the modal key (single char at byte offset = left_gutter).
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", i - 1, layout.key_byte, layout.key_byte + #item.key)
    -- Dim the chord column. Need byte offset for the chord; computed by walking
    -- the line until we hit the chord_display column.
    if item.chord and item.chord ~= "" then
      local line = lines[i]
      -- Find byte offset where chord begins by trimming trailing display width.
      local chord_bytes = #item.chord
      local chord_byte_start = #line - chord_bytes
      vim.api.nvim_buf_add_highlight(buf, ns, "Comment", i - 1, chord_byte_start, -1)
    end
  end
  -- Dim the trailing help line.
  vim.api.nvim_buf_add_highlight(buf, ns, "Comment", #lines - 1, 0, -1)

  state = { win = win, buf = buf }

  local function map(key, fn)
    vim.keymap.set("n", key, fn, { buffer = buf, nowait = true, silent = true })
  end

  for _, item in ipairs(menu.items) do
    map(item.key, function()
      if item.submenu then
        open(item.submenu)
      elseif item.action then
        close()
        item.action()
      end
    end)
  end
  map("<Esc>", close)
  map("q", close)
  if menu_name ~= "root" then
    map("<BS>", function() open("root") end)
  end
end

function M.toggle()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    close()
  else
    open("root")
  end
end

function M.setup()
  vim.keymap.set("n", "<leader>;", M.toggle, {
    desc = "Commander: window/pane/space launcher",
    silent = true,
  })
  vim.api.nvim_create_user_command("Commander", M.toggle, { desc = "Open commander modal" })
end

return M
