-- Signs
-- sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
-- sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
-- sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})


vim.diagnostic.config({
  virtual_text = {
    prefix = " ",
    spacing = 2,
    source = "if_many",
    format = nil,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN]  = ' ',
      [vim.diagnostic.severity.INFO]  = ' ',
      [vim.diagnostic.severity.HINT]  = ' ',
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN]  = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.INFO]  = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.HINT]  = 'DiagnosticSignHint',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN]  = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.INFO]  = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.HINT]  = 'DiagnosticSignHint',
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
