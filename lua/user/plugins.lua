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
	{'rebelot/kanagawa.nvim',
		config = function()
			require("kanagawa").setup({
				theme = "wave"
			})
			vim.cmd([[colorscheme kanagawa]])
		end
  },
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
	{
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    config = function()
      -- Global configuration for rustaceanvim
      vim.g.rustaceanvim = {
        server = {
          -- This tells rustaceanvim to set up nvim-lspconfig for you
          -- so you don't need to do it manually.
          on_attach = function(client, buffer)
            -- Keymaps can be loaded here
          end,
        },
      }
    end,
    -- Ensure mason is installed and configured for rust-analyzer
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },

	-- Clojure / Structural Editing
	{ 'Olical/conjure' },
	-- { 'guns/vim-sexp' },
	-- { 'tpope/vim-sexp-mappings-for-regular-people' },
	-- {
	-- 	"dundalek/parpar.nvim",
	-- 	dependencies = { "gpanders/nvim-parinfer", "julienvincent/nvim-paredit" },
	-- 	opts = { }
	-- },
  {"eraserhd/parinfer-rust", build = "cargo build --release"},

  -- Autocomplete
	{ 'saghen/blink.cmp',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets' },

		-- use a release tag to download pre-built binaries
		version = '1.*',
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = 'default' },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},

			-- (Default) Only show the documentation popup when manually triggered
			completion = { documentation = { auto_show = false } },

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" }
		},
		opts_extend = { "sources.default" }
	},
  -- {
  --   'hrsh7th/nvim-cmp',
  --   config = function() pcall(require, 'plugins.nvim-cmp') end,
  -- },
  -- {'hrsh7th/cmp-buffer'},
  -- {'hrsh7th/cmp-path'},
  -- {'saadparwaiz1/cmp_luasnip'},
  -- {'hrsh7th/cmp-nvim-lsp'},

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    config = function() pcall(require, 'plugins.luasnip') end,
  },
  {'rafamadriz/friendly-snippets'},
	{
	  "zk-org/zk-nvim",
		config = function() pcall(require, 'plugins.zk') end,
	},
  {
    "preservim/vim-markdown",
    ft = "markdown", -- Load the plugin only for markdown files
    dependencies = { "godlygeek/tabular" }, -- Tabular must be loaded before vim-markdown
    config = function()
      -- Optional: Add any specific configuration here
      -- For example, to disable default folding (it's on by default)
      -- vim.g.vim_markdown_folding = 0

      -- See the vim-markdown documentation for all available options
    end,
  },
	{
		'dhruvasagar/vim-table-mode'
	},

	-- -- Copilot
	-- {'github/copilot.vim'},
	-- {
	-- 	'CopilotC-Nvim/CopilotChat.nvim',
	-- 	dependencies = 'nvim-lua/plenary.nvim',
	-- 	-- config = function() pcall(require, 'plugins.copilot-chat') end,
	-- 	config = function() require('plugins.copilot-chat') end,
	-- },
	

	-- Org Roam
		{
		"chipsenkbeil/org-roam.nvim",
		tag = "0.2.0",
		dependencies = {
			{
				"nvim-orgmode/orgmode",
				tag = "0.7.0",
			},
		},
		config = function()
			require("org-roam").setup({
				directory = "~/org/roam",
				-- optional 
				-- paths to additional org files
				org_files = {}
			})
		end
	},
	-- Ranger integration
	{
		"kelly-lin/ranger.nvim",
		config = function()
			require("ranger-nvim").setup({ replace_netrw = true })
			vim.api.nvim_set_keymap("n", "<leader>ef", "", {
				noremap = true,
				callback = function()
					require("ranger-nvim").open(true)
				end,
			})
		end,
	},
	-- Neorg
	{
		'nvim-neorg/neorg',
		version = "*",
		config = true
	},
	-- HTTP Client
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = {"http", "rest"},
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
		},
	},

})
