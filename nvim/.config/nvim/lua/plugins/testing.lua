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
        "dnlhc/glance.nvim",
        event = "BufReadPre",
        config = true,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = { snippet_engine = "luasnip" },
        event = "BufReadPre",
    }
}
