vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

local fzf = require('fzf-lua')
vim.keymap.set('n', '<leader>pf', fzf.files,       { desc = "Files" })
vim.keymap.set('n', '<leader>pp', fzf.git_files,   { desc = "Git" })
vim.keymap.set('n', '<leader>pg', fzf.grep_visual, { desc = "Grep" })
vim.keymap.set('n', '<leader>pm', fzf.manpages,    { desc = "Manpages" })
vim.keymap.set('n', '<leader>pt', fzf.tabs,        { desc = "Tabs" })
