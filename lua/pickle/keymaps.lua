
-- keymapping options
local opts = { noremap = true, silent = true }

-- shorten function name
local keymap = vim.api.nvim_set_keymap


-- Set leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader   = " "
vim.g.localleader = " "

-- MODES
--  > "n": NORMAL MODE
--  > "i": INSERT MODE
--  > "v": VISUAL MODE
--  > "x": VISUAL BLOCK MODE
--  > "t": TERM MODE
--  > "c": COMMAND MODE

-- ==> Normal <==
-- Buffer navigation
keymap("n", "<C-A>k", ":bnext<cr><esc>", opts)
keymap("n", "<C-A>j", ":bprevious<cr><esc>", opts)

-- File Saving
keymap("n", "<C-s>", ":w<cr>", opts)


-- Viewspace Navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
-- Viewspace resizing
keymap("n", "<C-A-Up>",    ":resize +2<cr>", opts)
keymap("n", "<C-A-Down>",  ":resize -2<cr>", opts)
keymap("n", "<C-A-Left>",  ":vertical resize -2<cr>", opts)
keymap("n", "<C-A-Right>", ":vertical resize +2<cr>", opts)

-- toggle search highlight
keymap("n", "<F3>", ":set hlsearch!<cr>", opts)

-- LEADER KEY UTILS
keymap("n", "<leader>e", ":Lexplore 20<cr>", opts)
-- View splitting
keymap("n", "<leader>v", ":vsplit<cr>", opts)
keymap("n", "<leader>h", ":split<cr>", opts)
-- Close View
keymap("n", "<leader>w", ":q<cr>", opts)


-- ==> INSERT <==
-- File Saving
keymap("i", "<C-s>", "<esc>:w<cr>", opts)
-- Enter normal mode
keymap("i", "jk", "<ESC>", opts)
-- Move text up and down
keymap("i", "<A-Down>", "<esc>v:m .+1<cr>i", opts)
keymap("i", "<A-Up>",   "<esc>v:m .-2<cr>i", opts)

-- Quick selection
keymap("i", "<S-Up>",    "<esc><S-v><Up>", opts)
keymap("i", "<S-Down>",  "<esc><S-v><Down>", opts)
keymap("i", "<S-Left>",  "<esc>vh", opts)
keymap("i", "<S-Right>", "<esc>vl", opts)

-- Ctrl backspacing
keymap("i", "<C-BS>", "<C-W>", opts)

-- Cycling through buffers
keymap("n", "<C-Tab>", "<esc>:bnext<cr>", opts)
keymap("n", "<C-S-Tab>", "<esc>:bprev<cr>", opts)



-- ==> VISUAL <==
-- Nicer selection indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<cr>==", opts)
keymap("v", "<A-k>", ":m .-2<cr>==", opts)

-- Make it so paste doesn't also copy replaced contents
keymap("v", "p", '"_Dp"', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", opts)
keymap("x", "K", ":move '<-2<cr>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

