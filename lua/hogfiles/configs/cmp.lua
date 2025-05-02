
-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect", }
vim.opt.shortmess:append("c")

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local opts = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
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
    { name = "luasnip" },
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
    ),
    ["<Tab>"] = cmp.mapping(
      function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end,
      { "i", "s" }
    ),
    ["<S-Tab>"] = cmp.mapping(
      function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      { "i", "s" }
    ),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
  },

  experimental = {
    ghost_text = true,
  }
}

cmp.setup(opts)

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

