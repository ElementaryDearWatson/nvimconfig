local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
    javascript = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    cs = { "csharpier" },
    rust = { "rustfmt" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
