local g = vim.g
local o = vim.o

o.fileencoding = "utf-8"
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.scrolloff = 8
o.wrap = false

o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

o.clipboard = "unnamedplus"

o.mouse = "a"
o.undofile = true

o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true

-- Interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250
o.timeoutlen = 400
-- Used by gitsigns etc
--o.signcolumn = "yes"

o.termguicolors = true
o.colorcolumn = "80"
o.showtabline = 0
o.showmode = false

g.mapleader = " "

