return {
	-- Commenting
	{
		"numToStr/Comment.nvim",
		opts = {},
	},
	-- TODO Comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		opts = { signs = false },
	},
	-- VS Code Copilot
	{
		"github/copilot.vim",
	},
	-- Flutter Tools
	{
		"akinsho/flutter-tools.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim",
		},
		config = function()
			require("flutter-tools").setup({})
		end,
	},
	-- LSP Config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local servers = {
				"pyright", -- Python
				"lua_ls", -- Lua
				"tsserver", -- JavaScript, TypeScript
				"cssls", -- CSS
				"html", -- HTML
				"jsonls", -- JSON
				"bashls", -- Bash
				"yamlls", -- YAML
				"marksman", -- Markdown,
				"graphql", -- GraphQL
			}

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})

			local lspconfig = require("lspconfig")

			for _, server in ipairs(servers) do
				lspconfig[server].setup({})
			end
		end,
	},
	-- LSP UI Enhancements
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({})
		end,
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	-- Formatting and Linting
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
				},
			})
		end,
	},
	-- Conform for formatting
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				-- Setup conform with the desired formatters
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					dart = { "dart_format" },
          graphql = { "prettier" },
				},
			})
		end,
	},
	-- Treesitter for better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"graphql",
					"python",
					"lua",
					"javascript",
					"typescript",
					"css",
					"scss",
					"markdown",
					"dart",
				},
				highlight = {
					enable = true,
				},
			})
		end,
	},
}
