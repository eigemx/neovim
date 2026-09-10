return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        --local kanagawa_paper = require("lualine.themes.kanagawa-paper")
        require("lualine").setup({
            options = {
                theme = 'auto',
                --theme = "codedark",
                -- Pinned: per-window statuslines, so NvimTree keeps its own
                -- (disabled/blank) bar instead of sharing a global one.
                globalstatus = false,
                disabled_filetypes = {
                    statusline = { 'NvimTree' },
                },
            },
        })
    end,
}
