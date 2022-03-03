(module magic.plugin.modes-nvim
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             mds modes}})

(set vim.opt.cursorline true)
(mds.setup {})
