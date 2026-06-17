return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function(_, opts)
      opts.textobjects = opts.textobjects or {}

      opts.textobjects.select = vim.tbl_deep_extend("force", opts.textobjects.select or {}, {
        enable = true,
        lookahead = true,
        keymaps = {
          ["ao"] = { query = "@assignment.rhs", desc = "object value" },
          ["io"] = { query = "@assignment.inner", desc = "object inner" },
        },
      })

      opts.textobjects.move = vim.tbl_deep_extend("force", opts.textobjects.move or {}, {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]o"] = "@object.outer",
        },
        goto_previous_start = {
          ["[o"] = "@object.outer",
        },
      })
    end,
  },
}
