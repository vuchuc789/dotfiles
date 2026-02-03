return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {},
        docker_language_server = {},
        terraformls = {},
        ansiblels = {},
        helm_ls = {},
        -- bashls = {}, -- Installed by ulti.dot extra

        -- Javascript
        html = {},
        cssls = {},
        tailwindcss = {},
        vtsls = {},
        eslint = {},

        -- Python
        pyright = {
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
        },
        ruff = {},

        -- Golang
        gopls = {},

        -- Rust
        rust_analyzer = {},

        -- LaTex
        texlab = {},
      },
    },
  },
}
