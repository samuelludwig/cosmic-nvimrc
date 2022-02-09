(module magic.plugin.luasnip
  {autoload {nvim aniseed.nvim
             ls luasnip
             types luasnip.util.types}
   require-macros [magic.macros]})

(ls.config.set_config
  {:history true
   :updateevents "TextChanged,TextChangedI"
   :delete_check_events "TextChanged"
   :ext_opts {types.choiceNode {:active {:virt_text 
                                         [["<-" "Error"]
                                          ["choiceNode" "Comment"]]}}}
   :enable_autosnippets true
   :ext_base_prio 300
   :ext_prio_increase 1})

(defn mapkey [modes bind callback]
  (vim.keymap.set modes bind callback {:silent true}))

(mapkey ["i" "s"] "<c-k>" #(when (ls.expand_or_jumpable) (ls.expand_or_jump)))

(mapkey ["i" "s"] "<c-j>" #(when (ls.jumpable -1) (ls.jump -1)))

(mapkey "i" "<c-l>" #(when (ls.choice_active) (ls.change_choice 1)))

{ls.snippets {:all [(ls.parser.parse_snippet "expand" "--this is what was expanded")]}}

;(mapkey "n" "<leader><leader>s" "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
;;;;
