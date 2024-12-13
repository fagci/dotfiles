return {
    'gpanders/editorconfig.nvim',
    { 'vifm/vifm.vim',           cmd = 'Vifm' },
    { 'rhysd/git-messenger.vim', cmd = { 'GitMessenger', 'GitMessengerClose' } },
    { 'mhinz/vim-grepper',       cmd = { 'Grepper', 'GrepperGit', 'GrepperGrep', 'GrepperRg' } },
    { 'Olical/vim-enmasse',      cmd = 'EnMasse' },
    {
        'mbbill/undotree',
        config = function()
            vim.g.undotree_SetFocusWhenToggle = 1
        end,
        cmd = 'UndotreeToggle',
    },
    {
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        opts = {},
    },
}
