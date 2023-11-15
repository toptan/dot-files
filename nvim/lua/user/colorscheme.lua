local colorscheme = "everforest"
-- local colorscheme = "tokyonight-night"

if colorscheme == "everforest" then
    vim.g.everforest_background = "hard"
    vim.g.everforest_better_performance = 1
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd [[ colorscheme default ]]
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
