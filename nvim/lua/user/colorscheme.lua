local colorscheme = "everforest"

if colorscheme == "everforest" then
    local status_ok, everforest = pcall(require, "everforest")
    if status_ok then
        everforest.setup({
            background = "medium",
            transparent_background_level = 1,
            ui_contrast = "high",
        })
    end
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.cmd [[ colorscheme default ]]
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
