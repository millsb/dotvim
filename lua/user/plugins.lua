-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Theming
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'lunarvim/darkplus.nvim'},
	{'RRethy/nvim-base16'},
  {'kyazdani42/nvim-web-devicons'},
  {
    'nvim-lualine/lualine.nvim',
    config = function() pcall(require, 'plugins.lualine') end,
  },
  { 
    'akinsho/bufferline.nvim',
    config = function() pcall(require, 'plugins.bufferline') end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() pcall(require, 'plugins.indent-blankline') end,
  },

	-- Editing
	{
		'andrewferrier/wrapping.nvim',
		config = function() pcall(require, 'plugins.wrapping') end
	},

	-- Command completion
	{
		'gelguy/wilder.nvim',
		config = function() pcall(require, 'plugins.wilder') end,
	},

	-- Swap management
	{'gioele/vim-autoswap'},

  -- File explorer
  {
    'kyazdani42/nvim-tree.lua',
    config = function() pcall(require, 'plugins.nvim-tree') end,
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    config = function() pcall(require, 'plugins.telescope') end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function() pcall(require, 'plugins.gitsigns') end,
  },
  {'tpope/vim-fugitive'},

  -- Code manipulation
  {
    'nvim-treesitter/nvim-treesitter',
    config = function() pcall(require, 'plugins.treesitter') end,
  },
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {
    'numToStr/Comment.nvim',
    config = function() pcall(require, 'plugins.comment') end,
  },
  {'tpope/vim-surround'},
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},

  -- Utilities
  {'moll/vim-bbye'},
  {'nvim-lua/plenary.nvim'},
  {'editorconfig/editorconfig-vim'},
  {
    'akinsho/toggleterm.nvim',
    config = function() pcall(require, 'plugins.toggleterm') end,
  },

  -- LSP support
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {
    'neovim/nvim-lspconfig',
		dependencies = {
			'nvimdev/lspsaga.nvim',
		},
    config = function() pcall(require, 'plugins.lsp') end,
  },
  -- use {
  --   'glepnir/lspsaga.nvim',
		-- branch = 'main',
  --   config = function() pcallplatform(require, 'plugins.lspsaga') end,
  -- }
	{
			"nvimdev/lspsaga.nvim",
			config = function()
					pcall(require, 'plugins.lspsaga')
			end
	},

	{ 'nvimtools/none-ls.nvim',
		 config = function() pcall(require, 'plugins.null-ls') end,
	},

	{
		'MunifTanjim/eslint.nvim',
		config = function() pcall(require, 'plugins.eslint') end,
	},
	-- Prettier
	{ 'MunifTanjim/prettier.nvim',
				config = function() pcall(require, 'plugins.prettier') end,
			},

	-- Neotest
	{
		"nvim-neotest/neotest",
    -- config = function() pcall(require, 'plugins.neotest') end,
		config = function() require('plugins.neotest') end,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
	    "nvim-neotest/neotest-python",
	    "nvim-neotest/neotest-jest",
	    "marilari88/neotest-vitest",
		}
	},

	-- Coverage
	{
		"andythigpen/nvim-coverage",
		dependencies = "nvim-lua/plenary.nvim",
		config = function() pcall(require, 'plugins.nvim-coverage') end,
	},


	-- Rust
  'simrat39/rust-tools.nvim',

	-- Clojure / Structural Editing
	{ 'Olical/conjure' },
	-- { 'guns/vim-sexp' },
	-- { 'tpope/vim-sexp-mappings-for-regular-people' },
	{
		"dundalek/parpar.nvim",
		dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
		opts = { }
	},
  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    config = function() pcall(require, 'plugins.nvim-cmp') end,
  },
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  {'hrsh7th/cmp-nvim-lsp'},

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    config = function() pcall(require, 'plugins.luasnip') end,
  },
  {'rafamadriz/friendly-snippets'},

	-- -- Copilot
	-- {'github/copilot.vim'},
	-- {
	-- 	'CopilotC-Nvim/CopilotChat.nvim',
	-- 	dependencies = 'nvim-lua/plenary.nvim',
	-- 	-- config = function() pcall(require, 'plugins.copilot-chat') end,
	-- 	config = function() require('plugins.copilot-chat') end,
	-- },
	--

	-- Neorg
	{
		'nvim-neorg/neorg',
		version = "*",
		config = true
	},
})
