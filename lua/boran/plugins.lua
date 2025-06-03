local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
	git = {
		clone_timeout = 99999999999
	}
}

-- Install your plugins here
return packer.startup({
	function(use)
		-- My plugins here
		use "wbthomason/packer.nvim" -- Have packer manage itself
		use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
		use "windwp/nvim-autopairs" --autoparis

		use 'numToStr/Comment.nvim'
		use 'JoosepAlviste/nvim-ts-context-commentstring'

		--lsp
		use {
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x', -- Changed from v1.x
			requires = {
				-- LSP Core
				{ 'neovim/nvim-lspconfig' },
				{ 'williamboman/mason.nvim' },
				{ 'williamboman/mason-lspconfig.nvim' },

				-- Autocompletion
				{ 'hrsh7th/nvim-cmp' },
				{ 'hrsh7th/cmp-nvim-lsp' },
				{ 'hrsh7th/cmp-buffer' },
				{ 'hrsh7th/cmp-path' },
				{ 'saadparwaiz1/cmp_luasnip' },
				{ 'hrsh7th/cmp-nvim-lua' },

				-- Snippets
				{ 'L3MON4D3/LuaSnip' },
				{ 'rafamadriz/friendly-snippets' },

				-- NEW REQUIRED PLUGINS for v4.x
				{ 'folke/neodev.nvim' },                   -- Essential for Lua LSP
				{ 'j-hui/fidget.nvim',                tag = 'legacy' } -- UI integration
			}
		}

		-- telescope
		use "nvim-telescope/telescope.nvim"
		use "nvim-telescope/telescope-media-files.nvim"

		--treesitter
		use {
			"nvim-treesitter/nvim-treesitter",
			run = "TSUpdate",
		}
		-- TODO: solve treesitter highlighting lag.	

		--nvimtree
		use "nvim-tree/nvim-web-devicons"

		use "RRethy/vim-illuminate"

		use {
			"nvim-tree/nvim-tree.lua",
			tag = "compat-nvim-0.7"
		}

		use "lewis6991/gitsigns.nvim"

		--tabs
		use "moll/vim-bbye"

		--terminal
		use "akinsho/toggleterm.nvim"

		--harpoon
		use { 'ThePrimeagen/harpoon' }

		--glsl syntax
		use { 'tikhomirov/vim-glsl' }

		use { 'rose-pine/neovim' }

		use { 'vague2k/vague.nvim' }


		use { 'monkoose/matchparen.nvim' }

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if PACKER_BOOTSTRAP then
			require("packer").sync()
		end
	end,

	config = {
		clone_timeout = 99999999999
	}

})
