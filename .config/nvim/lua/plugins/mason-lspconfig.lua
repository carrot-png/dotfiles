return {
  'mason-org/mason-lspconfig.nvim',
  opts = {},
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
  config = function()
    vim.lsp.config('tinymist', {
      cmd = { "tinymist" },
      filetypes = { "typst" },
      settings = {
        exportPdf = "onType",
      }
    })
    vim.lsp.enable('tinymist')
  end,
}
