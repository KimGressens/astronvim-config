-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.colorscheme.neosolarized-nvim" },
  { import = "astrocommunity.lsp.nvim-java" },
  { import = "astrocommunity.pack.java" },
    -- Configure nvim-java to use your JDK
  {
    "nvim-java/nvim-java",
    opts = {
      -- This tells nvim-java which Java to use for running jdtls itself
      java_cmd = "/home/linuxbrew/.linuxbrew/opt/openjdk@21/bin/java",
      
      -- Disable auto-installation of JDK via Mason
      jdk = {
        auto_install = false,
      },
    },
  },  -- Configure jdtls settings through AstroLSP
  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        jdtls = {
          -- This automatically finds the highest-level project root
          root_dir = function(fname)
            local util = require("lspconfig.util")
            -- Searches upward for these files, returns the HIGHEST match
            return util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle")(fname)
              or util.find_git_ancestor(fname)
          end,
          settings = {
            java = {
              configuration = {
                runtimes = {
                  {
                    name = "JavaSE-21",
                    path = "/home/linuxbrew/.linuxbrew/opt/openjdk@21/",
                    default = true,
                  },
                },
              },
              format = {
                enabled = true,
                settings = {
                  url = "/home/kim/.config/nvim/java-code-style-google.xml",
                  profile = "Default",
                },
                tabSize = 4,
                insertSpaces = true,
              },
            },
          },
        },
      },
    },
  }
}
