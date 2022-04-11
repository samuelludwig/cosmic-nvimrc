(module magic.plugin.ts-textobjects
  {autoload {a aniseed.core
             nvim aniseed.nvim
             ts nvim-treesitter.configs}
   require-macros [magic.macros]})

(def conf
  {:textobjects {:select {:enable true
                          :lookahead true
                          :keymaps {:af "@function.outer"
                                    :if "@function.inner"
                                    :ac "@class.outer"
                                    :ic "@class.inner"}}
                  :swap {:enable true
                         :swap_next {"<leader>a" "@parameter.inner"}
                         :swap_previous {"<leader>A" "@parameter.inner"}}
                  :move {:enable true
                         :set_jumps true
                         :goto_next_start {"]m" "@function.outer"}
                         :goto_next_end {"]M" "@function.outer"}
                         :goto_previous_start {"[m" "@function.outer"}
                         :goto_previous_end {"[M" "@function.outer"}}
                  :lsp_interop {:enable true
                                :border "none"
                                :peek_definition_code {"<leader>df" "@function.outer"}}}})

(ts.setup conf)
