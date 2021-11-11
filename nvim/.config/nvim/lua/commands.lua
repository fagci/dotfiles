vim.cmd([[
let rg_default = 'rg --max-filesize=512000 --column --line-number --no-heading --color=always --glob "!.git/*"'
let rg_match_opts = ' --fixed-strings --smart-case'
let rg_full_opts = rg_match_opts . ' --no-ignore'
let rg_git_opts = rg_match_opts . ' --glob "!*.min.*" --glob "!*.bundle.*" --glob "!*.map"'

command! -bang -nargs=* RG
            \ call fzf#vim#grep(
            \   rg_default . rg_full_opts . ' -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

command! -bang -nargs=* GRG
            \ call fzf#vim#grep(
            \   rg_default . rg_git_opts . ' -- '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end

augroup GoToLastPosition
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

au! CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({border="single", focusable=false})
au! TextYankPost * silent! lua vim.highlight.on_yank()
]])
