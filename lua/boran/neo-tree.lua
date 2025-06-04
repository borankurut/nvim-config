if vim.diagnostic and vim.diagnostic.config then
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.HINT] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.ERROR] = "",
			}
		}
	})
else
	vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
end

require('neo-tree').setup({
	close_if_last_window = false,
	hijack_netrw_behavior = "open_default",
	enable_git_status = true,
	enable_diagnostics = true,
	open_files_do_not_replace_types = { "terminal", "trouble", "qf", "startify", "dashboard", "alpha" },

	filesystem = {
		bind_to_cwd = false,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
		hijack_netrw_behavior = "open_default",

		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
			never_show = { ".git", ".DS_Store" }
		},

		window = {
			width = 50,
			mappings = { ['/'] = "noop", }
		},

		commands = {
			--[[ delete = function(state) ]]
			--[[ 	local node = state.tree:get_node() ]]
			--[[ 	local path = node:get_id() ]]
			--[[ 	local confirm = vim.fn.input("Trash " .. path .. "? [y/n] ") ]]
			--[[ 	if confirm:lower() == "y" then ]]
			--[[ 		vim.fn.system({ "trash", vim.fn.fnameescape(path) }) ]]
			--[[ 		require("neo-tree.sources.manager").refresh(state.name) ]]
			--[[ 	end ]]
			--[[ end ]]
		},
	},

	window = {
		position = "left",
		width = 50,
		window_picker = { enable = false },
	},

	default_component_configs = {
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "",
			folder_empty_open = "",
			default = "",
			symlink = ""
		},

		git_status = {
			symbols = {
				unstaged = "",
				staged = "S",
				unmerged = "",
				renamed = "➜",
				deleted = "",
				untracked = "U",
				ignored = "◌"
			}
		}
	},

	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end
		}
	}
})
