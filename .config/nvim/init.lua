-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins & Configuration
require("lazy").setup({
	spec = {
		-- LazyVim base
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },

		-- Language packs
		{ import = "lazyvim.plugins.extras.lang.clojure" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "lazyvim.plugins.extras.lang.kotlin" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "lazyvim.plugins.extras.lang.rust" },

		-- UI & Tools
		{
			"rose-pine/neovim",
			name = "rose-pine",
			config = function()
				require("rose-pine").setup({ variant = "main" })
				vim.cmd("colorscheme rose-pine")
			end,
		},
		{
			"folke/snacks.nvim",
			opts = { picker = { hidden = true, sources = { files = { hidden = true } } } },
		},
		{
			"nvim-orgmode/orgmode",
			event = "VeryLazy",
			ft = { "org" },
			opts = {
				org_agenda_files = "~/org/**/*",
				org_default_notes_file = "~/org/refile.org",
			},
		},
		-- Prefer system/mise tools on PATH over Mason
		{ "mason-org/mason.nvim", opts = { PATH = "append" } },
		{
			"neovim/nvim-lspconfig",
			opts = {
				servers = {
					mise = {
						cmd = { "mise", "lsp" },
						filetypes = { "toml" },
						root_markers = { "mise.toml", ".mise.toml", "mise/config.toml", "mise/config.local.toml" },
					},
					clojure_lsp = {},
				},
			},
		},
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"netrwPlugin",
				"rplugin",
				"spellfile",
			},
		},
	},
})

-- Options
vim.opt.relativenumber = false

-- Terminal clipboard (OSC 52)
local osc52 = require("vim.ui.clipboard.osc52")
vim.g.clipboard = {
	name = "OSC 52",
	copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
	paste = {
		["+"] = function()
			return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
		end,
		["*"] = function()
			return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
		end,
	},
}

-- Keymaps
vim.keymap.set("n", "<A-x>", function()
	Snacks.picker.commands()
end, { desc = "Command Palette" })
vim.api.nvim_create_user_command("Wa", "wa", {})
