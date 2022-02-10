(module magic.plugin.luasnip
  {autoload {nvim aniseed.nvim
             ls luasnip
             a aniseed.core
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

(mapkey ["i" "s"] "<tab>" #(when (ls.expand_or_jumpable) (ls.expand_or_jump)))

(mapkey ["i" "s"] "<S-tab>" #(when (ls.jumpable -1) (ls.jump -1)))

(mapkey "i" "<c-l>" #(when (ls.choice_active) (ls.change_choice 1)))

;(mapkey "n" "<leader><leader>s" "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")


;;; Snippets

;; VSCode style snippet definition
(def quick-snip ls.parser.parse_snippet)

(def spc (t " "))
(def left-sqr (t "["))
(def right-sqr (t "]"))
(def left-paren (t "("))
(def right-paren (t ")"))
(def double-backtick (t "``"))
(def func-def (t "defn"))
(def var-def (t "def"))
;; map bare text to (t "$bare-text")?
(defn- lisp-assignment [position ?default-val] [left-sqr (i position ?default-val) right-sqr])
(set ls.snippets
     {:all [(quick-snip :sniptest "WE-ARE-WORKING!!!")]
      :fennel [(s :defn (a.concat 
                           [left-paren func-def spc (i 1 :name) spc] 
                           (lisp-assignment 2 :x)
                           [spc (i 3) right-paren]))
               (s :doc (a.concat
                         [(t "``" "") (i 1 "TODO: Document") (t "" "``")]))]
      :janet []
      :php []})
(set ls.autosnippets 
     {:all [(s :autotrigger [(t "autosnippet")])]})
