return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
    },
  },
}
