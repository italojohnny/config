return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local c = {
        outer_bg = "#5F87FF", outer_fg = "#FFFFFF",
        inner_bg = "#5F5F5F", inner_fg = "#AFAF87",
        center_bg = "#1C1C1C", center_fg = "#F5F5F5",
        inactive_bg = "#1C1C1C", inactive_fg = "#4E4E4E",
      }

      local murmur = {
        normal = {
          a = { fg = c.outer_fg, bg = c.outer_bg, gui = "bold" },
          b = { fg = c.inner_fg, bg = c.inner_bg },
          c = { fg = c.center_fg, bg = c.center_bg },
        },
        inactive = {
          a = { fg = c.inactive_fg, bg = c.inactive_bg },
          b = { fg = c.inactive_fg, bg = c.inactive_bg },
          c = { fg = c.inactive_fg, bg = c.inactive_bg },
        },
      }

      require("lualine").setup({
        options = {
          theme = murmur,
          icons_enabled = true,
          component_separators = { left = "", right = "" },
          section_separators   = { left = "", right = "" },
        },

        sections = {
          lualine_a = { "mode" },
          lualine_b = {{ "branch",   color = { bg = c.inner_bg,  fg = c.inner_fg }},},
          lualine_c = {{ "filename", color = { bg = c.center_bg, fg = c.center_fg }},},

          lualine_x = {
            { "encoding", color = { bg = c.center_bg, fg = c.center_fg } },
          },
          lualine_y = {
            { "fileformat", color = { bg = c.outer_bg, fg = c.outer_fg }},
            { "filetype",   color = { bg = c.outer_bg, fg = c.outer_fg }},
          },
          lualine_z = {
            { "location", color = { bg = c.outer_fg, fg = c.outer_bg }},
            { "progress", color = { bg = c.outer_fg, fg = c.outer_bg }},
          },
        },
      })
    end,
  },
}
