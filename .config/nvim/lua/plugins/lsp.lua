return {
  -- Let system/mise-managed binaries on PATH take priority over Mason
  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "append",
    },
  },

  -- LSP configuration and extra servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        mise = {
          -- Mise
          cmd = { "mise", "lsp" },
          filetypes = { "toml" },
          root_markers = { "mise.toml", ".mise.toml", "mise/config.toml", "mise/config.local.toml" },
        },
        -- Clojure (clojure-lsp)
        clojure_lsp = {},
      },
    },
  },
}
