return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { "pyright" },
      })

      -- Nova API: vim.lsp.config
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", ",g", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      end

      -- PEGAR SERVIDORES INSTALADOS
      local servers = mason_lspconfig.get_installed_servers()

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          on_attach = on_attach,
        })
      end
    end,
  },
}
