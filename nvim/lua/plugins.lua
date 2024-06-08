-- file synced with .dotfiles

return {
	-- rose-pine theme
	{ 'rose-pine/neovim', name = 'rose-pine' },

	-- nvim-telescope & dependencies
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6' },
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-tree/nvim-web-devicons' },

	-- 
}
