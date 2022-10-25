local nightfox = require("nightfox")

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
		add = "#35BF86",
		remove = "#F22c86",
		delta = "#6F44F0",
		background = "#3B224C",
		cursor_match_bg = "#212121",
		cursor_match_fg = "#6C6999",
	}
};

-- Sets the colors of the different "special" parts
palette.all.comment = palette.all.sirocco;
palette.all.bg0 = palette.all.revolver;
palette.all.bg1 = palette.all.background;
palette.all.bg2 = palette.all.revolver;
palette.all.bg3 = palette.all.delta;
palette.all.bg4 = palette.all.revolver;
palette.all.fg0 = palette.all.lavender;
palette.all.fg1 = palette.all.lavender;
palette.all.fg2 = palette.all.lilac;
palette.all.fg3 = palette.all.grey;
palette.all.sel0 = palette.all.delta;
palette.all.sel1 = palette.all.bossanova;

local specs = {
	all = {
		syntax = {
			bracket = "lavender",
			builtin0 = "lavender",
			builtin1 = "white",
			builtin2 = "white",
			comment = "comment",
			conditional = "almond",
			const = "white",
			dep = "red",
			field = "green",
			func = "white",
			ident = "lilac",
			keyword = "honey",
			number = "chamois",
			operator = "lilac",
			preproc = "mint",
			regex = "mint",
			statement = "bossanova",
			string = "silver",
			type = "white",
			variable = "lavender",
		},
		diag = {
			warn = "lightning",
			error = "apricot",
			info = "delta",
			hint = "silver",
		},
		git = {
			add = "add",
			remove = "remove",
			changed = "delta"
		}
	}
}

nightfox.setup({
	palettes = palette,
	specs = specs,
	modules = {
		treesitter = true,
		tsrainbow = true,
		telescope = true,
		neotree = true
	}
});

nightfox.override.groups({
	all = {
		CursorLineNr = { bg = palette.all.revolver },
		LineNr = { bg = palette.all.revolver },
		SignColumn = { bg = palette.all.revolver },
	},
	modules = {
		gitgutter = {
			GitGutterAdd = { bg = palette.all.revolver },
			GitGutterDelete = { bg = palette.all.revolver },
			GitGutterChange = { bg = palette.all.revolver },
		}
	}
});
