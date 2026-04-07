vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "(0"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.cmd.colorscheme("nordfox")

local au_group = vim.api.nvim_create_augroup("CustomConfig", { clear = true })

-- Allow tabs in Makefiles
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "make", "automake" },
	group = au_group,
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 8
	end,
})

-- Highlight Forbidden Whitespace
vim.api.nvim_set_hl(0, "ForbiddenWhitespace", { ctermbg = "red", bg = "red" })

-- Set the initial match
vim.cmd([[match ForbiddenWhitespace /\s\+$\|\t/]])

-- Handle InsertEnter logic
vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	group = au_group,
	command = [[match ForbiddenWhitespace /\t\|\s\+\%#\@<!$/]],
})

-- Optional: Revert the match rule when leaving Insert mode to save processing power, though your original script didn't explicitly include this.
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	group = au_group,
	command = [[match ForbiddenWhitespace /\s\+$\|\t/]],
})
