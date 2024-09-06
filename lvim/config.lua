-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Set python executable based on the operating system.
if vim.loop.os_uname()["sysname"] == "Darwin" then
  vim.g.python3_host_prog =
  "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
elseif vim.loop.os_uname()["sysname"] == "Linux" then
  vim.g.python3_host_prog = "/usr/bin/python3"
elseif vim.loop.os_uname()["sysname"] == "Windows_NT" then
  vim.g.python3_host_prog =
  "C:/Users/ToplicaTanaskovic/AppData/Local/Programs/Python/Python312/python.EXE"
end

lvim.colorscheme = "kanagawa-dragon"

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "EdenEast/nightfox.nvim" },
  { "rebelot/kanagawa.nvim" },
}

lvim.builtin.alpha.dashboard.section.header.val = {
  [[Where there is a shell, there is a way.]]
}

lvim.builtin.alpha.dashboard.section.footer.val = {
  [[The computing scientist’s main challenge is not to]],
  [[get confused by the complexities of his own making.]],
  [[]],
  [[                              -- Edsger W. Dijkstra]],
}

local dap = require("dap")
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}

dap.configurations.cpp = dap.configurations.c
