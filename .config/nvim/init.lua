vim.opt.shell = "bash"
vim.opt.clipboard = "unnamedplus" -- to use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup("plugins")

require("nvimtree")

require("dracula").setup({
  transparent_bg = true, -- make the background transparent
  italic_comment = true, -- italicize comments
})
vim.cmd.colorscheme("dracula")
