local map = vim.keymap.set

-- ESCAPE
map("i", "jj", "<Esc>")

-- BUFFER
map("n", "<leader>p", ":bprevious<CR>")
map("n", "<leader>n", ":bnext<CR>")
map("n", "<leader>q", ":bdelete<CR>")
map("n", "<leader>s", ":vertical sbuffer<CR>")
map("n", "<leader>i", ":sbuffer<CR>")

-- BUFFER CONFIG
map("n", "<leader>ev", ":vsplit $MYVIMRC<CR>")
map("n", "<leader>sv", ":source $MYVIMRC<CR>")

-- COLOCAR ENTRE SÍMBOLO
map("n", [[<leader>"]], [[viw<esc>a"<esc>bi"<esc>lel]])
map("n", [[<leader>']], [[viw<esc>a'<esc>bi'<esc>lel]])
map("v", [[<leader>"]], [[<esc>`>a"<esc>`<i"<esc>`>l]])
map("v", [[<leader>']], [[<esc>`>a'<esc>`<i'<esc>`>l]])
map("x", "<leader>(", [[<esc>`>a)<esc>`<i(<esc>'>l]])
map("x", "<leader>[", [[<esc>`>a]<esc>`<i[<esc>'>l]])
map("x", "<leader>{", [[<esc>`>a}<esc>`<i{<esc>'>l]])
map("x", "<leader><", [[<esc>`>a><esc>`<i<<esc>'>l]])

-- MOVIMENTAÇÃO JANELA
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- INÍCIO E FIM DE LINHA
map("n", "L", "$")
map("v", "L", "$")
map("n", "H", "^")
map("v", "H", "^")

-- MANTER POSIÇÃO DEPOIS DO *
map("n", "*", ":keepjumps normal! mi*`i<CR>")
