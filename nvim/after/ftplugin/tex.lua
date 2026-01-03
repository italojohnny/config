local tw = vim.g.textwidth_default or 79

vim.opt_local.textwidth = tw
vim.opt_local.formatoptions:append("t")
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.colorcolumn = tostring(tw+1)
