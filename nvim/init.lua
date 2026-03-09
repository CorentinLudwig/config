vim.opt.number = true         -- Show line numbers
-- vim.opt.relativenumber = true -- Relative line numbers
vim.opt.shiftwidth = 4        -- Tab size
vim.g.mapleader = " "         -- Set space as your leader key
vim.g.maplocalleader = " "
-- Sync Neovim clipboard with system clipboard
vim.opt.clipboard = "unnamedplus"
-- Set leader key before lazy (important!)

vim.diagnostic.config({
  virtual_text = {
    -- Show the source (rust-analyzer) and the error code (E0308)
    source = "always", 
    prefix = "●",
    -- Optional: Only show the message for the current line to reduce noise
    -- current_line = true, 
  },
  float = {
    -- This makes the pop-up window (leader + d) show the source and code too
    source = "always",
    border = "rounded",
  },
  -- Show errors even while you are typing (can be distracting, set to false to wait for save)
  update_in_insert = true,
  severity_sort = true,
})



require("config-lazy")

-- Load your custom keymaps
require("config.keymaps")

print("Welcome to your fresh Neovim!")
