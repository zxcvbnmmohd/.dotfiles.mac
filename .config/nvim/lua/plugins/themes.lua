return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"andrew-george/telescope-themes",
		config = function()
			require("telescope").load_extension("themes")
		end,
	},
}
