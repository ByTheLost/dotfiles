local opt = vim.opt

opt.laststatus = 3
opt.ruler = false

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.scrolloff = 2
opt.termguicolors = true
opt.cursorline = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.sessionoptions = "buffers,curdir,tabpages,winsize,winpos"
opt.hlsearch = false

opt.signcolumn = "yes:1"
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↪ "

-- Atone
opt.undofile = true
vim.fn.mkdir(vim.fn.stdpath("data") .. "/undo", "p")
opt.undodir = vim.fn.stdpath("data") .. "/undo"
opt.undolevels = 1000

vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste -n",
    ["*"] = "wl-paste -n",
  },
  cache_enabled = false,
}

opt.clipboard = "unnamedplus"
