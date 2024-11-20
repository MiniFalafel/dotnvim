-- :help :options
local options = {
    -- ==> VISUALS <==
-- Spacing
    cmdheight      = 2,
    conceallevel   = 0,
    pumheight      = 10,
    showtabline    = 2,    -- 0 = never, 1 = > 1, 2 = always
    numberwidth    = 4,    -- The size of the line numbering column

    -- Styling
    -- guifont        = "monospace:h17", -- I might keep this to just be the terminal font
    termguicolors  = true, -- might disable if it interferec with syntax highlighting
    hlsearch       = true,
    cursorline     = true, -- Highlight the current line

    -- Visibility
    -- showmode      = false, -- THIS MIGHT BE HANDY LATER WHEN I'M MORE USED TO VIM
    number         = true, -- Show line numbers
    relativenumber = false,
    signcolumn     = "yes",
    -- LINE WRAP
    wrap           = false,
    scrolloff      = 8,    -- How many lines to display around the cursor at the start and ends of files
    sidescrolloff  = 8,


    -- ==> BEHAVIOR <==
    -- Files
    backup         = false,
    swapfile       = false,
    fileencoding   = "utf-8",
    undofile       = true, -- This creates a persistent undo buffer (fuckin sick)

    -- Search
    ignorecase     = true,
    smartcase      = true, -- means search patterns will become case sensitive if upper case letters are present

    -- Input/Devices
    clipboard      = "unnamedplus",
    mouse          = "a",
    timeoutlen     = 1000, -- The amount of time (millis) for mapped sequences to complete within

    -- UI
    completeopt    = { "menuone", "noselect" },
    splitbelow     = true,
    splitright     = true,

    -- Editing
    smartindent    = true,
    updatetime     = 300,  -- Makes completion faster (default is 4000ms)
    expandtab      = true, -- Converts tabs to spaces (yes pleEEEAAsSSse)
    -- indentation sizing
    shiftwidth     = 4,
    tabstop        = 4,
}

-- Set the options from the array
for k, v in pairs(options) do
    vim.opt[k] = v
end

-- shortmess:append "c" I have no idea what this does

-- WordSeparation
vim.cmd "set iskeyword+=-"
vim.cmd "set whichwrap+=<,>,[,],h,l"

