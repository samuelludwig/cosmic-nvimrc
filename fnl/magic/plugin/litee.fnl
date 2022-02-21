(module magic.plugin.litee
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             lit litee.lib}})

(lit.setup
  {:tree {:icon_set "codicons"}
   :panel {:orientation "left"
           :panel_size 30}})
