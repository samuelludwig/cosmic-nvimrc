(module magic.plugin.obsidian-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             o obsidian}
   require-macros [magic.macros]})

(o.setup {:dir "~/obsidian-core"
          :completion {:nvim_cmp true}})
