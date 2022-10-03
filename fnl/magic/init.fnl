(module magic.init
  {autoload {plugin magic.plugin
             nvim aniseed.nvim
             a aniseed.core
             eval aniseed.eval
             fs aniseed.fs
             u magic.utils
             scratch magic.scratch}})

;;;; Introduction

;;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;;; directory. The init.lua file is configured to load this file when ready.

;;; We'll use modules, macros and functions to define our configuration and
;;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;;; restart Neovim.

;;; You can learn all about Conjure and how to evaluate things by executing
;;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

;; Maybe have this only be active in .md/.txt/.wiki buffers?
;(nvim.ex.set :spell)
(nvim.ex.set :list)


;;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; Lets us re-enter normal mode in the typical fashion while in a term buffer
(u.mapkey [:t] :<Esc> :<C-\><C-n>)

;;;; Plugins

;;; Run script/sync.sh to update, install and clean your plugins.
;;; Packer configuration format: https://github.com/wbthomason/packer.nvim

;;; The `plugin.use` function will map the table belonging to a plugin-name to
;;; the typical format Packer will expect, for example:
;;;
;;;   the option `:requires ["someone/some-other-plugin" "me/my-own-plugin"]`
;;;   will map to `requires = {"someone/some-other-plugin", "me/my-own-plugin"}`
;;;
;;; However, there is a particular little "extra" provided: the `mod` option.
;;; Providing the option `:mod :<name>` will see Packer take the contents of
;;; `fnl/magic/plugin/<name>`, and use them as if they were specified in the
;;; `config` element for that plugin, with a layer of error-tolerance added on
;;; top, so that everything won't come crashing down if your config is a little
;;; scuffed.
;;;
;;; See `magic/plugin.fnl` for the function definition and further details.

