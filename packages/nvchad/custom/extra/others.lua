local M = {
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ "mechatroner/rainbow_csv" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		},
	},
	{
		"princejoogie/dir-telescope.nvim",
		-- telescope.nvim is a required dependency
		dependencies = { "nvim-telescope/telescope.nvim" },
		opts = {
			-- these are the default options set
			hidden = true,
			no_ignore = false,
			show_preview = true,
		},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{
		"3rd/image.nvim",
		config = function()
			require("image").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "3rd/image.nvim" },
	},
}

return M
