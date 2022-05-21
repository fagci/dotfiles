if not pcall(vim.cmd, [[packadd packer.nvim]]) then
	print('[*] Cloning packer...')
	vim.fn.system({
		'git', 'clone', 'https://github.com/wbthomason/packer.nvim', 
		vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
	})
	vim.api.nvim_command 'packadd packer.nvim'
	print('[i] Packer installed.')
end
