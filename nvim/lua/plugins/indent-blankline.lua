return {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    main = "lbl",
    config = function()
        require("ibl").setup({
            indent = { highlight = highlight, char = "" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
        })
    end
}
