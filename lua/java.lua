local java_lsp = require('lsp-zero').build_options('jdtls', {});
local location = vim.fn.stdpath("data") .. "/mason/packages/jdtls";
-- vim.pretty_print(java_lsp);
local root_markers = {
        -- Single-module projects
        {
            'build.xml', -- Ant
            'pom.xml', -- Maven
            'settings.gradle', -- Gradle
            'settings.gradle.kts', -- Gradle
        },
        -- Multi-module projects
        { 'build.gradle', 'build.gradle.kts' },
    } or vim.fn.getcwd()

local root_dir = require('jdtls.setup').find_root(root_markers);
local workspace_folder = os.getenv("HOME") .. "/.cache/jdtls/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
-- local jarfile = location .. '/plugins/org.eclipse.equinox.launcher_'.. current.. '.jar';
local jarfile = vim.fn.glob(
     location .. "/plugins/org.eclipse.equinox.launcher_*.jar",
     1,
     1
   )[1];
local config = {
    cmd = {
        --
        "java", -- Or the absolute path '/path/to/java11_or_newer/bin/java'
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', jarfile,
        "-configuration", location .. "/config_linux",
        "-data", workspace_folder
    },
    settings = {
        java = {
            signatureHelp = { enabled = true },
            import = { enabled = true },
            rename = { enabled = true },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*"
                },
                -- filteredTypes = {
                --     "com.sun.*",
                --     "io.micrometer.shaded.*",
                --     "java.awt.*",
                --     "jdk.*",
                --     "sun.*",
                -- },
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/usr/lib/jvm/java-8-openjdk/",
                    },
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk/",
                    },
                }
            }
        },
    },
}
config.handlers = java_lsp.handlers;
config.on_attach = function(client, bufnr)
  require('plugins.lsp-conf.helper').on_attach(client, bufnr);
end;
require('jdtls').start_or_attach(config)
