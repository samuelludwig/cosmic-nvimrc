(module magic.plugin.nulls
  {autoload {a aniseed.core
             nvim aniseed.nvim
             nls null-ls}
   require-macros [magic.macros]})

(def bi nls.builtins)
(def ca bi.code_actions)
(def com bi.completion)
(def fmt bi.formatting)
(def dia bi.diagnostics)

(nls.setup {:sources [ca.gitsigns
                      ;com.luasnip
                      fmt.cljstyle
                      fmt.fnlfmt]})
