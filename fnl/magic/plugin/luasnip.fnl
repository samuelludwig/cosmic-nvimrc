(module magic.plugin.luasnip
  {autoload {nvim aniseed.nvim
             ls luasnip
             extras luasnip.extras
             formatting luasnip.extras.fmt
             types luasnip.util.types
             conds luasnip.extras.expand_conditions}
   require-macros [magic.macros]})

;;; Some Shorthands

(def s ls.snippet)
(def sn ls.snippet_node)
(def t ls.text_node)
(def i ls.insert_node)
(def f ls.function_node)
(def c ls.choice_node)
(def d ls.dynamic_node)
(def r ls.restore_node)
(def l extras.lambda)
(def rep extras.rep)
(def p extras.partial)
(def m extras.match)
(def n extras.nonempty)
(def dl extras.dynamic_lambda)
(def fmt formatting.fmt)
(def fmta formatting.fmta)


;;; Config

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

;(mapkey "n" "<leader><leader>s" "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")


;;; Snippets

(def quick-snip ls.parser.parse_snippet)

{ls.snippets 
   {:all [(quick-snip "expand" ";; this is what was expanded")]
    :fnl [(s :defn [(t "(defn [") (i 1) (t "] ") (i 2) (t ")")])]
    :janet []
    :php []}
 ls.autosnippets {}}
