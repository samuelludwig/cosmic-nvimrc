(module magic.plugin.gitsigns-nvim
  {autoload {a aniseed.core
             nvim aniseed.nvim
             gs gitsigns
             u magic.utils}
   require-macros [magic.macros]})

(gs.setup
  {:on_attach
   (fn [bufnr]
     (let [signs package.loaded.gitsigns]
       (do
         (u.multimap u.bufmapkey
                     [bufnr ["n" "v"] "<leader>hs" ":Gitsigns stage_hunk<CR>"]
                     [bufnr ["n" "v"] "<leader>hr" ":Gitsigns reset_hunk<CR>"]
                     [bufnr ["n" "v"] "<leader>hu" signs.undo_stage_hunk]))))})
