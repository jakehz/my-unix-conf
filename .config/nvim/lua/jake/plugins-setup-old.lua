local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- leetcode plugin
	use("kawre/leetcode.nvim")

	use("wbthomason/packer.nvim")

	-- Prerequisite for many plugins.
	use("nvim-lua/plenary.nvim")

	-- Colorschemes
	use("bluz71/vim-nightfly-guicolors")
	use("sainnhe/everforest")
	use("catppuccin/nvim")
	use("sainnhe/gruvbox-material")
	use("sainnhe/edge")
	use("rebelot/kanagawa.nvim")
	use("mellow-theme/mellow.nvim")

	-- tmux & split window navigation
	use("christoomey/vim-tmux-navigator")

	-- Maximize current pane
	use("szw/vim-maximizer")

	-- Surround lines or words with characters, html tags
	use("tpope/vim-surround")

	use("vim-scripts/ReplaceWithRegister")

	-- Comment out using vim motions
	use("numToStr/Comment.nvim")

	use("nvim-tree/nvim-tree.lua")

	-- icons for files of different types
	use("kyazdani42/nvim-web-devicons")
	use("echasnovski/mini.icons")
	-- Adds visual bar at the bottom of the screen
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("onsails/lspkind.nvim")

	-- formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	-- Toggleable terminal
	use("nvim-lua/plenary.nvim") -- don't forget to add this one if you don't have it yet!
	use({
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- Lua
	use("folke/which-key.nvim")

	-- Git functionality
	use("tpope/vim-fugitive")

	-- For auto comment generation
	use({
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	})
	use("mbbill/undotree")
	use("folke/zen-mode.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
