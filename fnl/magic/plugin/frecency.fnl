(module magic.plugin.frecency
  {autoload {nvim aniseed.nvim
             u magic.utils
             scp telescope}})

(scp.load_extension "frecency")
(u.mapkey "n" "<leader>fr"
          scp.extensions.frecency.frecency
          {:desc "Search frecency"})
