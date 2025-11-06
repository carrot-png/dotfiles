vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Open error diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Close error diagnostics
vim.keymap.set('n', '<esc>', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative == 'win' then
      vim.api.nvim_win_close(win, false)
    end
  end
end)

local map = function(m, lhs, rhs, opts)
  vim.keymap.set(m, lhs, function() rhs(opts) end)
end
local lsp = vim.lsp

-- Jump to next/previous error
map('n', '<leader>n', vim.diagnostic.jump, { count = 1, float = true })
map('n', '<leader>p', vim.diagnostic.jump, { count = -1, float = true })

-- LSP actions
map('n', '<F2>', lsp.buf.rename)
map('n', '<F3>', lsp.buf.format, { async = true })
map('n', '<F4>', lsp.buf.code_action)
map('n', 'gd', lsp.buf.definition)
map('n', 'gD', lsp.buf.declaration)
map('n', 'gr', lsp.buf.references)

if lsp.inlay_hint then
  vim.keymap.set('n', '<leader>L', function()
    lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
  end)
end

--  Run current file
local runners = {
  javascript = "node %",
  sh = "bash %"
}

for ft, cmd in pairs(runners) do
  vim.api.nvim_create_autocmd('FileType', {
    pattern = ft,
    callback = function()
      vim.keymap.set('n', '<leader>r', ':!' .. cmd .. '<CR>', { buffer = true})
    end,
  })
end
