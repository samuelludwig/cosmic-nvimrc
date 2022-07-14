(module magic.utils
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(def- default-keymap-options {:silent true :noremap true})

(defn not-nil? [x] (not (a.nil? x)))

(defn unless [predicate body] (when (not predicate) body))

(defn run-cmd [cmd-map] (vim.api.nvim_cmd cmd-map {}))

(defn safe-mapkey [modes bind callback ?opts]
  ;; If the callback does not exist, don't attempt to map it
  (unless (a.nil? callback) 
    (vim.keymap.set
       modes
       bind
       callback
       (a.merge default-keymap-options ?opts))))

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

