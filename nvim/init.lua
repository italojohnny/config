-- variaveis globais
vim.g.textwidth_default = 79

-- carregamento inicial de filetypes
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = nil
vim.cmd("filetype plugin indent on")

-- leader antes de qualquer plugin
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- bootstrap do lazy
require("lazynvim")
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

-- configurações pós-plugins
require("config.settings")
require("config.keymaps")

-- tema
vim.cmd("syntax on")
vim.cmd.colorscheme("molokai")

-- clipboard
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  callback = function()
    -- remove espaços/tabs no fim das linhas
    vim.cmd([[%s/\s\+$//e]])
    -- transforma linhas só com espaços em linhas vazias
    vim.cmd([[%s/^\s\+$//e]])
  end,
})

