return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "work",
        path = "~/obsidian/work",
      },
    },
    picker = {
      name = "snacks.picker",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
