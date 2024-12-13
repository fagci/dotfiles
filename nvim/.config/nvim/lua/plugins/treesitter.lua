return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    event = 'BufReadPost',
    opts = {
      ensure_installed = {
        'awk',
        'bash',
        'c',
        'cmake',
        'comment',
        'cpp',
        'diff',
        'git_config',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'git_rebase',
        'go',
        'gomod',
        'html',
        'http',
        'javascript',
        'jq',
        'json',
        'lua',
        'luadoc',
        'make',
        'markdown',
        'markdown_inline',
        'perl',
        'php',
        'python',
        'query',
        'regex',
        'ruby',
        'toml',
        'vim',
        'yaml',
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    },
    config = function(plugin, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}