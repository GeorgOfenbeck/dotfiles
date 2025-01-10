return {
  { "nvim-neo-tree/neo-tree-nvim", enabled = false },
  {
    "echasnovski/mini.files",
    opts = {
      options = {
        use_as_default_explorer = true,
      },
      mappings = {
        go_in = "<Right>",
        go_out = "<Left>",
      },
    },
  },
}
