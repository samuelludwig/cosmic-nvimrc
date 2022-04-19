(module magic.plugin.vim-sexp
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils}
   require-macros [magic.macros]})

(set vim.g.sexp_enable_insert_mode_mappings false)