(plugin.use
  ;; Criticals
  :Olical/aniseed {:tag "v3.31.0"}
  :Olical/conjure {:commit "0c91dd3c8c994f1cef3f91356133b971ffaf52c3"}



  ;; Preloadeds
  :PeterRincker/vim-argumentative {:commit "63a5f7deb675c38126de626f4c00e000902462fe"}
  :clojure-vim/clojure.vim {:commit "b21188c407acb3f6b35116ea84daa82348d4edf9"}
  :clojure-vim/vim-jack-in {:commit "5467e00e26f15680b0a7998f8aa20d5a7dd44cd5"}
  ;:easymotion/vim-easymotion {}
  :folke/which-key.nvim {:commit "6885b669523ff4238de99a7c653d47b081b5506d"}
  :guns/vim-sexp {:mod :vim-sexp
                  :commit "14464d4580af43424ed8f2614d94e62bfa40bb4d"}
  :itchyny/lightline.vim {:commit "b02ef0d9f253dfc1cbb3f340b74998d7a4db0bf6"}
  :jiangmiao/auto-pairs {:mod :auto-pairs
                         :commit "39f06b873a8449af8ff6a3eee716d3da14d63a76"}
  :gpanders/nvim-parinfer {:commit "82bce5798993f4fe5ced20e74003b492490b4fe8"}
  ;; TODO: check out https://github.com/eraserhd/parinfer-rust
  :junegunn/fzf {:tag "0.34.0"}
  :junegunn/fzf.vim {:commit "9ceac718026fd39498d95ff04fa04d3e40c465d7"}
  :liuchengxu/vim-better-default {:mod :better-default
                                  :commit "6acbe5236238340e64164f5823d1319886b88868"}
  :mbbill/undotree {:commit "bf76bf2d1a097cda024699738286fa81fb6529ac"}
  :radenling/vim-dispatch-neovim {:commit "c8c4e21a95c25032a041002f9bf6e45a75a73021"}
  :srcery-colors/srcery-vim {:commit "0ff514ff249d0e6b6cc4702d6606f196e3827fc8"}
  :tpope/vim-abolish {:commit "3f0c8faadf0c5b68bcf40785c1c42e3731bfa522"}
  :tpope/vim-commentary {:commit "3654775824337f466109f00eaf6759760f65be34"}
  :tpope/vim-dispatch {:commit "00e77d90452e3c710014b26dc61ea919bc895e92"}
  :tpope/vim-eunuch {:commit "cc564695076d89b3d1e06b2693fca788cfbc5910"}
  :tpope/vim-repeat {:commit "24afe922e6a05891756ecf331f39a1f6743d3d5a"}
  :tpope/vim-sexp-mappings-for-regular-people {:commit "7c3de2f13422fb4b62b4c34a660532c7b3d240c7"}
  :tpope/vim-sleuth {:commit "1d25e8e5dc4062e38cab1a461934ee5e9d59e5a8"}
  :tpope/vim-surround {:commit "bf3480dc9ae7bea34c78fbba4c65b4548b5b1fea"}
  :tpope/vim-unimpaired {:commit "efdc6475f7ea789346716dabf9900ac04ee8604a"}
  :tpope/vim-vinegar {:commit "bb1bcddf43cfebe05eb565a84ab069b357d0b3d6"}
  :dense-analysis/ale {:mod :ale
                       :commit "a33960eb51b638f232dff71cfeac5ede87b38312"}



  ;; Colorschemes
  :yorik1984/newpaper.nvim {:commit "ff3b92fb3e5713d393b63ae86abec3d8b4e9525e"}
  ;:shaunsingh/oxocarbon.nvim {:run "./install.sh" :disable true} ; replaced w/lua-version
  :B4mbus/oxocarbon-lua.nvim {:commit "c3f7fafe0ded3c28256b658eb2a545a26677f082"}
  :Yagua/nebulous.nvim {:commit "9149e828d788703e1feecb18dbde4d911133d287"}
  :EdenEast/nightfox.nvim {:commit "59c3dbcec362eff7794f1cb576d56fd8a3f2c8bb"}
  :Mofiqul/adwaita.nvim {:commit "230e1808045c70e7d6eda2eed9f1439a7474b309"}
  :Th3Whit3Wolf/space-nvim {:mod :space-nvim
                            :commit "9c4f5857acf51aa6d4924f3f2ccabb079799e7f6"}
  :VonHeikemen/little-wonder {:commit "c4bd0f9f5fb917da59827a34027d49fa69f37c76"}
  :elianiva/gitgud.nvim {:commit "15117956e33eadc1f266d110b044c178a2f655f9"}
  :hardselius/warlock {:commit "12c7772d35fd6956940d716bb71c9f3855a45a12"}
  :kristijanhusak/cosmic_latte {:commit "c6d722c6b13516c1e439438e87959b429ec2a903"}
  :Mitgorakh/snow {:commit "65605c4290e99697255bd22e9daf1909f8cf5a3c"}
  :katawful/kat.nvim {:commit "71492f13a26d7e191a3696bf7daba087a86e05c2"}
  :kvrohit/substrata.nvim {:commit "aea8143ceab98ffcb02934773cc3b4249425f76c"}
  :kyazdani42/blue-moon {:commit "02263fe9831211046a66112c290eb452d7815b86"}
  :mcchrish/zenbones.nvim {:requires ["rktjmp/lush.nvim"] :commit "6455bdfa0ef8d8ef1dd6412608f82aa04b629d9c"}
  :alaric/nortia.nvim {:requires ["rktjmp/lush.nvim"] :commit "74ce18ddacec6b9c141e9d24ea8ac3e32c63aec5"}
  :rebelot/kanagawa.nvim {:commit "dda1b8c13e0e7588c014064e5e8baf7f2953dd29"}
  :relastle/bluewery.vim {:commit "4e95132e1f5d89829f4ae5a5a99bf8e6269189c6"}
  :rose-pine/neovim {:as :rose-pine :tag "v1.*" :mod :rosepine}
  :sainnhe/everforest {:commit "765328360ca61f889709c36e68cd44c11a127093"}
  :savq/melange {:commit "78af754ad22828ea3558e2990326b8aa39730918"}
  :shaunsingh/solarized.nvim {:mod :solarized
                              :commit "34c2245a6ddfd85766f6127768f6b04b0ae2f84a"}
  :catppuccin/nvim {:as :catppuccin
                    :commit "a111e8075101c0ac8be79f293e8c5181efa06402"}




  ;; Code Smartness
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"
                                             :commit "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90"}
  :nvim-telescope/telescope.nvim {:mod :telescope
                                  :requires ["nvim-lua/plenary.nvim"
                                             "nvim-telescope/telescope-fzf-native.nvim"]
                                  :commit "76ea9a898d3307244dce3573392dcf2cc38f340f"}
  :nvim-telescope/telescope-frecency.nvim {:mod :frecency
                                           :requires [:kkharji/sqlite.lua]
                                           :commit "9634c3508c6565284065ec011476204ce13f354a"}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter
                                    :run ":TSUpdate"
                                    :commit "7ccb9a056fa43da243e3a439109c354c551c51b6"}
  ; :nvim-treesitter/nvim-treesitter-textobjects {:mod :ts-textobjects
  ;                                               :commit "41e8d8964e5c874d9ce5e37d00a52f37f218502e"}
  ; :nvim-treesitter/nvim-treesitter-context {:mod :ts-context
  ;                                           :commit "8d0759eb798fee2e1201b26c3279713ac67c44c2"}
  :neovim/nvim-lspconfig {:mod :lspconfig
                          :commit "fc2f44dc6024bddb75b82e471c642ad1f4483094"}
  :nvim-treesitter/playground {:commit "e6a0bfaf9b5e36e3a327a1ae9a44a989eae472cf"}
  :L3MON4D3/LuaSnip {:mod :luasnips
                     :commit "8f8d493e7836f2697df878ef9c128337cbf2bb84"}
  :ahmedkhalf/project.nvim {:mod :project-nvim
                            :commit "628de7e433dd503e782831fe150bb750e56e55d6"}
  :jose-elias-alvarez/null-ls.nvim {:mod :nulls
                                    :requires ["nvim-lua/plenary.nvim"]
                                    :commit "c0c19f32b614b3921e17886c541c13a72748d450"}
  :glepnir/lspsaga.nvim {:mod :tami-saga
                         :branch "main"}

  ;; <> Completion <>
  :hrsh7th/cmp-nvim-lsp {:commit "affe808a5c56b71630f17aa7c38e15c59fd648a8"}
  :hrsh7th/cmp-buffer {:commit "3022dbc9166796b644a841a02de8dd1cc1d311fa"}
  :hrsh7th/cmp-path {:commit "91ff86cd9c29299a64f968ebb45846c485725f23"}
  :hrsh7th/cmp-cmdline {:commit "c66c379915d68fb52ad5ad1195cdd4265a95ef1e"}
  :petertriho/cmp-git {:commit "fae6cdb407ad6c63a0b1928670bad1a67a55b887"}
  :PaterJason/cmp-conjure {:commit "ca39e595a0a64150a3fbad340635b0179fe275ec"}
  :saadparwaiz1/cmp_luasnip {:commit "a9de941bcbda508d0a45d28ae366bb3f08db2e36"}
  ; We have nvim-cmp require all of its sources
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-path
                                :hrsh7th/cmp-cmdline
                                :hrsh7th/cmp-nvim-lsp
                                :petertriho/cmp-git
                                :saadparwaiz1/cmp_luasnip
                                :PaterJason/cmp-conjure]
                     :mod :nv-cmp
                     :commit "b0dff0ec4f2748626aae13f011d1a47071fe9abc"}



  ;; Misc. Customizations and Tools
  :ojroques/vim-oscyank {:commit "849c67adf24a86935b8be62860ad9acb00cf4572"}
  :lewis6991/impatient.nvim {:commit "b842e16ecc1a700f62adb9802f8355b99b52a5a6"}
  :goolord/alpha-nvim {:mod :alpha-nvim
                       :requires ["kyazdani42/nvim-web-devicons"]
                       :commit "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31"}
  :axelf4/vim-strip-trailing-whitespace {:commit "59385775cbe416b2797ec5e2c7eb445a3398dd46"}
  :kyazdani42/nvim-web-devicons {:mod :devicons
                                 :commit "563f3635c2d8a7be7933b9e547f7c178ba0d4352"}
  :ggandor/lightspeed.nvim {:commit "a5b79ddbd755ac8d21a8704c370b5f643dda94aa"}
  :nvim-lua/plenary.nvim {:commit "4b7e52044bbb84242158d977a50c4cbcd85070c7"}
  :kkharji/sqlite.lua {:commit "47685f0adb89928fc1b2a9b812418680f29aaf27"}
  :folke/trouble.nvim {:mod :trouble-nvim
                       :requires "kyazdani42/nvim-web-devicons"
                       :commit "929315ea5f146f1ce0e784c76c943ece6f36d786"}
  :Pocco81/true-zen.nvim {:commit "98740c76254c65576ec294551028b65081053588"}
  :rcarriga/nvim-notify {:commit "414465468c93f693be4e2f69f47586cf37f3f751"}
  :lukas-reineke/indent-blankline.nvim {:mod :blankline
                                        :commit "db7cbcb40cc00fc5d6074d7569fb37197705e7f6"}
  :mvllow/modes.nvim {:mod :modes-nvim
                      :commit "7abb72531dd645aaefed9a4f8a1c2729f2d55e3c"}
  :kkharji/lispdocs.nvim {:requires [:kkharji/sqlite.lua "Olical/conjure"]
                          :commit "aa5a3bee49803fe22c095524e5abab51bfeea199"
                          :disable true} ; currently seems busted--hacking reqd
  ;:kevinhwang91/nvim-hlslens {:commit ""}
  :akinsho/toggleterm.nvim {:mod :toggleterm
                            :commit "2a787c426ef00cb3488c11b14f5dcf892bbd0bda"}
  :chentoast/marks.nvim {:mod :marks-nvim
                         :commit "b27cbb78e9082229590b396d3ae4fe07f1aeafe0"}
  :luukvbaal/nnn.nvim {:mod :nnn-nvim
                       :commit "6b048ba5ccab93d05ca77e1b405fef1f74f4bb27"}
  :epwalsh/obsidian.nvim {:mod :obsidian-nvim
                          :tag "v1.*"
                          :requires [:hrsh7th/nvim-cmp]}



  ;; Git Focused
  :lewis6991/gitsigns.nvim {:mod :gitsigns-nvim
                            :commit "facca89a95aa5e492505270a60a30825be576d14"}
  :tpope/vim-fugitive {:mod :fugitive
                       :commit "dd8107cabf5fe85df94d5eedcae52415e543f208"}
  ;:airblade/vim-gitgutter {:commit ""}
  ;:pwntester/octo.nvim {:commit ""} ; TODO check this out <-



  ;; LITEE Tools
  ; :ldelossa/litee.nvim {:mod :litee}
  ; :ldelossa/litee-calltree.nvim {:mod :litee-calltree
  ;                                :requires ["ldelossa/litee.nvim"]}
  ; :ldelossa/litee-symboltree.nvim {:mod :litee-symboltree
  ;                                  :requires ["ldelossa/litee.nvim"]}
  ; :ldelossa/litee-filetree.nvim {:mod :litee-filetree
  ;                                :requires ["ldelossa/litee.nvim"]}
  ; :ldelossa/litee-bookmarks.nvim {:mod :litee-bookmarks
  ;                                 :requires ["ldelossa/litee.nvim"]}



  ;; Generic Lang Support
  :janet-lang/janet.vim {:commit "eb520a727e775a917c078d9fa6777572171a7e94"}

  :wbthomason/packer.nvim {:commit "6afb67460283f0e990d35d229fd38fdc04063e0a"})



