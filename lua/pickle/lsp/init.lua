-- Setup requirements
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("WARNING:lspconfig was not loaded!")
    return
end

require("pickle.lsp.mason")
require("pickle.lsp.handlers").setup()

