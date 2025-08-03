local handlers = {
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,

	["lua_ls"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,

	["clangd"] = function()
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({
			cmd = {
				"clangd",
				"--fallback-style=webkit",
			},
		})
	end,
}

local opts = {
	ensure_installed = { "lua_ls", "rust_analyzer", "basedpyright", "clangd" },
	handlers = handlers,
}

return opts
