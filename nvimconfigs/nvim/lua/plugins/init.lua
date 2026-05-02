return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason & Tool Installation
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "rust-analyzer", "omnisharp", "vtsls", "angular-language-server",
          "netcoredbg", "codelldb", "js-debug-adapter",
          "prettierd", "csharpier", "eslint_d",
        },
        auto_update = true,
        run_on_start = true,
      }
    end,
  },

  -- nvim tree
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      view = {
        adaptive_size = true,
        width = 35,
      },
    },
  },

  -- Debugging Suite
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      
      -- Load external custom config if exists
      pcall(require, "configs.dap")

      -- Go (Delve)
      dap.adapters.go = {
        type = 'executable',
        command = 'node',
        args = {os.getenv("HOME") .. '/.local/share/nvim/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js'},
      }

      -- TypeScript/Angular (js-debug-adapter)
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}"},
        }
      }
      
      dap.configurations.typescript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch Program",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- Rust specific
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = function()
      return require "configs.conform"
    end,
  },
}
