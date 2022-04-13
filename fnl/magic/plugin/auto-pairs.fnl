(module magic.plugin.auto-pairs
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

;; For our Lisps, this plugin is partially supplanted by `parinfer`, however,
;; parinfer doesn't concern itself with quotes and what-not, so we won't be
;; nixing this plugin quite yet, and instead merely deactivate the redundant
;; parts for lisps.


;; Re-evaluate 
(defn setup []
  (let [auto-pairs nvim.g.AutoPairs]
    (tset auto-pairs "'" nil) ; ' is used in macros
    (tset auto-pairs "`" nil) ; ` is used in macros as well
    (tset auto-pairs "(" nil) ; supplanted by parinfer
    (tset auto-pairs "[" nil) ; supplanted by parinfer
    (tset auto-pairs "{" nil) ; supplanted by parinfer
    (set nvim.b.AutoPairs auto-pairs)))

(augroup auto-pairs-config
  (nvim.ex.autocmd
    :FileType "clojure,clj,fennel,scheme,janet"
    (.. "call v:lua.require('" *module-name* "').setup()")))