;;;; After-plugin configs

(def from-env (partial a.get vim.env))
(def nvim-config-location
  (vim.fn.expand
    (from-env
      "NVIM_CONFIG"
      (.. (from-env "XDG_CONFIG_HOME" "~/.config") "/nvim"))))
(def fnl-config-location (.. nvim-config-location "/fnl/magic"))

(def register-command vim.api.nvim_create_user_command)
(register-command
  "AddModule"
  #(let [module-name (a.get $ :args)
         target-location (.. fnl-config-location "/plugin/" module-name ".fnl")
         ;; Maybe base this off of a template somewhere?
         module-definition [(.. "(module magic.plugin." module-name)
                            "  {autoload {a aniseed.core"
                            "             nvim aniseed.nvim"
                            "             u magic.utils}"
                            "   require-macros [magic.macros]})"
                            ""
                            ";; TODO"]]
    (do (vim.fn.writefile module-definition target-location)
       (u.run-cmd {:cmd :vsplit
                   :args [target-location]})))
  {:nargs 1})

;; Lets us fold clojure code using the typical keybinds (zo, zc, zM, zR, etc.)
(set vim.g.clojure_fold 1)

(def toggle-background
  #(let [bg nvim.o.background]
    (if (not= "dark" bg) ;; check for a `not` in the case of an unset background
      (set nvim.o.background :dark)
      (set nvim.o.background :light))))

