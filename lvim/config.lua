-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

if vim.fn.has('macunix') then
  vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
else
  vim.g.python3_host_prog = "/usr/bin/python3"
end

lvim.colorscheme = "nightfox"

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "EdenEast/nightfox.nvim" },
}

lvim.builtin.alpha.dashboard.section.header.val = {
  [[ _________________________________ ]],
  [[|:::::::::::::;;::::::::::::::::::|]],
  [[|:::::::::::'~||~~~``:::::::::::::|]],
  [[|::::::::'   .':     o`:::::::::::|]],
  [[|:::::::' oo | |o  o    ::::::::::|]],
  [[|::::::: 8  .'.'    8 o  :::::::::|]],
  [[|::::::: 8  | |     8    :::::::::|]],
  [[|::::::: _._| |_,...8    :::::::::|]],
  [[|::::::'~--.   .--. `.   `::::::::|]],
  [[|:::::'     =8     ~  \ o ::::::::|]],
  [[|::::'       8._ 88.   \ o::::::::|]],
  [[|:::'   __. ,.ooo~~.    \ o`::::::|]],
  [[|:::   . -. 88`78o/:     \  `:::::|]],
  [[|::'     /. o o \ ::      \88`::::|]],
  [[|:;     o|| 8 8 |d.        `8 `:::|]],
  [[|:.       - ^ ^ -'           `-`::|]],
  [[|::.                          .:::|]],
  [[|:::::.....           ::'     ``::|]],
  [[|::::::::-'`-        88          `|]],
  [[|:::::-'.          -       ::     |]],
  [[|:-~. . .                   :     |]],
  [[| .. .   ..:   o:8      88o       |]],
  [[|. .     :::   8:P     d888. . .  |]],
  [[|.   .   :88   88      888'  . .  |]],
  [[|   o8  d88P . 88   ' d88P   ..   |]],
  [[|  88P  888   d8P   ' 888         |]],
  [[|   8  d88P.'d:8  .- dP~ o8       |]],
  [[|      888   888    d~ o888    LS |]],
  [[|_________________________________|]],
  [[                                   ]],
  [[     "He will join us or die."     ]],
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
