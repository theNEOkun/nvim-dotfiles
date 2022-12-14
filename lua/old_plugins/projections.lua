local m = {
  'tpope/vim-projectionist',
  config = function()
    local proj = {};
    proj['src/main/java/**/*.java' ] = {
      alternate = "src/test/java/**/{}.java",
      type= "test"
    };
    proj['src/test/java/**/*.java' ] = {
      alternate = "src/main/java/**/{}.java",
      type= "test"
    };
    proj["*.java"]= {
      dispatch = "javac {file}",
    }
    proj["*"] = {
      make = "maven"
    }
    vim.g.projectionist_heuristics = proj;
  end
}

return {
  m
}
