-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "yamlls",
  "docker_language_server",
  "terraformls",
  "ansiblels",
  "gopls",
  "helm_ls",
  "bashls",
  "rust_analyzer",
  "tailwindcss",
  "ruff",
  "eslint",
  "vtsls",
  "pyright",
  "texlab",
  "prismals",
}

vim.lsp.enable(servers)

-- servers with custom configurations
vim.lsp.config("pyright", {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
})
