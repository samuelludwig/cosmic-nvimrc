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
  ["n" "<leader>ff" sc.find_files]
  ["n" "<leader>fg" sc.live_grep]
  ["n" "<leader>fb" sc.buffers]
  ["n" "<leader>fh" sc.help_tags]
  ["n" "<leader>fp" ext.projects.projects]
  ["n" "<leader>ts" sc.treesitter])

(tscp.setup 
  {:extensions 
   ;; These are defaults for fzf
   {:fzf {:fuzzy true
          :override_generic_sorter true
          :override_file_sorter true
          :case_mode "smart_case"}}})

(tscp.load_extension "fzf")
(tscp.load_extension "projects")
