return {
    {
        "stevearc/overseer.nvim",
        event = "BufReadPre",
        opts = {},
        config = function()
            require("overseer").setup()
        end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        opts = { snippet_engine = "luasnip" },
        event = "BufReadPre",
    }
}
