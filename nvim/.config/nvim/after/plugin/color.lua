require('rose-pine').setup({
	--- @usage 'main' | 'moon'
	dark_variant = 'moon',

	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'pine' }
	}
})

-- set colorscheme after options
vim.cmd("colorscheme rose-pine")

