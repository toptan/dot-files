local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
    use("folke/which-key.nvim")
    use("nvim-lualine/lualine.nvim")
    use("akinsho/toggleterm.nvim")
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" })
    use({ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" })
    use("lewis6991/impatient.nvim")
    use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
    use("akinsho/bufferline.nvim")
    use("moll/vim-bbye")
    use("goolord/alpha-nvim")
    use("ahmedkhalf/project.nvim")

    -- Color schemes
    use("lunarvim/onedarker.nvim")
    use("lunarvim/darkplus.nvim")
    use("lunarvim/lunar.nvim")
    use("folke/tokyonight.nvim")
    use("overcache/NeoSolarized")
    use({ "catppuccin/nvim", as = "catppuccin" })
    --	use("xero/miasma.nvim")
    use("rebelot/kanagawa.nvim")
    -- use("sainnhe/everforest")
    use("bluz71/vim-nightfly-colors")
    use("ray-x/aurora")
    use("ramojus/mellifluous.nvim")
    use("rafamadriz/neon")
    use({ "neanias/everforest-nvim", as = "everforest-nvim" })
    use({ "lalitmee/cobalt2.nvim", requires = "tjdevries/colorbuddy.nvim" })

    -- Completion
    use("hrsh7th/nvim-cmp")      -- The completion plugin
    use("hrsh7th/cmp-buffer")    -- buffer completions
    use("hrsh7th/cmp-path")      -- path completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Snippets
    use("L3MON4D3/LuaSnip")          --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- LSP
    use("neovim/nvim-lspconfig")        -- enable LSP
    use("williamboman/mason.nvim")      -- simple to use language server installer
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("RRethy/vim-illuminate")

    -- Git stuff
    use("lewis6991/gitsigns.nvim")

    -- Telescope
    use("nvim-telescope/telescope.nvim")

    -- Treesitter
    -- use({ "nvim-treesitter/nvim-treesitter", commit = "226c1475a46a2ef6d840af9caa0117a439465500" })
    use("nvim-treesitter/nvim-treesitter")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
