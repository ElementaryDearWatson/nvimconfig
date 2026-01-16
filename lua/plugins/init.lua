return {
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Autoinstall tools (The "Portability" engine)
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- LSPs
        "rust-analyzer", "omnisharp", "vtsls", "angular-language-server",
        -- Debuggers
        "netcoredbg", "codelldb", "js-debug-adapter",
        -- Formatters/Linters
        "prettierd", "csharpier", "eslint_d",
      },
    },
  },

  -- Debugging Suite
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap" -- We will create this file
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- Rust specific (Better than raw lspconfig)
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended for nvim v0.11
    lazy = false,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vtsls", "angular-language-server", "eslint_d", "prettierd",
        "omnisharp", "netcoredbg", "rust-analyzer", "codelldb", "csharpier"
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false, -- Run on startup to check for missing tools
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- LSPs
          "vtsls", "angular-language-server", "omnisharp", "rust-analyzer",
          -- Debuggers
          "netcoredbg", "codelldb",
          -- Formatters/Linters
          "prettierd", "eslint_d", "csharpier",
        },
        auto_update = true,
        run_on_start = true,
      }
    end,
  },
}
