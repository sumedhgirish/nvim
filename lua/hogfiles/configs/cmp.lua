
-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect", }
vim.opt.shortmess:append("c")

local cmp = require('cmp')

local opts = {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
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
