return {
    -- Editing
    'tpope/vim-repeat',
    'wellle/targets.vim',
    'machakann/vim-sandwich',
    { 'mattn/emmet-vim',  ft = { 'html', 'css', 'htmldjango', 'twig', 'php' } },
    { 'sbdchd/neoformat', cmd = 'Neoformat' },
    {
        'numToStr/Comment.nvim',
        config = function() require('plugins.config.comment') end,
    },
    {
        'Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {},
    },
}
