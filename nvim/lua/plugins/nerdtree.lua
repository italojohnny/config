return {
  {
    "preservim/nerdtree",
    keys = {
      { ",f", ":NERDTreeToggle<CR>", desc = "Toggle NERDTree" },
    },
    init = function()
      vim.g.NERDTreeShowHidden = 1
    end,
  },
}

