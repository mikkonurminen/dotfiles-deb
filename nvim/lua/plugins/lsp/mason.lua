-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "tsserver",
    "eslint",
    "cssls",
    "html",
    "pyright",
  },
})

local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
    "black",
    "mypy",
    "ruff",
  },
})
