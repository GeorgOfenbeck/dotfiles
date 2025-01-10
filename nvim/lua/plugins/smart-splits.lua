return {
  {
    "mrjones2014/smart-splits.nvim",
  },

  --[[
  keys = {
    vim.keymap.set("n", "<C-A-S-j>", require("smart-splits").resize_left),
    vim.keymap.set("n", "<C-S-A-,>", require("smart-splits").resize_down),
    vim.keymap.set("n", "<C-S-A-8>", require("smart-splits").resize_up),
    vim.keymap.set("n", "<C-S-A-i>", require("smart-splits").resize_right),
    -- moving between splits
    vim.keymap.set("n", "<C-S-A-h>", require("smart-splits").move_cursor_left),
    vim.keymap.set("n", "<C-S-A-e>", require("smart-splits").move_cursor_down),
    vim.keymap.set("n", "<C-S-A-u>", require("smart-splits").move_cursor_up),
    vim.keymap.set("n", "<C-S-A-a>", require("smart-splits").move_cursor_right),

    -- Keybinds to create new plits
    vim.keymap.set("n", "<C-S-A-6>", "<cmd>vsplit<CR>", { desc = "Create a new vertical split" }),
    vim.keymap.set("n", "<C-S-A-q>", "<cmd>split<CR>", { desc = "Create a new horizontal split" }),
  },
  --]]
}
