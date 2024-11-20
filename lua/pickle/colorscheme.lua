
-- The theme to use
local theme = "dracula"

-- Try loading the color scheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. theme)
if not status_ok then
    -- If it couldn't be loaded, warn the user
    vim.notify("WARNING::colorscheme: Could not load \"" .. theme .. "\"!")
end
