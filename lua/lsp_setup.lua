local lspconfig = require "lspconfig"
local cmp_nvim_lsp = require "cmp_nvim_lsp"

-- Default on_attach function for all LSPs
local on_attach = function(client, bufnr)
  -- Add your on_attach settings here if needed
end

-- Create capabilities object with cmp_nvim_lsp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configure clangd with consistent offset encoding via command line argument
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-16", -- Adjust as needed
  },
}

-- Configure pyright
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Configure tsserver
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Configure lua_ls with specific settings
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Add similar configurations for other LSP servers as needed
