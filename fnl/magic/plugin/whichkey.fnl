(module magic.plugin.whichkey
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             w which-key}
   require-macros [magic.macros]})

(w.setup {})
