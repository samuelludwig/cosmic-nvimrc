(module magic.plugin.gitsigns-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             gs gitsigns}
   require-macros [magic.macros]})

(gs.setup)
