return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = true,
  init = function()
    local function set_directory_hl()
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { link = "Directory" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { link = "Directory" })
      vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { link = "Comment" })
    end

    set_directory_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_directory_hl,
    })
  end,
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
      },
    },
    window = {
      position = "left",
      mappings = {
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local filename = node.name
          vim.fn.setreg("+", filename)
          vim.notify("📋 Copied: " .. filename)
        end,
      },
    },
  },
}
