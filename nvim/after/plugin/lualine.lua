require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {
            {
                "filename",
                file_status = true, -- Displays file status (readonly status, modified status)
                path = 0, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path

                shorting_target = 52, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = " ⚫ ", -- Text to show when the file is modified.
                    readonly = " ⚪ ", -- Text to show when the file is non-modifiable or readonly.
                    unnamed = "" -- Text to show for unnamed buffers.
                }
            }
        },
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff", "diagnostics"},
        lualine_c = {"filename", "os.date('%a')", "data", "require'lsp-status'.status()"},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    theme = "ayu",
    tabline = {},
    extensions = {}
})
