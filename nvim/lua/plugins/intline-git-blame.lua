-- Upstream hardcodes the "Comment" highlight group for the blame extmark.
-- This local copy adds an `hl_group` option so blame can be recolored without
-- changing every comment in the buffer.
local hl_group = "InlineGitBlame"

local function set_hl()
  vim.api.nvim_set_hl(0, hl_group, { fg = "#ededed" })
end

return {
  dir = vim.fn.stdpath("config") .. "/local/inline_git_blame",
  name = "inline_git_blame.nvim",
  event = "BufReadPost",
  config = function()
    set_hl()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_hl,
      desc = "Keep inline git blame white",
    })
    require("inline_git_blame").setup({ hl_group = hl_group })
  end,
}
