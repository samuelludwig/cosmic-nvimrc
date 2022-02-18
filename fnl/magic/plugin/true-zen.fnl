(module magic.plugin.true-zen
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             tz true-zen}})

(tz.setup {})

(u.multimap 
  u.mapkey
  ["n" "<leader>cc" "<cmd>TZAtaraxis<CR>"]
  ["n" "<leader>uu" "<cmd>TZFocus<CR>"])



