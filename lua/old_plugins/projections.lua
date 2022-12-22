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
    proj['src/app/*.ts'] = {
      alternate = 'src/app/{}.html'
    }
    proj['src/app/*.html'] = {
      alternate = 'src/app/{}.ts'
    }
    vim.g.projectionist_heuristic = proj;
  end
}

return {
  m
}
