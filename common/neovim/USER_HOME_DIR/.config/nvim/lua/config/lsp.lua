require("mason-lspconfig").setup()
require("lspconfig").clangd.setup({})

require("lspconfig").denols.setup({
	init_options = {
		lint = true,
		unstable = true,
	},
	root_dir = require("lspconfig").util.root_pattern(
		"package.json",
		"deno.json",
		"deno.jsonc",
		".deno.json",
		".deno.jsonc"
	),
})

require("conform").setup({
	formatters_by_ft = {
		typescript = { "deno_fmt" },
		javascript = { "deno_fmt" },
		json = { "deno_fmt" },
		jsonc = { "deno_fmt" },
	},
})
