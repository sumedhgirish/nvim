
local line_opts = {
    options = {
        theme = "catppuccin",
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = ' ' }, right_padding = 6 } },
        lualine_b = {
            {
                'filename',
                symbols = {
                    modified = '󰣕 ',
                    directory = ' ',
                    alternate_files = ' ',
                },
            },
            'branch',
        },
        lualine_c = {
            {
                'diff',
                colored = true, -- Displays a colored diff status if set to true
                diff_color = {
                    added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
                    modified = 'LuaLineDiffChange', -- Changes the diff's modified color
                    removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
                },
                symbols = { added = '+', modified = '~', removed = '-' }, -- Changes the symbols used by the diff.
                source = nil, -- A function that works as a data source for diff.
            }
        },
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                    error = 'DiagnosticSignError',
                    warn  = 'DiagnosticSignWarn',
                    info  = 'DiagnosticSignInfo',
                    hint  = 'DiagnosticSignHint',
                },
                symbols = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    hint = ' ',
                },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'datetime', separator = { right = ' ' }, left_padding = 6 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = {
        -- 'lazy',
        { filetypes = { 'lazy', 'TelescopePrompt' }, sections = { lualine_a = { { 'filetype', icon = { align = 'right' } } } } },
        'mason',
        'oil',
    },
}

return line_opts
