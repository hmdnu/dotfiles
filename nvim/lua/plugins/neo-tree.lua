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

      commands = {
        -- Move files/directories to Trash instead of permanently deleting them
        delete = function(state)
          local node = state.tree:get_node()

          if not node or not node.path then
            return
          end

          local path = node.path
          local name = node.name

          vim.ui.select({ "Yes", "No" }, {
            prompt = "Trash " .. name .. "?",
          }, function(choice)
            if choice ~= "Yes" then
              return
            end

            vim.fn.system({ "gio", "trash", path })

            if vim.v.shell_error == 0 then
              require("neo-tree.sources.manager").refresh(state.name)
            else
              vim.notify("Failed to trash: " .. path, vim.log.levels.ERROR)
            end
          end)
        end,
      },
    },

    window = {
      position = "left",

      mappings = {
        ["Y"] = function(state)
          local node = state.tree:get_node()

          if not node then
            return
          end

          local filename = node.name

          vim.fn.setreg("+", filename)
          vim.notify("📋 Copied: " .. filename)
        end,
      },
    },
  },
}
