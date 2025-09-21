return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  config = function(_, opts)
    require('mason-lspconfig').setup(opts)

    vim.lsp.config('tinymist', {
      cmd = { 'tinymist' },
      filetypes = { 'typst' },
      settings = { 
        exportPdf = 'onType' 
      },
    })
  end,
}

