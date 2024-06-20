local setup, gitsigns = pcall(require, "gitsigns")

if not setup then
	return
end
gitsigns.setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Move to the next hunk (differing text)
		map("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Move to the previous hunk (differing text)
		map("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return "<Ignore>"
		end, { expr = true })

		-- Stage an individual hunk
		map("n", "<leader>hs", gs.stage_hunk)
		-- Reset individual hunk
		map("n", "<leader>hr", gs.reset_hunk)
		-- stage individual hunk (in visual mode)
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)
		-- Reset individual hunk (in visual mode)
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		-- Stage the current file
		map("n", "<leader>hS", gs.stage_buffer)
		-- Unstage the current hunk
		map("n", "<leader>hu", gs.undo_stage_hunk)

		-- Reset current file to original
		map("n", "<leader>hR", gs.reset_buffer)

		-- Preview the previous version of the current hunk
		map("n", "<leader>hp", gs.preview_hunk)

		-- Git Blame the current line.
		-- (Check to see when the current line was last modified and by whom)
		map("n", "<leader>hb", function()
			gs.blame_line({ full = true })
		end)

		-- Toggle blame for current line.
		map("n", "<leader>tb", gs.toggle_current_line_blame)

		-- Git diff the current buffer.
		map("n", "<leader>hd", gs.diffthis)
		map("n", "<leader>hD", function()
			gs.diffthis("~")
		end)
		map("n", "<leader>ht", gs.toggle_deleted)

		-- Text object
		map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
	end,
})
