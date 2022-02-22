(module magic.plugin.rosepine
  {autoload {nvim aniseed.nvim
             a aniseed.core
             u magic.utils
             rp rose-pine}})

(rp.setup
  {:dark_variant "main" ;;;@usage "main"|"moon"
   :bold_vert_split false
   :dim_nc_background false
   :disable_background false
   :disable_float_background false
   :disable_italics false

   ;;;@usage string hex value or named color from rosepinetheme.com/palette
   :groups {:border "highlight_med"
            :comment "muted"
            :link "iris"
            :punctuation "subtle"

            :error "love"
            :hint "iris"
            :info "foam"
            :warn "gold"

            :headings {:h1 "iris"
                       :h2 "foam"
                       :h3 "rose"
                       :h4 "gold"
                       :h5 "pine"
                       :h6 "foam"}}})

                     ;; or set all headings at once
                     ;; :headings "subtle"}}})

