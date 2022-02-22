(module magic.plugin.solarized
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             sol solarized}})

;; Example config
(set vim.g.solarized_italic_comments true)
(set vim.g.solarized_italic_keywords true)
(set vim.g.solarized_italic_functions true)
(set vim.g.solarized_italic_variables false)
(set vim.g.solarized_contrast true)
(set vim.g.solarized_borders false)
(set vim.g.solarized_disable_background true)
