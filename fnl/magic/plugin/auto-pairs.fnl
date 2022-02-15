(module magic.plugin.auto-pairs
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

;; Re-evaluate 
(defn setup []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil)
    (tset auto-pairs "`" nil)
    (tset auto-pairs "(" nil) ; supplanted by parinfer
    (tset auto-pairs "[" nil) ; supplanted by parinfer
    (tset auto-pairs "{" nil) ; supplanted by parinfer
    (set nvim.b.AutoPairs auto-pairs)))

(augroup auto-pairs-config
  (nvim.ex.autocmd
    :FileType "clojure,fennel,scheme,janet"
    (.. "call v:lua.require('" *module-name* "').setup()")))

