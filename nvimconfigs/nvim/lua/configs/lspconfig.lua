-- In Neovim 0.11, we use native vim.lsp instead of require('lspconfig') setup calls
local nvlsp = require "nvchad.configs.lspconfig"

-- List the servers you want to enable
local servers = { "vtsls", "angularls", "omnisharp" }

-- Configure servers using the new native API
for _, lsp in ipairs(servers) do
  -- This sets the configuration (commands, root markers, etc.)
  -- NvChad's nvlsp handles the on_attach and capabilities
  vim.lsp.config(lsp, {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
  
  -- This actually enables the server to start when matching files are opened
  vim.lsp.enable(lsp)
end

-- Specialized C# setup (if you need specific cmd paths)
vim.lsp.config("omnisharp", {
  cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/bin/omnisharp" },
  -- your other settings...
})
