local function toggle_diffview()
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    vim.cmd("DiffviewClose")
    return
  end
  for _, v in ipairs(lib.views) do
    if v.tabpage and vim.api.nvim_tabpage_is_valid(v.tabpage) then
      vim.api.nvim_set_current_tabpage(v.tabpage)
      return
    end
  end
  vim.cmd("DiffviewOpen")
end

return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gv", toggle_diffview, desc = "Diffview Toggle" },
    { "<leader>gd", toggle_diffview, desc = "Diffview Toggle" },
    { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
  },
}
