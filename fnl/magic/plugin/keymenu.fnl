(module magic.plugin.keymenu
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             k key-menu}
   require-macros [magic.macros]})

(k.set "n" "<Space>")
(k.set "n" "<Space>f" {:desc "Foldlevel/Find..."})
