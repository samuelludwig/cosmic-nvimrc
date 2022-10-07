(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             tscp telescope
             sc telescope.builtin}})

(def ext tscp.extensions)

;; Base keybinds for Telescope
(u.multimap
  u.mapkey
  ["n" "<leader>ff" sc.find_files {:desc "Find files"}]
  ["n" "<leader>fg" sc.live_grep {:desc "Live grep"}]
  ["n" "<leader>fb" sc.buffers {:desc "Search buffers"}]
  ["n" "<leader>fh" sc.help_tags {:desc "Search help tags"}]
  ["n" "<leader>fp" ext.projects.projects {:desc "Search projects"}]
  ["n" "<leader>ts" sc.treesitter {:desc "Search TS symbols"}]
  ["n" "<leader>fm" sc.marks {:desc "Search marks"}])

(tscp.setup
  {:extensions
   ;; These are defaults for fzf
   {:fzf {:fuzzy true
          :override_generic_sorter true
          :override_file_sorter true
          :case_mode "smart_case"}}})

(tscp.load_extension "fzf")
(tscp.load_extension "projects")
