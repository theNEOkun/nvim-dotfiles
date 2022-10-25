local nightfox = require("nightfox")
local old_palette = require('nightfox.palette').load();
local old_specs = require('nightfox.spec').load();

local palette = {
	all = {
		white = "#ffffff",
		lilac = "#dbbfef",
		lavender = "#a4a0e8",
		comet = "#5a5977",
		bossanova = "#452859",
		midnight = "#3b224c",
		revolver = "#281733",
		silver = "#cccccc",
		sirocco = "#697C81",
		mint = "#9ff28f",
		almond = "#eccdba",
		chamois = "#E8DCA0",
		honey = "#efba5d",
		apricot = "#f47868",
		lightning = "#ffcd1c",
		delta = "#6F44F0",
		bg1 = "#540099",
		cursor_match_bg = "#212121",
		cursor_match_fg = "#6C6999" ,
		sel0 = "#281733",
		sel1 = "#281733"
	}
};

palette.all.comment = palette.all.sirocco;
palette.all.bg0 = palette.all.revolver;
palette.all.fg0 = palette.all.lavender;

local specs = {
	all = {
		syntax = {
			keyword = "almond",
			variable = "lavender",
			builtin0 = "lavender",
			type = "white",
			builtin1 = "white",
			operator = "lilac",
			func = "white",
			const = "white",
			builtin2 = "white",
			string = "silver",
			number = "chamois",
			bracket = "lavender",
			ident = "lilac",
			preproc = "mint",
			statement = "bossanova"
		}
	}
}

nightfox.setup({
	palettes = vim.tbl_deep_extend("force", old_palette, palette),
	specs = specs,
});
