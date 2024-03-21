return {
    "morhetz/gruvbox",
    "sainnhe/gruvbox-material",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.g.gruvbox_material_foreground = "mix"
        vim.g.gruvbox_material_better_performance = 1
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_diagnostic_text_highlight = 1
        vim.g.gruvbox_material_diagnostic_line_highlight = 1

        vim.cmd [[colorscheme gruvbox-material]]
    end
}
