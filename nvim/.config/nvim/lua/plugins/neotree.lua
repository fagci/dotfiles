return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('neo-tree').setup({
                filesystem = {
                    components = {
                        icon = function(config, node, state)
                            if node.type == 'file' then
                                return {
                                    text = "· ",
                                    highlight = config.highlight,
                                }
                            end
                            return require('neo-tree.sources.common.components').icon(config, node, state)
                        end,
                    },
                }
            })
        end
    },
}
