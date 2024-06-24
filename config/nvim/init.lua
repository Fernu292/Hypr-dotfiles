vim.cmd("set number")
vim.cmd("set mouse=a")
vim.cmd("syntax enable")
vim.cmd("set showcmd")
vim.cmd("set encoding=utf-8")
vim.cmd("set showmatch")
vim.cmd("set relativenumber")
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=0")
vim.cmd("set autoindent")
vim.cmd("set smarttab")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin", 
        priority = 1000 
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate"
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", 
            "MunifTanjim/nui.nvim",
        }
    }
}
local opts = {}

require("lazy").setup(plugins, opts)

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})


local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = {"lua", "c", "javascript"},
    highlight = { enable = true },
    indent = { enable = true },
})

require("lualine").setup({
    options = {
        theme = 'Material',
    }
})
require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd.colorscheme "catppuccin"

