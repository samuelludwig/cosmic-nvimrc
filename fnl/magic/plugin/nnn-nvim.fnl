(module magic.plugin.nnn-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             n nnn}
   require-macros [magic.macros]})

(n.setup)
