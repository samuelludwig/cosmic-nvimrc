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

;;; Snippet Definitions
(def snippets
  ;;; ALL
  {:all [(quick-snip :sniptest "WE-ARE-WORKING!!!")
         (s :sheb (fmta "#!/usr/bin/env <runner>" {:runner (i 1 "bash")}))]

   ;;; JANET
   :clojure [(s :de (fmta
                      "(defn <name> [<args>] <body>)"
                      {:name (i 1 "name")
                       :args (i 2 "x")
                       :body (i 3 "nil")}))

             (s :defn (fmta
                        "
                        (defn <name>
                          \"<doc-string>\"
                          [<args>]
                          <body>)
                        "
                        {:name (i 1 "name")
                         :args (i 2 "x")
                         :doc-string (i 3 "TODO: Document")
                         :body (i 4 "nil")}))

             (s :defmulti (fmta
                           "
                           (defmulti <name>
                             \"<doc-string>\"
                             <dispatch-function>)
                           "
                           {:name (i 1 "name")
                            :doc-string (i 2 "TODO: Document")
                            :dispatch-function (i 3 ":dispatch-fn")}))

             (s :mul (fmta
                      "
                      (defmulti <name>
                        \"<doc-string>\"
                        <dispatch-function>)
                      "
                      {:name (i 1 "name")
                       :doc-string (i 2 "TODO: Document")
                       :dispatch-function (i 3 ":dispatch-fn")}))

             (s :defmethod (fmta
                            "
                            (defmethod <multifn-name> <dispatch-val>
                              <body>)
                            "
                            {:multifn-name (i 1 "multifn-name")
                             :dispatch-val (i 2 ":default")
                             :body (i 3 "nil")}))

             (s :meth (fmta
                       "
                       (defmethod <multifn-name> <dispatch-val>
                         <body>)
                       "
                       {:multifn-name (i 1 "multifn-name")
                        :dispatch-val (i 2 ":default")
                        :body (i 3 "nil")}))

             (s :let (fmta
                      "
                      (let [<bindings>]
                        <forms>)
                      "
                      {:bindings (i 1 "bind :ings")
                       :forms (i 2 "nil")}))

             (s :red (fmta
                      "
                      (reduce
                        <f>
                        <init>
                        <coll>)
                      "
                      {:f (i 1 "(fn [x] x)")
                       :init (i 2 "[]")
                       :coll (i 3 "[1 2 3]")}))

             (s :trans (fmta
                        "(transduce <xf> <reducing-fn> <coll>)"
                        {:xf (i 1 "xf")
                         :reducing-fn (i 2 "conj")
                         :coll (i 3 "[1 2 3]")}))

             (s :if (fmta
                      "(if <condition> <then> <else>)"
                      {:condition (i 1 "(true? true)")
                       :then (i 2 "true")
                       :else (i 3 "false")}))]

   ;;; FENNEL
   :fennel [(s :de
               (fmta
                "(defn <name> [<args>] <body>)"
                {:name (i 1 "name")
                 :args (i 2 "x")
                 :body (i 3 "nil")}))

            (s :doc (fmta
                      "
                     \"
                     <docstring>
                     \"
                     "
                      {:docstring (i 1 "TODO: Document")}))

            (s :if (fmta
                    "
                    (if <condition> <then> <else>)
                    "
                    {:condition (i 1 "(true? true)")
                     :then (i 2 "true")
                     :else (i 3 "false")}))

            (s :anim (fmta
                       "
                       (module <mod-name>
                         {autoload {nvim aniseed.nvim
                                    a aniseed.core}})


                       "
                       {:mod-name (i 1 "module-name")}))

            (s :anip (fmta
                       "
                       (module magic.plugin.<mod-name>
                         {autoload {nvim aniseed.nvim
                                    a aniseed.core
                                    u magic.utils
                                    <plugin-alias> <plugin-name>}})


                       "
                       {:mod-name (i 1 "module-name")
                        :plugin-alias (i 2 "plugin-alias")
                        :plugin-name (i 3 "plugin-name")}))]

   ;;; JANET
   :janet [(s :de (fmta
                    "(defn <name> [<args>] <body>)"
                    {:name (i 1 "name")
                     :args (i 2 "x")
                     :body (i 3 "nil")}))

           (s :doc (fmta
                      "
                     ``
                     <docstring>
                     ``
                     "
                      {:docstring (i 1 "TODO: Document")}))

           (s :if (fmta
                    "
                    (if <condition> <then> <else>)
                    "
                    {:condition (i 1 "(true? true)")
                     :then (i 2 "true")
                     :else (i 3 "false")}))]

   ;;; PHP
   :php [(s :newfi (fmt
                     "
                     <?php declare (strict_types=1); namespace {namespace};
                     require_once __DIR__ . '/{vendor-path}/vendor/autoload.php';
                     require_once __DIR__ . '/{relative-path}.php';

                     "
                     {:namespace (i 1 "MyNamespace")
                      :vendor-path (i 2 "..")
                      :relative-path (i 3 "path-to-file")}))

         (s :** (fmta
                   "
                    /**
                     * <docstring>
                     */
                    " {:docstring (i 1 "TODO: Document")}))

         (s :php (fmt
                   "
                  <?php

                  " {}))

         (s :it (fmta
                  "
                  it(<description>, function () {
                  \t<the-test>
                  });
                  "
                  {:description (i 1 "\"asserts true is true\"")
                   :the-test (i 2 "$this->assertTrue(true);")}))

         (s :tst (fmta
                   "
                   test(<description>, function () {
                   \t<the-test>
                   });
                   "
                   {:description (i 1 "\"asserts true is true\"")
                    :the-test (i 2 "$this->assertTrue(true);")}))

         (s :ro (fmta
                  "require_once __DIR__ . '/<relative-path>.php';"
                  {:relative-path (i 1 "path-to-file")}))

         (s :fun (fmta
                   "
                   function <name> (<args>): <type> {
                   \t<body>
                   }
                   "
                              {:name (i 1 "name")
                               :args (i 2 "$x")
                               :type (i 3 "bool")
                               :body (i 4 "return true;")}))

         (s :fn (fmt "fn ({x}) => {transformation}"
                      {:x (i 1 "$x") :transformation (i 2 "$y")}))

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

;; Replacement for now-deprecated (set ls.snippets <snip-table>)
(ls.add_snippets nil snippets)

(set ls.autosnippets
     {:all [(s :autotrigger [(t "autosnippet")])]})
