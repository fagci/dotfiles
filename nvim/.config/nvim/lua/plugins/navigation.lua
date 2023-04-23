return {
    {
        'ibhagwan/fzf-lua',
        opts = require('plugins.config.fzf-lua'),
        cmd = 'FzfLua'
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        cmd = { 'NeoTreeShow', 'NeoTreeShowToggle', 'NeoTreeReveal', 'NeoTreeRevealToggle' }
    },
}
