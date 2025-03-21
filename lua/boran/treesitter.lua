local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = { "c", "cpp", "lua", "python" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,    -- false will disable the whole extension
		additional_vim_regex_highlighting = false
	},
	indent = { enable = false },
	incremental_selection = { enable = false },
	rainbow = { enable = false, },
}
