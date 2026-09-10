vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw (nvim-tree's job)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim
--  Schedile the setting after `UiEnter` because it might increase startup-time
--  Sett `:help clipboard`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Per-window statuslines (never a single global bar), so the NvimTree
-- pane keeps its own disabled/blank statusline (see lualine config).
vim.opt.laststatus = 2

-- Keep signcolumn visible so diagnostics don't shift the layout
vim.opt.signcolumn = "yes"

-- Set relative line numbers
vim.opt.relativenumber = true

-- Blank the statusline row in NvimTree windows. Belt-and-braces next to
-- lualine's disabled_filetypes: guarantees "nothing under nvim-tree"
-- whatever the lualine refresh ordering is.
vim.api.nvim_create_autocmd("FileType", {
	desc = "Blank statusline in NvimTree windows",
	group = vim.api.nvim_create_augroup("blank-nvimtree-statusline", { clear = true }),
	pattern = "NvimTree",
	callback = function()
		vim.opt_local.statusline = " "
	end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
