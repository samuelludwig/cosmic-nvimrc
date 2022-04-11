(module magic.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             lspc lspconfig}})

(def- ls vim.lsp.buf)
(def- dia vim.diagnostic)

;; Base keybinds for navigating diagnostics
(u.multimap
  u.mapkey
  ["n" "<leader>e" dia.open_float]
  ["n" "[d" dia.goto_prev]
  ["n" "]d" dia.goto_next]
  ["n" "<leader>q" dia.setloclist])

(defn- on-attach [client bufnr]
  (let [bind #(u.bufmapkey bufnr $1 $2 $3)]
    (u.multimap
      bind
      ["n" "gD" ls.declaration]
      ["n" "gd" ls.definition]
      ["n" "K" ls.hover]
      ["n" "gi" ls.implementation]
      ["n" "<C-k>" ls.signature_help]
      ["n" "<leader>wa" ls.add_workspace_folder]
      ["n" "<leader>wr" ls.remove_workspace_folder]
      ["n" "<leader>wl" ls.add_workspace_folder]
      ["n" "<leader>wa" #(-> (ls.list_workspace_folders) vim.inspect print)]
      ["n" "<leader>D" ls.type_definition]
      ["n" "<leader>rn" ls.rename]
      ["n" "<leader>ca" ls.code_action]
      ["n" "gr" ls.references]
      ["n" "<leader>z" ls.formatting])))

(def- servers ["intelephense"
               ;"phpactor"
               "clojure_lsp"
               "tsserver"])

(defn- setup-server [server]
  (let [s (. lspc server)]
    (s.setup
      {:on_attach on-attach
       :flags {:debounce_text_changes 150}})))

(a.map setup-server servers)
