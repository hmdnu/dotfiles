return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "auto"
      opts.options.icons_enabled = false
      opts.options.component_separators = ""
      opts.options.section_separators = ""
      opts.options.globalstatus = true

      opts.sections = {
        lualine_a = {
          {
            "mode",
            color = { gui = "bold" },
          },
        },
        lualine_b = {
          {
            "branch",
            color = { gui = "bold" },
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
            color = { gui = "bold" },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "location",
            color = { gui = "bold" },
          },
        },
      }

      opts.inactive_sections = {
        lualine_a = {},
        lualine_b = {
          {
            "branch",
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      }
    end,
  },
}
