local ok, mymod = pcall(require, 'config')
if not ok then
	print('failed to load module: config')
end
require('plugin')
require('keymaps')

vim.cmd[[hi Pmenu ctermbg=NONE ctermfg=NONE]]
