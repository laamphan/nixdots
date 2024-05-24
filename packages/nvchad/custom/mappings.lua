local M = {}

M.general = {
	i = {
		["<C-s>"] = { "<Esc> <C-s> <cmd> w <CR>", "Save file & Exit Input Mode" },
	},
	n = {
		["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
		["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
		["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
		["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
	},
}

M.telescope = {
	plugin = true,
	n = {
		["<leader>far"] = { "<cmd> Telescope lsp_references <CR>", "Find all references" },
		["<leader>fai"] = { "<cmd> Telescope lsp_implementations <CR>", "Find all implementations" },
		["<leader>fad"] = { "<cmd> Telescope lsp_definitions <CR>", "Find all definitions" },
		["<leader>fdf"] = { "<cmd> Telescope dir find_files<CR>", "Find files in directory" },
		["<leader>fdw"] = { "<cmd> Telescope dir live_grep<CR>", "Find words in directory" },
	},
}
return M
