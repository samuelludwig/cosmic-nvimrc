(module magic.plugin.fugitive
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils}
   require-macros [magic.macros]})

(u.mapkey ["n"] "<leader>com" #(vim.cmd ":Git add . | :Git commit"))
