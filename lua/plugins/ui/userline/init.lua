local heirline_ok, heirline = pcall(require, "heirline")
if not heirline_ok then
    return
end

local utils = require("heirline.utils")

require("plugins.ui.userline.colors")


local ViMode = require("plugins.ui.userline.mode")
local Location = require("plugins.ui.userline.location")
local FileName = require("plugins.ui.userline.filename")
local Diagnostics = require("plugins.ui.userline.diagnostics")
local LSPActive = require("plugins.ui.userline.lsp-active")
local Git = require("plugins.ui.userline.git-status")

local Align = { provider = "%=" }
local Space = { provider = " " }


local StatusLine = {
    { { ViMode },    { Diagnostics }, { Git } },
    { Align },
    { { LSPActive }, { FileName },    { Location.Ruler, Location.ScrollBar, Space } }
}

heirline.setup({
    statusline = StatusLine,
})
