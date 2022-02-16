
(module magic.plugin.telescope
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             tscp telescope
             sc telescope.builtin}})

;; Base keybinds for Telescope
(u.multimap 
  u.mapkey
  ["n" "<leader>ff" sc.find_files]
  ["n" "<leader>fg" sc.live_grep]
  ["n" "<leader>fb" sc.buffers]
  ["n" "<leader>fh" sc.help_tags])

(tscp.setup {})
;(tscp.load_extension "fzy_native")
