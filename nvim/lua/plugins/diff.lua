return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",

  explorer = {
    view_mode = "tree",
  },
}

--
--
-- local function toggle_diffview()
--   local lib = require("diffview.lib")
--   local view = lib.get_current_view()
--   if view then
--     vim.cmd("DiffviewClose")
--     return
--   end
--   for _, v in ipairs(lib.views) do
--     if v.tabpage and vim.api.nvim_tabpage_is_valid(v.tabpage) then
--       vim.api.nvim_set_current_tabpage(v.tabpage)
--       return
--     end
--   end
--   vim.cmd("DiffviewOpen")
-- end
--
-- return {
--   -- Inline hunk visualization. mini.diff hardcodes no colors: every highlight
--   -- is a link to Diff*/MiniDiff* groups, so it follows the active theme.
--   {
--     "nvim-mini/mini.diff",
--     event = "VeryLazy",
--     opts = {
--       view = { style = "number" }, -- gitsigns already owns the sign column
--       mappings = {
--         apply = "",
--         reset = "",
--         textobject = "",
--         goto_first = "",
--         goto_prev = "",
--         goto_next = "",
--         goto_last = "",
--       },
--     },
--     keys = {
--       {
--         "<leader>gho",
--         function()
--           if vim.bo.buftype ~= "" or vim.api.nvim_buf_get_name(0) == "" then
--             return vim.notify("mini.diff: not a file buffer", vim.log.levels.WARN)
--           end
--           local mini = require("mini.diff")
--           mini.enable(0) -- idempotent; covers the lazy-load race
--           mini.toggle_overlay()
--         end,
--         desc = "Toggle Inline Diff Overlay",
--       },
--     },
--   },
--   {
--     "sindrets/diffview.nvim",
--     cmd = {
--       "DiffviewOpen",
--       "DiffviewClose",
--       "DiffviewToggleFiles",
--       "DiffviewFocusFiles",
--       "DiffviewRefresh",
--       "DiffviewFileHistory",
--     },
--     keys = {
--       -- <leader>gd / <leader>gD belong to the snacks picker extra
--       -- (Snacks.picker.git_diff), so only gv is ours here.
--       { "<leader>gv", toggle_diffview, desc = "Diffview Toggle" },
--     },
--   },
-- }
