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
(plugin.use
  ;; Criticals
  :Olical/aniseed {}
  :Olical/conjure {}

  ;; Preloadeds
  :PeterRincker/vim-argumentative {}
  :airblade/vim-gitgutter {}
  :clojure-vim/clojure.vim {}
  :clojure-vim/vim-jack-in {}
  :easymotion/vim-easymotion {}
  :folke/which-key.nvim {}
  :guns/vim-sexp {}
  :hrsh7th/nvim-compe {}
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
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-sleuth {}
  :tpope/vim-surround {}
  :tpope/vim-unimpaired {}
  :tpope/vim-vinegar {}
  :w0rp/ale {:mod :ale}

  ;; Colorschemes
  :Th3Whit3Wolf/space-nvim {:mod :space-nvim}

  ;; Customizations
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
  :neovim/nvim-lspconfig {:mod :lspconfig}
  :nvim-treesitter/playground {}
  :L3MON4D3/LuaSnip {:mod :luasnips}
  :ahmedkhalf/project.nvim {:mod :project-nvim}
  :folke/trouble.nvim {:mod :trouble-nvim
                       :requires "kyazdani42/nvim-web-devicons"}
  :Pocco81/TrueZen.nvim {}
  :rcarriga/nvim-notify {}
  ;:kevinhwang91/nvim-hlslens {}

  ;; Lang Support
  :janet-lang/janet.vim {}

  :wbthomason/packer.nvim {})



;;; After-plugin configs

(set nvim.o.background :light)

(def toggle-background
  #(let [bg nvim.o.background]
    (if (not= "dark" bg) ;; check for a `not` in the case of an unset background
      (set nvim.o.background :dark)
      (set nvim.o.background :light))))

(u.mapkey "n" "<leader>b" toggle-background)
