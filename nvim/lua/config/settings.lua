-- ============================================
-- LEADER
-- ============================================
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- ============================================
-- AUTOCMDs
-- ============================================
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Arquivos de texto / markdown / LaTeX
--autocmd({ "BufNewFile", "BufRead" }, {
--  pattern = { "*.txt", "*.tex", "*.md" },
--  command = "source ~/.config/nvim/set_plaintext.vim",
--})

-- Arquivos Python com extensão .py_ ← duplo underline
autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.py",
  command = "set filetype=python",
})

-- Arquivos Python
--autocmd({ "BufNewFile", "BufRead" }, {
--  pattern = "*.py",
--  command = "source ~/.config/nvim/set_python.vim",
--})

-- YAML (opcional, estava comentado)
-- autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = { "*.yaml", "*.yml" },
--   command = "source ~/.config/nvim/set_yaml.vim",
-- })


-- ============================================
-- OPÇÕES
-- ============================================
local opt = vim.opt

-- Aparência e Interface
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.colorcolumn = "80,120"
opt.foldmethod = "marker"
opt.scrolloff = 0

-- Indentação
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- Busca
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Arquivos e formatos
opt.backup = false
opt.writebackup = false
opt.autoread = true
opt.wrap = false
opt.nrformats:remove("octal")
opt.encoding = "utf-8"
-- opt.fileformat = "unix"
vim.opt_global.fileformats = { "unix", "dos" }

-- Interface responsiva
opt.cmdheight = 2
opt.updatetime = 100
opt.ttyfast = true
opt.showmatch = true
opt.showcmd = true
opt.showmode = true
opt.laststatus = 2
opt.scs = true
opt.termguicolors = true
opt.mousemodel = "popup"
opt.clipboard = "unnamedplus"
opt.conceallevel = 0

-- Conceal específicos
vim.g.vim_json_conceal = 0
vim.g.vim_tex_conceal = 0

-- Mouse
opt.mouse = ""
