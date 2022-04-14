(module magic.plugin.cmp
  {autoload {a aniseed.core
             nvim aniseed.nvim
             u magic.utils
             c cmp
             luasnip luasnip
             lsp-cmp cmp_nvim_lsp
             lspc lspconfig}
   require-macros [magic.macros]})

(set vim.o.completeopt "menu,menuone,noselect")

(defn- snippet-expand-fn [args]
  (luasnip.lsp_expand (. args body)))

(def- completion-mappings
  {"<C-Space>" (cmp.mapping.complete)
   "<C-s>" (cmp.mapping.scroll_docs 4)
   "<C-a>" (cmp.mapping.scroll_docs -4)
   "<C-i>" (cmp.mapping.abort)
   "<CR>" (cmp.mapping.confirm {:select true})})

(def- sources
  [:nvim_lsp
   :luasnip
   :conjure])

(def- as-name-pair #(a.identity {:name $}))

(cmp.setup {:snippet {:expand snippet-expand-fn}
            :window {}
            :mapping (cmp.mapping.preset.insert completion-mappings)
            :sources (cmp.config.sources
                       (a.map as-name-pair sources)
                       {:name :buffer})})

(cmp.setup.filetype "gitcommit"
                    {:sources (cmp.config.sources {:name :cmp_git}
                                                  {:name :buffer})})

(cmp.setup.cmdline "/" {:mapping cmp.mapping.preset.cmdline
                        :sources {:name :buffer}})

(cmp.setup.cmdline ":" {:mapping cmp.mapping.preset.cmdline
                        :sources (cmp.config.sources {:name :path}
                                                     {:name :cmdline})})

(def lsp-capabilities
  (lsp-cmp.update_capabilites (vim.lsp.protocol.make_client_capabilities)))

;; TODO: Deduplicate
(def- servers ["intelephense"
               ;"phpactor"
               "clojure_lsp"
               "tsserver"])

(defn- setup-server [server]
  (let [s (. lspc server)]
    (s.setup {:capabilities lsp-capabilities})))

(a.map setup-server servers)
