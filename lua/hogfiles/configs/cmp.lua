
-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect", }
vim.opt.shortmess:append("c")

local cmp = require('cmp')
local lspkind = require('lspkind')

local opts = {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      elipsis_char = "...",
    })
  },

  completion = {
    completeopt = "menu,menuone,noselect",
  },

  performance = {
    max_view_entries = 10,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    { name = "cmdline" },
  },

  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehaviourInsert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehaviourInsert }),
    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm(
        {
          behaviour = cmp.SelectBehaviourInsert,
          select = true,
        }
      ),
      { "i", "c" }
    )
  }
}

cmp.setup(opts)
