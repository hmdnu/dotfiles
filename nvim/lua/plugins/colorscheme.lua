-- Dracula only tints additions; DiffChange/DiffDelete/DiffText have no
-- background and DiffText uses the comment color, so every diff plugin
-- (diffview, gitsigns, mini.diff) renders changed words nearly invisible.
-- Derive subtle backgrounds from the active palette instead.
local function blend(fg, bg, alpha)
  local function channel(hex, i)
    return tonumber(hex:sub(i, i + 1), 16)
  end
  local function mix(a, b)
    return math.floor(a * alpha + b * (1 - alpha) + 0.5)
  end
  return string.format(
    "#%02x%02x%02x",
    mix(channel(fg, 2), channel(bg, 2)),
    mix(channel(fg, 4), channel(bg, 4)),
    mix(channel(fg, 6), channel(bg, 6))
  )
end

local function overrides(c)
  return {
    -- dracula-soft's `selection` (#7C7F8A) is a bright grey; use a subtle
    -- tint of fg over bg instead so the cursorline stays dark.
    CursorLine = { bg = blend(c.fg, c.bg, 0.08) },
    DiffAdd = { bg = blend(c.green, c.bg, 0.18) },
    DiffChange = { bg = blend(c.orange, c.bg, 0.18) },
    DiffDelete = { bg = blend(c.red, c.bg, 0.18) },
    DiffText = { bg = blend(c.orange, c.bg, 0.35) },
    MiniDiffOverContext = { bg = blend(c.orange, c.bg, 0.08) },
    MiniDiffOverContextBuf = { bg = blend(c.orange, c.bg, 0.08) },
  }
end

return {
  {
    "Mofiqul/dracula.nvim",
    opts = { overrides = overrides },
    config = function(_, opts)
      require("dracula").setup(opts)
      -- Re-apply when LazyVim already set the colorscheme before this config.
      if vim.g.colors_name == "dracula" or vim.g.colors_name == "dracula-soft" then
        vim.cmd.colorscheme(vim.g.colors_name)
      end
    end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {},
  },
  -- Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula-soft",
      icons = {
        ft = {
          octo = "",
          gh = "",
          ["markdown.gh"] = "",
        },
        kinds = {
          File = "·",
          Folder = "▸",
        },
      },
    },
  },
}
