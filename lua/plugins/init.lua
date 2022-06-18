vim.cmd "packadd packer.nvim"

local plugins = {

   ["nvim-lua/plenary.nvim"] = {},
   ["wbthomason/packer.nvim"] = {},
   ["NvChad/extensions"] = {},

   ["NvChad/base46"] = {
      after = "plenary.nvim",
      config = function()
         local ok, base46 = pcall(require, "base46")

         if ok then
            base46.load_theme()
         end
      end,
   },

   -- ["NvChad/nvterm"] = {
   --    module = "nvterm",
   --    config = function()
   --       require "plugins.configs.nvterm"
   --    end,
   -- },

   ["kyazdani42/nvim-web-devicons"] = {
      module = "nvim-web-devicons",
      config = function()
         require("plugins.configs.others").devicons()
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      tag = "v2.*",
      opt = true,
      setup = function()
         require("core.lazy_load").bufferline()
      end,
      config = function()
         require "plugins.configs.bufferline"
      end,
   },

   ["lukas-reineke/indent-blankline.nvim"] = {
      opt = true,
      setup = function()
         require("core.lazy_load").on_file_open "indent-blankline.nvim"
      end,
      config = function()
         require("plugins.configs.others").blankline()
      end,
   },

   ["NvChad/nvim-colorizer.lua"] = {
      opt = true,
      setup = function()
         require("core.lazy_load").colorizer()
      end,
      config = function()
         require("plugins.configs.others").colorizer()
      end,
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      module = "nvim-treesitter",
      setup = function()
         require("core.lazy_load").on_file_open "nvim-treesitter"
      end,
      run = ":TSUpdate",
      config = function()
         require "plugins.configs.treesitter"
      end,
   },

   -- git stuff
   ["lewis6991/gitsigns.nvim"] = {
      opt = true,
      setup = function()
         require("core.lazy_load").gitsigns()
      end,
      config = function()
         require("plugins.configs.others").gitsigns()
      end,
   },

   -- lsp stuff

   ["williamboman/nvim-lsp-installer"] = {
      opt = true,
      setup = function()
         require("core.lazy_load").on_file_open "nvim-lsp-installer"
      end,
   },

   ["neovim/nvim-lspconfig"] = {
      after = "nvim-lsp-installer",
      module = "lspconfig",
      config = function()
         require "plugins.configs.lsp_installer"
         require "plugins.configs.lspconfig"
      end,
   },

   -- load luasnips + cmp related in insert mode only

   ["rafamadriz/friendly-snippets"] = {
      module = "cmp_nvim_lsp",
      event = "InsertEnter",
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "plugins.configs.cmp"
      end,
   },

   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").luasnip()
      end,
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      after = "LuaSnip",
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      after = "cmp_luasnip",
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      after = "cmp-nvim-lua",
   },

   ["hrsh7th/cmp-buffer"] = {
      after = "cmp-nvim-lsp",
   },

   ["hrsh7th/cmp-path"] = {
      after = "cmp-buffer",
   },

   -- misc plugins
   ["windwp/nvim-autopairs"] = {
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").autopairs()
      end,
   },

   ["goolord/alpha-nvim"] = {
      after = "base46",
      disable = true,
      config = function()
         require "plugins.configs.alpha"
      end,
   },

   ["SmiteshP/nvim-navic"] = {
      after = "lspconfig",
      config = function()
         require("nvim-navic").setup()
      end,
   },

   ["numToStr/Comment.nvim"] = {
      module = "Comment",
      keys = { "gc", "gb" },
      config = function()
         require("plugins.configs.others").comment()
      end,
   },

   -- file managing , picker etc
   ["luukbaal/nnn.nvim"] = {
      ft = "alpha",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function()
         require "plugins.configs.nnn_nvim"
      end,
   },

   ["ibhagwan/fzf-lua"] = {
      cmd = "FzfLua",
      config = function()
         require "plugins.configs.fzf-lua"
      end,
   },

   -- Only load whichkey after all the gui
   ["folke/which-key.nvim"] = {
      module = "which-key",
      config = function()
         require "plugins.configs.whichkey"
      end,
   },
}

require("core.packer").run(plugins)
