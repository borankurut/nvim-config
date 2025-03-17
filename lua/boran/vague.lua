require("vague").setup({
	-- optional configuration here
	transparent = true,
	style = {
		-- "none" is the same thing as default. But "italic" and "bold" are also valid options
		boolean = "bold",
		number = "none",
		float = "none",
		error = "bold",
		comments = "italic",
		conditionals = "none",
		functions = "none",
		headings = "bold",
		operators = "none",
		strings = "italic",
		variables = "none",

		-- keywords
		keywords = "none",
		keyword_return = "italic",
		keywords_loop = "none",
		keywords_label = "none",
		keywords_exception = "none",

		-- builtin
		builtin_constants = "bold",
		builtin_functions = "none",
		builtin_types = "bold",
		builtin_variables = "none",
	},
	-- plugin styles where applicable
	-- make an issue/pr if you'd like to see more styling options!
	plugins = {
		cmp = {
			match = "bold",
			match_fuzzy = "bold",
		},
		dashboard = {
			footer = "italic",
		},
		lsp = {
			diagnostic_error = "bold",
			diagnostic_hint = "none",
			diagnostic_info = "italic",
			diagnostic_warn = "bold",
		},
		neotest = {
			focused = "bold",
			adapter_name = "bold",
		},
		telescope = {
			match = "bold",
		},
	},

	colors = {
		func = "#bc96b0",
		keyword = "#787bab",
		-- string = "#d4bd98",
		string = "#8a739a",
		-- string = "#f2e6ff",
		-- number = "#f2e6ff",
		-- string = "#d8d5b1",
		number = "#8f729e",
		-- type = "#dcaed7",
	},
})
