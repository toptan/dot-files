local M = { 
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
}

if vim.fn.has('freebsd') == 1 then
    M.cmd = { "clangd16" }
end

return M

