(module magic.plugin.lspconfig
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             lspc lspconfig
             saga lspsaga}})

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
      ;["n" "K" ls.hover] ; replaced by lspsaga
      ["n" "gi" ls.implementation]
      ["n" "<C-k>" ls.signature_help]
      ["n" "<leader>wa" ls.add_workspace_folder]
      ["n" "<leader>wr" ls.remove_workspace_folder]
      ["n" "<leader>wl" ls.add_workspace_folder]
      ["n" "<leader>wa" #(-> (ls.list_workspace_folders) vim.inspect print)]
      ["n" "<leader>D" ls.type_definition]
      ;["n" "<leader>rn" ls.rename] ; replaced by lspsaga
      ;["n" "<leader>ca" ls.code_action] ; replaced by lspsaga
      ["n" "gr" ls.references]
      ["n" "<leader>z" ls.formatting]
      ["n" "<leader>rn" "<cmd>Lspsaga rename<cr>"]
      ["n" "K" "<cmd>Lspsaga hover_doc<cr>"]
      ["n" "<leader>ca" "<cmd>Lspsaga code_action<cr>"]
      ["n" "<leader>di" "<cmd>Lspsaga show_line_diagnostics<cr>"]
      ["n" "<leader>dn" "<cmd>Lspsaga diagnostic_jump_next<cr>"]
      ["n" "<leader>dp" "<cmd>Lspsaga diagnostic_jump_previous<cr>"]
      ["x" "<leader>ca" ":<c-u>Lspsaga range_code_action<cr>"])))

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
