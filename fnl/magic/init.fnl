(module magic.init
  {autoload {plugin magic.plugin
               nvim aniseed.nvim
               a aniseed.core
               u magic.utils}})

;;; Introduction

;; Aniseed compiles this (and all other Fennel files under fnl) into the lua
;; directory. The init.lua file is configured to load this file when ready.

;; We'll use modules, macros and functions to define our configuration and
;; required plugins. We can use Aniseed to evaluate code as we edit it or just
;; restart Neovim.

;; You can learn all about Conjure and how to evaluate things by executing
;; :ConjureSchool in your Neovim. This will launch an interactive tutorial.


;;; Generic configuration

(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)

;; Maybe have this only be active in .md/.txt/.wiki buffers?
;(nvim.ex.set :spell)
(nvim.ex.set :list)


;;; Mappings

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")


;;; Plugins

;; Run script/sync.sh to update, install and clean your plugins.
;; Packer configuration format: https://github.com/wbthomason/packer.nvim

;; The `plugin.use` function will map the table belonging to a plugin-name to
;; the typical format Packer will expect, for example:
;;
;;   the option `:requires ["someone/some-other-plugin" "me/my-own-plugin"]`
;;   will map to `requires = {"someone/some-other-plugin", "me/my-own-plugin"}`
;;
;; However, there is a particular little "extra" provided: the `mod` option.
;; Providing the option `:mod :<name>` will see Packer take the contents of
;; `fnl/magic/plugin/<name>`, and use them as if they were specified in the
;; `config` element for that plugin, with a layer of error-tolerance added on
;; top, so that everything won't come crashing down if your config is a little
;; scuffed.
;;
;; See `magic/plugin.fnl` for the function definition and further details.

(plugin.use
  ;; Criticals
  :Olical/aniseed {}
  :Olical/conjure {}

  ;; Preloadeds
  :PeterRincker/vim-argumentative {}
  ;:airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :easymotion/vim-easymotion {}
  :folke/which-key.nvim {}
  :guns/vim-sexp {}
  :hrsh7th/nvim-cmp {}
  :itchyny/lightline.vim {}
  :jiangmiao/auto-pairs {:mod :auto-pairs}
  :gpanders/nvim-parinfer {}
  :junegunn/fzf {}
  :junegunn/fzf.vim {}
  :liuchengxu/vim-better-default {:mod :better-default}
  :mbbill/undotree {}
  :radenling/vim-dispatch-neovim {}
  :srcery-colors/srcery-vim {}
  :tami5/compe-conjure {}
  :tpope/vim-abolish {}
  :tpope/vim-commentary {}
  :tpope/vim-dispatch {}
  :tpope/vim-eunuch {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {:mod :ale}

  ;; Colorschemes
  :Th3Whit3Wolf/space-nvim {:mod :space-nvim}
  :elianiva/gitgud.nvim {}
  :relastle/bluewery.vim {}
  :shaunsingh/solarized.nvim {:mod :solarized}
  :rose-pine/neovim {:as :rose-pine
                     :tag "v1.*"
                     :mod :rosepine}
  :haystackandroid/snow {}
  :haystackandroid/cosmic_latte {}
  :sainnhe/everforest {}
  :mcchrish/zenbones.nvim {:requires ["rktjmp/lush.nvim"]}

  ;; Customizations
  :ojroques/vim-oscyank {}
  :lewis6991/impatient.nvim {}
  :goolord/alpha-nvim {:mod :alpha-nvim
                       :requires ["kyazdani42/nvim-web-devicons"]}
  :axelf4/vim-strip-trailing-whitespace {}
  :kyazdani42/nvim-web-devicons {:mod :devicons}
  :ggandor/lightspeed.nvim {}
  :nvim-lua/plenary.nvim {}
  :tami5/sqlite.lua {}
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"}
  :nvim-telescope/telescope.nvim {:mod :telescope
                                  :requires ["nvim-lua/plenary.nvim"
                                             "nvim-telescope/telescope-fzf-native.nvim"]}
  :nvim-telescope/telescope-frecency.nvim {:mod :frecency
                                           :requires ["tami5/sqlite.lua"]}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter
                                    :run ":TSUpdate"}
;  :nvim-treesitter/nvim-treesitter-textobjects {:mod :ts-textobjects}
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :nvim-treesitter/playground {}
  :L3MON4D3/LuaSnip {:mod :luasnips}
  :ahmedkhalf/project.nvim {:mod :project-nvim}
  :folke/trouble.nvim {:mod :trouble-nvim
                       :requires "kyazdani42/nvim-web-devicons"}
  :Pocco81/TrueZen.nvim {}
  :rcarriga/nvim-notify {}
  :lukas-reineke/indent-blankline.nvim {:mod :blankline}
  :mvllow/modes.nvim {:mod :modes-nvim}
  :tami5/lispdocs.nvim {:requires ["tami5/sqlite.lua" "Olical/conjure"]}
  ;:kevinhwang91/nvim-hlslens {}
  :lewis6991/gitsigns.nvim {:mod :gitsigns-nvim}

  ;; LITEE Tools
  :ldelossa/litee.nvim {:mod :litee}
  :ldelossa/litee-calltree.nvim {:mod :litee-calltree
                                 :requires ["ldelossa/litee.nvim"]}
  :ldelossa/litee-symboltree.nvim {:mod :litee-symboltree
                                   :requires ["ldelossa/litee.nvim"]}
  :ldelossa/litee-filetree.nvim {:mod :litee-filetree
                                 :requires ["ldelossa/litee.nvim"]}
  :ldelossa/litee-bookmarks.nvim {:mod :litee-bookmarks
                                  :requires ["ldelossa/litee.nvim"]}

  ;; Generic Lang Support
  :janet-lang/janet.vim {}

  :wbthomason/packer.nvim {})



;;; After-plugin configs

(def from-env (partial a.get vim.env))
(def nvim-config-location
  (vim.fn.expand
    (from-env
      "NVIM_CONFIG"
      (.. (from-env "XDG_CONFIG_HOME" "~/.config") "/nvim"))))
(def fnl-config-location (.. nvim-config-location "/fnl/magic"))

(def register-command vim.api.nvim_add_user_command)
(register-command
  "AddModule"
  #(let [module-name (a.get $ :args)
         target-location (.. fnl-config-location "/plugin/" module-name ".fnl")
         ;; Maybe base this off of a template somewhere?
         module-definition [(.. "(module magic.plugin." module-name)
                            "  {autoload {a aniseed.core"
                            "             nvim aniseed.nvim}"
                            "   require-macros [magic.macros]})"
                            ""
                            ";; TODO"]]
    (do (vim.fn.writefile module-definition target-location)
        (vim.cmd (.. ":vsplit " target-location))))
  {:nargs 1})

(def toggle-background
  #(let [bg nvim.o.background]
    (if (not= "dark" bg) ;; check for a `not` in the case of an unset background
      (set nvim.o.background :dark)
      (set nvim.o.background :light))))

(u.mapkey "n" "<leader>b" toggle-background)

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
