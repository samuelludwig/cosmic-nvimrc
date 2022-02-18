(module magic.plugin.trouble-nvim
  {autoload {nvim aniseed.nvim
             trbl trouble
             u magic.utils}})

(trbl.setup {})

(u.multimap
  u.mapkey
  ["n" "<leader>xx" trbl.toggle]
  ["n" "<leader>xw" #(trbl.toggle :workspace_diagnostics)])
