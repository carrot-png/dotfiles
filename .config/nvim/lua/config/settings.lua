vim.opt.rnu = true
vim.opt.nu = true
vim.opt.nuw = 3
vim.opt.signcolumn = "no"
vim.opt.scrolloff = 10
vim.opt.smartindent = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.g.netrw_banner = 0

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'
vim.opt.undofile = true

vim.opt.list = true
local space = "·"
vim.opt.listchars = {
  tab = "· ",
  multispace = " ",
  lead = " ",
  trail = space,
  nbsp = space
}

-- stop multiline comments on <Enter>
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "o", "r" }
  end
})
