-- Global LSP Keybindings
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename Variable" })

-- Gobal keybind
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Quit Neovim
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit Neovim" })

-- Quit without saving (Force quit)
vim.keymap.set("n", "<leader>Q", "<cmd>q!<cr>", { desc = "Force Quit (no save)" })
-- Go to Home Dashboard (Alpha)
vim.keymap.set("n", "<leader>h", "<cmd>Alpha<cr>", { desc = "Go to Home Page" })

-- Paste from system clipboard in Insert Mode
vim.keymap.set("i", "<C-v>", '<Esc>"+pa', { desc = "Paste from clipboard" })
local keymap = vim.keymap

-- Smart Tree Focus: 
-- If tree is closed, open it. 
-- If tree is open but you are in a file, jump to the tree.
-- If you are already in the tree, close it.
vim.keymap.set("n", "<leader>t", function()
  local view = require("nvim-tree.view")
  if view.is_visible() then
    if vim.api.nvim_get_current_buf() == view.get_bufnr() then
      require("nvim-tree.api").tree.close()
    else
      require("nvim-tree.api").tree.focus()
    end
  else
    require("nvim-tree.api").tree.open()
  end
end, { desc = "Smart Tree Toggle/Focus" })
-- Open a Terminal
-- This opens a terminal in a new horizontal split at the bottom
keymap.set("n", "<leader>w", "<cmd>split | term<cr>A", { desc = "Open Terminal" })

-- Exit terminal mode with Esc
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })


-- Better Hover for Rust (shows types and detailed docs)
vim.keymap.set("n", "K", function()
  vim.cmd.RustLsp('hover', 'actions')
end, { desc = "LSP Hover Actions" })

-- Show line diagnostics in a floating window
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Previous Buffer" })

-- Close current buffer
vim.keymap.set("n", "<leader>c", ":bd<CR>", { desc = "Close Buffer" })

-- Search through open buffers
vim.keymap.set("n", "<leader>fb", require('telescope.builtin').buffers, { desc = "Find Buffers" })
