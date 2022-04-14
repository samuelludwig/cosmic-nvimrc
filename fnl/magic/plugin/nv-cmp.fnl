(module magic.plugin.nv-cmp
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
  (luasnip.lsp_expand (. args :body)))

(def completion-mappings
  {"<C-Space>" (c.mapping.complete)
   "<C-s>" (c.mapping.scroll_docs 4)
   "<C-a>" (c.mapping.scroll_docs -4)
   "<C-i>" (c.mapping.abort)
   "<CR>" (c.mapping.confirm {:select true})})

(def sources
  [:nvim_lsp
   :luasnip
   :conjure])

(def as-name-pair #(a.identity {:name $}))

(c.setup {:snippet {:expand snippet-expand-fn}
          :window {}
          :mapping (c.mapping.preset.insert completion-mappings)
          :sources (c.config.sources
                     (a.map as-name-pair sources)
                     {:name :buffer})})

(c.setup.filetype "gitcommit"
                  {:sources (c.config.sources {:name :cmp_git}
                                              {:name :buffer})})

(c.setup.cmdline "/" {:mapping (c.mapping.preset.cmdline)
                      :sources {:name :buffer}})

(c.setup.cmdline ":" {:mapping (c.mapping.preset.cmdline)
                      :sources (c.config.sources {:name :path}
                                                 {:name :cmdline})})

(def lsp-capabilities
 (lsp-cmp.update_capabilities
   (vim.lsp.protocol.make_client_capabilities)))

;; TODO: Deduplicate
(def servers ["intelephense"]
              ;"phpactor"
             "clojure_lsp"
             "tsserver")

(defn- setup-server [server]
  (let [s (. lspc server)]
    (s.setup {:capabilities lsp-capabilities})))

(a.map setup-server servers)
