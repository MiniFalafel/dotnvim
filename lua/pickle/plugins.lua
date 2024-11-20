local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
        install_path
    }
    print "Installing packer! Close and re-open Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Auto reload neovim whenever the "plugins.lua" file changes
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use protected call to require packer for first time use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("WARNING: Couldn't import packer!")
    return
end


-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


-- ==> PLUGIN INSTALLATION <==
return packer.startup(function(use)
    --  My plugins
    use "wbthomason/packer.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-lua/plenary.nvim"

    -- install without yarn or npm
    --use({
    --    "iamcco/markdown-preview.nvim",
    --    run = function() vim.fn["mkdp#util#install"]() end,
    --})

    -- Completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"

    -- Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP plugins
    use "neovim/nvim-lspconfig" -- enable lsp
    use "williamboman/mason-lspconfig" -- enable lsp
    use "williamboman/mason.nvim" -- simple lsp installer

    -- Color schemes
    use "lunarvim/colorschemes"
    use 'Mofiqul/dracula.nvim'

    -- Set up configuration after packer setup
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


