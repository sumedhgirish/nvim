
local opts = {
  columns = {
    "icon",
    "size",
    "permissions"
  },
  win_options = {
    number = false,
  },
  skip_confirm_for_simple_edits = true,
  use_default_keymaps = false,
  keymaps = require("hogfiles.keymaps.oil"),
}

return opts
