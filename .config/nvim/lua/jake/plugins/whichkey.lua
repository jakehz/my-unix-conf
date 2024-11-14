vim.o.timeout = true
vim.o.timeoutlen = 300

local whichkey_status, whichkey = pcall(require, "which-key")
if not whichkey_status then
	return
end

whichkey.setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})

whichkey.add({
	{ "<leader>", group = "Navigation" },
	{ "<leader>D", desc = "Show line diagnostic" },
	{ "<leader>a", desc = "Add current file to harpoon menu" },
	{ "<leader>d", desc = "Show cursor diagnostic" },
	{ "<leader>e", desc = "Toggle Neovim Tree" },
	{ "<leader>f", group = "Find" },
	{ "<leader>fb", desc = "Search active buffers" },
	{ "<leader>fc", desc = "Find string pointed to by cursor" },
	{ "<leader>ff", desc = "Find file in project" },
	{ "<leader>fh", desc = "Search help tags" },
	{ "<leader>fs", desc = "Find text throughout project" },
	{ "<leader>h", group = "Git commands" },
	{ "<leader>hD", desc = "Diff file" },
	{ "<leader>hR", desc = "Reset file" },
	{ "<leader>hS", desc = "Stage file" },
	{ "<leader>hb", desc = "Git blame line" },
	{ "<leader>hd", desc = "Diff hunk" },
	{ "<leader>hp", desc = "Preview previous version of hunk" },
	{ "<leader>hr", desc = "Reset current hunk" },
	{ "<leader>hs", desc = "Stage current hunk" },
	{ "<leader>ht", desc = "Toggle changed hunk" },
	{ "<leader>k", ":ZenMode<cr>", desc = "Zen Mode" },
	{ "<leader>rn", desc = "Smart Rename" },
	{ "<leader>s", group = "Split windows" },
	{ "<leader>se", desc = "Make split windows equal" },
	{ "<leader>sh", desc = "Split window horizontally" },
	{ "<leader>sm", desc = "Toggle maximizing current window" },
	{ "<leader>sv", desc = "Split window vertically" },
	{ "<leader>t", group = "Tabs" },
	{ "<leader>tn", desc = "Next tab" },
	{ "<leader>tp", desc = "Previous tab" },
	{ "<leader>tx", desc = "Close tab" },
	{ "<leader>u", ":UndotreeToggle<cr>", desc = "Toggle Undotree" },
	{ "c", group = "Code Actions" },
	{ "ca", desc = "See available code actions" },
	{ "g", group = "Language Server" },
	{ "gD", desc = "Go to definition" },
	{ "gd", desc = "Peek declaration" },
	{ "gf", desc = "Peek definition" },
	{ "gi", desc = "Go to implementation" },
})
-- whichkey.register({
-- t = {
-- 	name = "Terminal",
-- 	n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" }, -- Node Terminal
-- 	t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" }, -- (Optional) Htop, If you have htop in linux
-- 	p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" }, -- Python Terminal
-- 	f = { "<cmd>ToggleTerm direction=float<cr>", "Float" }, -- Floating Terminal
--
-- 	-- Play with size according to your needs.
-- 	h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- Horizontal Terminal
-- 	v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" }, -- Vertical Terminal
-- },
-- ["<leader>"] = {
-- 	name = "Navigation",
-- 	k = { ":ZenMode<cr>", "Zen Mode" },
-- 	u = {
-- 		":UndotreeToggle<cr>",
-- 		"Toggle Undotree",
-- 	},
-- 	h = {
-- 		name = "Git commands",
-- 		s = "Stage current hunk",
-- 		r = "Reset current hunk",
-- 		S = "Stage file",
-- 		R = "Reset file",
-- 		p = "Preview previous version of hunk",
-- 		b = "Git blame line",
-- 		d = "Diff hunk",
-- 		D = "Diff file",
-- 		t = "Toggle changed hunk",
-- 	},
-- 	s = {
-- 		name = "Split windows",
-- 		v = "Split window vertically",
-- 		h = "Split window horizontally",
-- 		e = "Make split windows equal",
-- 		m = "Toggle maximizing current window",
-- 	},
-- 	t = {
-- 		name = "Tabs",
-- 		x = "Close tab",
-- 		n = "Next tab",
-- 		p = "Previous tab",
-- 	},
-- 	e = "Toggle Neovim Tree",
-- 	f = {
-- 		name = "Find",
-- 		f = "Find file in project",
-- 		s = "Find text throughout project",
-- 		c = "Find string pointed to by cursor",
-- 		b = "Search active buffers",
-- 		h = "Search help tags",
-- 	},
-- 	r = {
-- 		n = "Smart Rename",
-- 	},
-- 	D = "Show line diagnostic",
-- 	d = "Show cursor diagnostic",
-- 	a = "Add current file to harpoon menu",
-- },
-- 	g = {
-- 		name = "Language Server",
-- 		f = "Peek definition",
-- 		d = "Peek declaration",
-- 		i = "Go to implementation",
-- 		D = "Go to definition",
-- 	},
-- 	c = {
-- 		name = "Code Actions",
-- 		a = "See available code actions",
-- 	},
-- })
