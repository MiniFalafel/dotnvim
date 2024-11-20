
-- SETTINGS
local servers = {
    "lua_ls",
    "clangd",
    "pylsp",
}

local settings = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}


-- Setup MASON
-- check requirements
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
    vim.notify("WARNING:mason could not be loaded!")
    return
end

mason.setup(settings)

-- Setup MASON lspconfig
-- requirements
local mlspcfg_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlspcfg_status_ok then
    vim.notify("WARNING:mason-lspconfig could not be loaded!")
    return
end

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true
})



-- LSPCONFIG
-- check requirements
local lspcfg_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspcfg_status_ok then
    vim.notify("WARNING:lspconfig could not be loaded!")
    return
end


local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("pickle.lsp.handlers").on_attach,
        capabilities = require("pickle.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, server_opts = pcall(require, "pickle.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", server_opts, opts)
    end

    lspconfig[server].setup(opts)
end

