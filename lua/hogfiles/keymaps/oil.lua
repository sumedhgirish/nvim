
local oil_maps = {
  ["g?"] = { "actions.show_help", mode = "n" },
  ["<CR>"] = "actions.select",
  ["gv"] = { "actions.select", opts = { vertical = true } },
  ["gh"] = { "actions.select", opts = { horizontal = true } },
  ["gt"] = { "actions.select", opts = { tab = true } },
  ["p"] = { "actions.preview", mode = "n" },
  ["<C-c>"] = { "actions.close", mode = "n" },
  ["<C-l>"] = "actions.refresh",
  ["-"] = { "actions.parent", mode = "n" },
  ["_"] = { "actions.open_cwd", mode = "n" },
  ["`"] = { "actions.cd", mode = "n" },
  ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
  ["gs"] = { "actions.change_sort", mode = "n" },
  ["gx"] = "actions.open_external",
  ["g."] = { "actions.toggle_hidden", mode = "n" },
  ["g\\"] = { "actions.toggle_trash", mode = "n" },
}

return oil_maps
