return {
  "radioactivepb/hoverflex.nvim",
  -- Optional event, LspAttach works great
  event = "LspAttach",
  -- All displayed options are the defaults
  opts = {
    -- By default, any keybinds you do not pass to opts.keybinds will be instantiated
    -- using their default keys (below) unless disable_default_keybinds is set to true
    disable_default_keybinds = false,
    -- All the keybinds displayed below are the default keybinds
    keybinds = {
      -- Open hover docs in a new tab and switch to it
      tab = "<leader>ht",
      -- Open hover docs in a new tab and stay where you're at
      tab_stay = "<leader>hT",
      -- Open hover docs in a new buffer and switch to it
      buffer = "<leader>hb",
      -- Open hover docs in a new buffer and stay where you're at
      buffer_stay = "<leader>hB",
      -- Open hover docs in a new horizontal split and switch to it
      hsplit = "<leader>hs",
      -- Open hover docs in a new horizontal split and stay where you're at
      hsplit_stay = "<leader>hS",
      -- Open dynamic hover docs in a new horizontal split and switch to it
      hsplit_dynamic = "<leader>hds",
      -- Open dynamic hover docs in a new horizontal split and stay where you're at
      hsplit_dynamic_stay = "<leader>hdS",
      -- Open hover docs in a new vertical split and switch to it
      vsplit = "<leader>hv",
      -- Open hover docs in a new vertical split and stay where you're at
      vsplit_stay = "<leader>hV",
      -- Open dynamic hover docs in a new vertical split and switch to it
      vsplit_dynamic = "<leader>hdv",
      -- Open dynamic hover docs in a new vertical split and stay where you're at
      vsplit_dynamic_stay = "<leader>hdV",
      -- Close currently focused hoverflex buffer/tab/split
      -- or any currently open dynamic split
      close = "<leader>hq",
      -- Close all hoverflex related buffers/tabs/dynamic splits/splits
      close_all = "<leader>hQ",
    },
  },
}
