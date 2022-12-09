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
palette.all.fg3 = palette.all.comet;
palette.all.sel0 = palette.all.cursor_bg;
palette.all.sel1 = palette.all.bossanova;
palette.all.background_column = palette.all.midnight;

local specs = {
  all = {
    syntax = {
      bracket = "lavender",
      builtin0 = "mint",
      builtin1 = "white",
      builtin2 = "white",
      comment = "comment",
      conditional = "almond",
      const = "white",
      dep = "red",
      field = "white",
      func = "white",
      ident = "lilac",
      keyword = "almond",
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
    -- diag_bg = {
    --   warn = "background_column",
    --   error = "background_column",
    --   info = "background_column",
    --   hint = "background_column",
    -- },
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
  groups = {
    all = {
      -- CursorLineNr = { bg = palette.all.background_column },
      -- LineNr = { bg = palette.all.background_column },
      -- SignColumn = { bg = palette.all.background_column },
      -- FoldColumn = { bg = palette.all.background_column },
      -- SignColumnSB = { bg = palette.all.background_column },
      -- GitGutterAdd = { bg = palette.all.background_column },
      -- GitGutterDelete = { bg = palette.all.background_column },
      -- GitGutterChange = { bg = palette.all.background_column },
      ["@tag.attribute"] = { fg = palette.all.lavender },
      ["@parameter"] = { fg = palette.all.lavender },
      ["@type.qualifier"] = { fg = palette.all.almond },
      ["@keyword.return"] = { fg = palette.all.almond },
      ["@constructor"] = { fg = palette.all.variable },
      -- DiagnosticSignError = { bg = palette.all.background_column },
      -- DiagnosticSignWarn = { bg = palette.all.background_column },
      -- DiagnosticSignInfo = { bg = palette.all.background_column },
      -- DiagnosticSignHint = { bg = palette.all.background_column },
    },
  },
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