(u.mapkey "n" "<leader><leader>b" toggle-background)

;; Set our theme dependent on what machine we're on.
(def hostname (vim.loop.os_gethostname))

;; TODO: Ideally source this table from another file?
(def host-themes
  {:slt440s #(let [sol (require :solarized)]
               (sol.set)
               (set nvim.o.background :light))})

(def set-default-theme
  #(do (nvim.ex.colorscheme :space-nvim)
       (set nvim.o.background :dark)))

(let [set-theme-func (. host-themes hostname)]
  (if (a.nil? set-theme-func)
    (set-default-theme)
    (set-theme-func)))

;; Quick access to list of colorschemes
(u.mapkey :n :<leader>cs #(u.run-cmd {:cmd :Telescope
                                      :args [:colorscheme]}))

(u.mapkey :n :<leader>sm #(u.run-cmd {:cmd :Telescope
                                      :args [:lsp_document_symbols]}))

;;;; Scratch Config

;; Easy access.
(register-command
  "Scratchpad"
  #(let [scratch-file (.. (fs.basename *file*) "/scratch.fnl")]
     (u.run-cmd {:cmd :edit
                 :args [scratch-file]}))
  {:nargs 0})

(register-command
  "VScratchpad"
  #(let [scratch-file (.. (fs.basename *file*) "/scratch.fnl")]
     (u.run-cmd {:cmd :vsplit
                 :args [scratch-file]}))
  {:nargs 0})

;; Source it.
(scratch.setup)

;(eval.str (a.slurp (.. (fs.basename *file*) "/scratch.fnl")) {:force true})
