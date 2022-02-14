(module magic.plugin.luasnip
  {autoload {nvim aniseed.nvim
             ls luasnip
             a aniseed.core
             u magic.utils
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

(u.mapkey ["i" "s"] "<tab>" #(when (ls.expand_or_jumpable) (ls.expand_or_jump)))

(u.mapkey ["i" "s"] "<S-tab>" #(when (ls.jumpable -1) (ls.jump -1)))

(u.mapkey "i" "<c-l>" #(when (ls.choice_active) (ls.change_choice 1)))

;; With conjure this becomes unneeded, as I can simply reevaluate this buffer
;; via `,eb` and reload everything
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
(def clojure-style-function-def 
  (fmta
    "(defn <name> [<args>] <body>)"
    {:name (i 1 "name")
     :args (i 2 "x")
     :body (i 3 "nil")}))
(def lisp-style-if-def
  (fmta
    "
    (if <condition> <then> <else>)
    "
    {:condition (i 1 "(true? true)") 
     :then (i 2 "true") 
     :else (i 3 "false")}))

;;; Snippet Definitions
(set ls.snippets
  ;;; ALL
  {:all [(quick-snip :sniptest "WE-ARE-WORKING!!!")
         (s :sheb (fmta "!#/usr/bin/env <runner>" {:runner (i 1 "bash")}))]

   ;;; FENNEL
   :fennel [(s :de clojure-style-function-def)

            (s :doc (fmta 
                      "
                     \"
                     <docstring>
                     \"
                     "
                      {:docstring (i 1 "TODO: Document")}))

            (s :if lisp-style-if-def)]

   ;;; JANET
   :janet [(s :de clojure-style-function-def)

           (s :doc (fmta 
                      "
                     ``
                     <docstring>
                     ``
                     "
                      {:docstring (i 1 "TODO: Document")}))

           (s :if lisp-style-if-def)]

   ;;; PHP
   :php [(s :fun (fmta
                   "
                   function <name> (<args>): <type> {
                   \t<body>
                   }
                   "
                   {:name (i 1 "name") 
                    :args (i 2 "$x") 
                    :type (i 3 "bool") 
                    :body (i 4 "return true;")}))

         (s :if (fmta
                  "
                  if (<condition>) { 
                  \t<then>
                  }
                  "
                  {:condition (i 1 "true") :then (i 2 "return true;")}))

         (s :ife (fmta
                  "
                  if (<condition>) { 
                  \t<then>
                  } else {
                  \t<else>
                  }
                  "
                  {:condition (i 1 "true") 
                   :then (i 2 "return true;") 
                   :else (i 3 "return false;")}))]})

(set ls.autosnippets 
     {:all [(s :autotrigger [(t "autosnippet")])]})
