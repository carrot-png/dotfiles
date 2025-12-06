return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)
    -- local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')

    vim.lsp.config('tinymist', {
      cmd = { 'tinymist' },
      filetypes = { 'typst' },
      settings = {
        formatterMode = 'typstyle',
        exportPdf = 'onType'
      },
    })

    local host, port = '127.0.0.1', '6005'
    local cmd = { 'nc', host, port }

    local ok, conn = pcall(vim.lsp.rpc.connect, host, port)
    if ok and conn then
      cmd = conn
    end

    vim.lsp.config('gdscript', {
      cmd = cmd,
      filetypes = { 'gd', 'gdscript' },
      root_dir = util.root_pattern('project.godot', '.git'),
    })
  end,
}
