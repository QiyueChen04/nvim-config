local jdtls = require('jdtls')
local home = os.getenv("HOME")

-- Detect project root
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == nil then return end

-- Workspace folder (unique per project)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

-- Main config
local config = {
  cmd = {
    'jdtls',
    '-data', workspace_folder
  },
  root_dir = root_dir,
  settings = {
    java = {
      format = {
        enabled = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/path/to/java8", -- Replace with the actual path to your Java 8 installation
            default = true,
          },
        },
        compiler = {
          source = "1.8",
          compliance = "1.8",
          codegen = {
            targetPlatform = "1.8",
          },
        },
      },
    },
  },
  init_options = {
    bundles = {},
  },
  on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, silent = true }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
}

jdtls.start_or_attach(config)
-- local jdtls = require('jdtls')
--
--
-- local home = os.getenv("HOME")
--
-- -- Detect project root
-- local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
-- local root_dir = require('jdtls.setup').find_root(root_markers)
-- if root_dir == nil then return end
--
-- -- Workspace folder (unique per project)
-- local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
--
-- -- Path to Java 22
-- local java_home = "/Library/Java/JavaVirtualMachines/jdk-22.jdk/Contents/Home"
--
-- -- Path to jdtls installation via Mason
-- local jdtls_path = home .. "/.local/share/nvim/mason/packages/jdtls"
--
-- -- Find the launcher JAR
-- local launcher_jar = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
--
-- -- Main config
-- local config = {
--   cmd = {
--     java_home .. "/bin/java",
--     "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--     "-Dosgi.bundles.defaultStartLevel=4",
--     "-Declipse.product=org.eclipse.jdt.ls.core.product",
--     "-Dlog.protocol=true",
--     "-Dlog.level=ALL",
--     "-Xmx1g",
--     "--add-modules=ALL-SYSTEM",
--     "--add-opens", "java.base/java.util=ALL-UNNAMED",
--     "--add-opens", "java.base/java.lang=ALL-UNNAMED",
--     "-jar", launcher_jar,
--     "-configuration", jdtls_path .. "/config_mac",
--     "-data", workspace_folder
--   },
--   root_dir = root_dir,
--   settings = {
--     java = {
--       format = {
--         enabled = true,
--       },
--       configuration = {
--         runtimes = {
--           {
--             name = "JavaSE-22",
--             path = java_home,
--             default = true,
--           },
--         },
--       },
--     },
--   },
--   init_options = {
--     bundles = {},
--   },
--   on_attach = function(client, bufnr)
--     local opts = { buffer = bufnr, silent = true }
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--   end,
-- }
--
-- jdtls.start_or_attach(config)
