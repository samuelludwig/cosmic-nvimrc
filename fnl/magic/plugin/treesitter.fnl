(module magic.plugin.treesitter
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             ts nvim-treesitter
             con nvim-treesitter.configs}})

(con.setup
  {:ensure_installed ["clojure" "php" "markdown" "javascript" "java" "comment"
                      "bash" "yaml" "python" "lua" "c" "json" "fennel"]
   :highlight {:enabled true}})
