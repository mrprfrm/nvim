local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
	return
end

local on_attach = require("plugins.nvim-tree.mappings").on_attach

--   ﭜ    ﭧ         ﮁ
--  S  ➜  U ◌
--       
--    ➜  ﭜ 
nvim_tree.setup({
	-- cwd - current working directory
	update_cwd = true,
	open_on_tab = false,
	auto_reload_on_write = true,
	on_attach = on_attach,
	renderer = {
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "󰙝",
					ignored = "",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "󰌵",
			info = "",
			error = "󰅙",
			warning = "",
		},
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 400,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	filesystem_watchers = {
		enable = true,
	},
})
