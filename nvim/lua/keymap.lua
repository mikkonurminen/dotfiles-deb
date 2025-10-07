local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end

-- Navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
-- Beginning and end of line
map("i", "<C-e>", "<End>")
map("i", "<C-a>", "<Esc>^i")
-- Map jj to Esc
map("i", "jj", "<Esc>")

-- Clear highlight
map("n", "<Esc>", ":noh <CR>")
-- Move between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- Terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")

-- Center when half-page jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center search terms
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- Quickly save the current buffer or all buffers
map("n", "<leader>w", "<CMD>update<CR>")
map("n", "<leader>W", "<CMD>wall<CR>")

--Resize window
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move to the next/previous buffer
map("n", "<leader>[", "<CMD>BufferLineCycleNext<CR>")
map("n", "<leader>]", "<CMD>BufferLineCyclePrev<CR>")

-- Split windows
map("n", "<leader>vs", "<CMD>vsplit<CR>")
map("n", "<leader>hs", "<CMD>split<CR>")

-- Move line up and down in normal and visual modes
map("n", "<A-k>", "<CMD>move .-2<CR>")
map("n", "<A-j>", "<CMD>move .+1<CR>")
map("x", "<A-j>", ":move '>+1<CR>gv=gv")
map("x", "<A-k>", ":move '<-2<CR>gv=gv")
-- Append the line below to the current line with space between
map("n", "<A-Down>", "mzJ`z")

-- Do not copy to register when deleting character
map("n", "x", '"_x')
-- Preserve highlighted copied word in the buffer when pasteing over another
-- word
map("x", "<leader>p", '"_dp')
-- Search and start replacing all words where the cursor is
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")
map("n", "<leader>nf", ":NvimTreeFocus<CR>")

-- Format code
--map("n", "<leader>lf", "<CMD>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>")

-- which-key
local function which_key()
	require("which-key").show({ global = false })
end
map("n", "<leader>?", which_key, { desc = "Buffer Local Keymaps (which-key)" })

-- Toggle light/dark background
local function toggle_background()
	if vim.o.background == "light" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
end
map("n", "<leader>bt", toggle_background, { desc = "Toggle background light/dark" })
