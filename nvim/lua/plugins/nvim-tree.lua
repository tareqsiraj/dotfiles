return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        {"<leader>T", "<cmd>NvimTreeToggle<cr>", "Toggle NvimTree"},
    },
    config = function()
        require('nvim-tree').setup({
            view = {
                --width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
            },
            git = {
                ignore = false,
            },
        })
    end
}
