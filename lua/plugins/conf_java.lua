local M = {
  "mfussenegger/nvim-jdtls",
  dependencies = {
    'neovim/nvim-lspconfig',
  },
  ft = "java",
}

M.config = function()
  -- local helper = require('plugins.lsp-conf.helper');
  -- local java_lsp = require('lsp-zero').build_options('jdtls', {});
  -- local location = vim.fn.stdpath("data") .. "/mason/packages/jdtls";
  -- -- vim.pretty_print(java_lsp);
  -- local root_markers = {
  --   -- Single-module projects
  --   {
  --     'build.xml', -- Ant
  --     'pom.xml', -- Maven
  --     'settings.gradle', -- Gradle
  --     'settings.gradle.kts', -- Gradle
  --   },
  --   -- Multi-module projects
  --   { 'build.gradle', 'build.gradle.kts' },
  -- } or vim.fn.getcwd()
  --
  -- local root_dir = require('jdtls.setup').find_root(root_markers);
  -- local workspace_folder = os.getenv("HOME") .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  -- local config = {
  --   cmd = {
  --     --
  --     "java", -- Or the absolute path '/path/to/java11_or_newer/bin/java'
  --     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  --     '-Dosgi.bundles.defaultStartLevel=4',
  --     '-Declipse.product=org.eclipse.jdt.ls.core.product',
  --     '-Dlog.protocol=true',
  --     '-Dlog.level=ALL',
  --     '-Xmx4g',
  --     '--add-modules=ALL-SYSTEM',
  --     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
  --     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  --     '-jar',
  --     vim.fn.glob(location .. '/plugins/org.eclipse.equinox.launcher_*.jar'),
  --     "-configuration", location .. "/config_linux",
  --     "-data", workspace_folder
  --   },
  --   settings = {
  --     java = {
  --       signatureHelp = { enabled = true },
  --       import = { enabled = true },
  --       rename = { enabled = true }
  --     }
  --   },
  --   init_options = {
  --     bundles = {}
  --   }
  -- }
  -- config.handlers = java_lsp.handlers;
  -- config.on_attach = helper.on_attach;
  -- require('jdtls').start_or_attach(config)
end

return { M };
