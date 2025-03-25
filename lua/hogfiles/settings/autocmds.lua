-- Signs
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

local lsp_signs = {
  Error = ' ',
  Warn = ' ',
  Info = ' ',
  Hint = ' ',
}

for type, icon in pairs(lsp_signs) do
  local hl = "DiagnosticSign" .. type
  sign(hl, { text=icon, texthl=hl, numhl=hl } )
end

vim.diagnostic.config({
  virtual_text = {
    prefix = " ",
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
