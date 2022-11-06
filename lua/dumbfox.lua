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
		cursor_bg = "#540099",
	}
};

-- Sets the colors of the different "special" parts
palette.all.comment = palette.all.sirocco;
palette.all.bg0 = palette.all.revolver;
palette.all.bg1 = palette.all.midnight;
palette.all.bg2 = palette.all.revolver;
palette.all.bg3 = palette.all.delta;
palette.all.bg4 = palette.all.delta;
palette.all.fg0 = palette.all.lavender;
palette.all.fg1 = palette.all.lavender;
palette.all.fg2 = palette.all.lilac;
palette.all.fg3 = palette.all.delta;
palette.all.sel0 = palette.all.cursor_bg;
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
			field = "white",
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
		diag_bg = {
			warn = "revolver",
			error = "revolver",
			info = "revolver",
			hint = "revolver",
		},
		git = {
			add = "add",
			remove = "remove",
			changed = "delta"
		}
	}
}

-- Setting up the colorscheme
nightfox.setup({
	palettes = palette,
	specs = specs,
	options = {
		styles = {
			comments = "italic",
			keywords = "bold",
			functions = "italic"
		},
		inverse = {
			search = "true"
		}
	},
});

nightfox.override.groups({
	all = {
		CursorLineNr = { bg = palette.all.revolver },
		LineNr = { bg = palette.all.revolver },
		SignColumn = { bg = palette.all.revolver },
		FoldColumn = { bg = palette.all.revolver },
		SignColumnSB = { bg = palette.all.revolver },
		GitGutterAdd = { bg = palette.all.revolver },
		GitGutterDelete = { bg = palette.all.revolver },
		GitGutterChange = { bg = palette.all.revolver },
		["@tag.attribute"] = { fg = palette.all.lavender },
		DiagnosticSignError = { bg = palette.all.revolver },
		DiagnosticSignWarn = { bg = palette.all.revolver },
		DiagnosticSignInfo = { bg = palette.all.revolver },
		DiagnosticSignHint = { bg = palette.all.revolver },
	},
});
