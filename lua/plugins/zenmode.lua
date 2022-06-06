require("zen-mode").setup {
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
            -- signcolumn = "no", -- disable signcolumn
            -- number = false, -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
        },
    },
    plugins = {
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    }
}
