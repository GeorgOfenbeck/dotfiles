return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "scala", "mill" },
      root = { "build.sbt", "build.sc", "build.gradle", "pom.xml", "build.mill" },
    })
  end,
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "scala" } },

    config = function()
      require("nvim-treesitter.parsers").get_parser_configs().scala.filetype = { "scala", "sbt", "mill" }
      -- require("nvim-treesitter.parsers").get_parser_configs().mill = {
      --   install_info = {
      --     url = "https://github.com/tree-sitter/tree-sitter-scala",
      --     files = { "src/parser.c", "src/scanner.c" },
      --     branch = "main",
      --   },
      --   filetype = "mill",
      -- }
    end,
  },
  {
    "scalameta/nvim-metals",
    ft = { "scala", "mill" },
    config = function() end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        metals = {
          keys = {
            {
              "<leader>me",
              function()
                require("telescope").extensions.metals.commands()
              end,
              desc = "Metals commands",
            },
            {
              "<leader>mc",
              function()
                require("metals").compile_cascade()
              end,
              desc = "Metals compile cascade",
            },
            {
              "<leader>mh",
              function()
                require("metals").hover_worksheet()
              end,
              desc = "Metals hover worksheet",
            },
          },
          init_options = {
            statusBarProvider = "off",
          },
          settings = {
            showImplicitArguments = true,
            excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
          },
        },
      },
      setup = {
        metals = function(_, opts)
          local metals = require("metals")
          local metals_config = vim.tbl_deep_extend("force", metals.bare_config(), opts)
          metals_config.on_attach = LazyVim.has("nvim-dap") and metals.setup_dap or nil

          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "mill" },
            callback = function()
              metals.initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })
          return true
        end,
      },
    },
  },

  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Debug settings
      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end,
  },
}
