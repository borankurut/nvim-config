require('matchparen').setup({
	on_startup = true,        -- Should it be enabled by default
	hl_group = 'MatchParen',  -- highlight group of the matched brackets
	augroup_name = 'matchparen', -- almost no reason to touch this unless there is already augroup with such name
	debounce_time = 100,      -- debounce time in milliseconds for rehighlighting of brackets.
})
