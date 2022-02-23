(module magic.plugin.blankline
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             bl indent_blankline}})

(set vim.opt.list true)

(bl.setup {:space_char_blankline " "
           :show_current_context true
           :show_current_context_start true})

(set nvim.g.indent_blankline_filetype ["php" "js" "lua"])
