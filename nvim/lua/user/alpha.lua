local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
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
[[     "He will join us or die.      ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return ""
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
