-- local colorscheme = "everforest"
local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd [[ colorscheme default ]]
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
