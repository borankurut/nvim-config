local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "java", "c_sharp", "javascript", "python" },
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,    -- false will disable the whole extension
		additional_vim_regex_highlighting = true
	},

	indent = { enable = false },

	rainbow = {
		enable = false,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		--colors = {"#b56470", "#cfa87e", "#d97c7c", "#878c61"}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},

}
