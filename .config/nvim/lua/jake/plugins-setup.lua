-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
local leet_arg = "leetcode.nvim"
-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
		{ 
			"nvim-telescope/telescope-fzf-native.nvim", 
			build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
		},

		{ "mellow-theme/mellow.nvim" },
		-- Prerequisite for many plugins.
		{ "nvim-lua/plenary.nvim" },

		-- Colorschemes
		-- { "bluz71/vim-nightfly-guicolors" },
		-- { "sainnhe/everforest" },
		{ "projekt0n/github-nvim-theme", name = "github-theme" },
		--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		-- { "sainnhe/gruvbox-material" },
		-- { "sainnhe/edge" },
		-- { "rebelot/kanagawa.nvim" },
		-- { "mellow-theme/mellow.nvim" },

		-- tmux & split window navigation
		{ "christoomey/vim-tmux-navigator" },

		-- Maximize current pane
		{ "szw/vim-maximizer" },

		-- Surround lines or words with characters, html tags
		{ "tpope/vim-surround" },

		{ "vim-scripts/ReplaceWithRegister" },

		-- Comment out using vim motions
		{ "numToStr/Comment.nvim" },

		{ "nvim-tree/nvim-tree.lua" },

		-- icons for files of different types
		{ "kyazdani42/nvim-web-devicons" },
		{ "echasnovski/mini.icons" },
		-- Adds visual bar at the bottom of the screen
		{ "nvim-lualine/lualine.nvim" },

		-- fuzzy finding
		
		-- autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },

		-- snippets
		--		{"L3MON4D3/LuaSnip"},
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },

		-- managing and installing lsp servers
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- configuring lsp servers
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{
			{
				"glepnir/lspsaga.nvim",
				branch = "main",
				requires = {
					{ "nvim-tree/nvim-web-devicons" },
					{ "nvim-treesitter/nvim-treesitter" },
				},
			},
		},
		{ "onsails/lspkind.nvim" },

		-- formatting and linting
		{ "nvimtools/none-ls.nvim" },
		{
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
		},
		-- treesitter configuration
		{
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		},

		-- auto closing
		{ "windwp/nvim-autopairs" }, -- autoclose parens, brackets, quotes, etc...
		{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

		-- git integration
		{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side

		-- Toggleable terminal
		{ "nvim-lua/plenary.nvim" }, -- don't forget to add this one if you don't have it yet!
		{ {
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			requires = { { "nvim-lua/plenary.nvim" } },
		} },

		-- Lua
		{ "folke/which-key.nvim" },

		-- Git functionality
		{ "tpope/vim-fugitive" },

		-- For auto comment generation
		{ {
			"kkoomen/vim-doge",
			run = ":call doge#install()",
		} },
		{ "mbbill/undotree" },
		{ "folke/zen-mode.nvim" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "mellow" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
