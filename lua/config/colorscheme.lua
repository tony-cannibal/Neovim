
function ColorScheme(color, trans)
    vim.cmd.colorscheme(color)
    if trans == true then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

local color_chemes = {
    "matrix",           -- 1
    "gruvbox",          -- 2
}

local transparent = false

ColorScheme(color_chemes[2], transparent)
