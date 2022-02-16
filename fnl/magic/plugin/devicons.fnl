(module magic.plugin.devicons
  {autoload {nvim aniseed.nvim
             icons nvim-web-devicons
             a aniseed.core
             u magic.utils}
   require-macros [magic.macros]})


(icons.setup 
  {:override {}
   :default true})
