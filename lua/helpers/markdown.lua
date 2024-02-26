local M = {}

local workspaceAliases = {
  bd = "BrenDev",
  brendev = "BrenDev",
  tw = "ThriveNotes",
  tn = "ThriveNotes",
  thrivenotes = "ThriveNotes",
}

M.promptObsidianWorkspace = function()
  local input = vim.fn.input({ prompt = "Obsidian Vault:" })
  if workspaceAliases[input] == nil then
    vim.notify(input .. " does not map to a valid Obsidian Vault")
    return nil
  end
  vim.cmd("ObsidianWorkspace " .. workspaceAliases[input])
end

M.promptObsidianTags = function()
  local input = vim.fn.input({ prompt = "Obsidian Tag:" })
  vim.cmd("ObsidianWorkspace " .. "#" .. input)
end

return M
