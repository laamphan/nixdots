local M = {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		-- No need because of using nixos
		-- build = function()
		--   vim.cmd [[silent! GoInstallDeps]]
		-- end,
	},
}

return M
