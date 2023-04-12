local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_ok then
    return
end

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
    return
end

mason_dap.setup({
    ensure_installed = { "python" },
    handlers = {
        function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
        end,
    }
})

dapui.setup()

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, {})
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function()
    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)

vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)

vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)

vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)

vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)
