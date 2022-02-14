(module magic.utils
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(def- default-keymap-options {:silent true :noremap true})
(defn mapkey [modes bind callback ?opts]
  (vim.keymap.set
    modes
    bind
    callback
    (a.merge default-keymap-options ?opts)))

(defn bufmapkey [bufnr modes bind callback ?opts]
  (mapkey 
    modes 
    bind 
    callback 
    (a.merge default-keymap-options ?opts {:buffer bufnr})))

(defn multimap [mapfunc ...] 
  (a.map #(mapfunc (unpack $)) [...]))

