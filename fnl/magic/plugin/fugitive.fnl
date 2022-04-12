(module magic.plugin.fugitive
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils}
   require-macros [magic.macros]})

(u.mapkey ["n"] "<leader>com" #(vim.cmd ":Git add . | :Git commit"))
(u.mapkey ["v"] "<leader>co" #(vim.cmd ":Gitsigns stage_hunk | :Git commit"))
