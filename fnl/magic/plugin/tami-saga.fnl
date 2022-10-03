(module magic.plugin.tami-saga
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             s lspsaga}
   require-macros [magic.macros]})

(s.init_lsp_saga {})

(u.multimap
  #(u.bufmapkey 0 $1 $2 $3)
  ["n" "<leader>rn" ":Lspsaga rename"]
  ["n" "K" ":Lspsaga hover_doc"]
  ["n" "<leader>ca" ":Lspsaga code_action"]
  ["n" "<leader>di" ":Lspsaga show_line_diagnostics"]
  ["n" "<leader>dn" ":Lspsaga diagnostic_jump_next"]
  ["n" "<leader>dp" ":Lspsaga diagnostic_jump_previous"])
