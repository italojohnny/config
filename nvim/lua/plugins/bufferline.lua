return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant", -- ou: "thin", "padded_slant", "slope"
        show_buffer_close_icons = true,
        always_show_bufferline = true,
      },
    }
  end,
}
