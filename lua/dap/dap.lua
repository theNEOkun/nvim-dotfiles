local utils = require('utils')
local keymap = utils.map

keymap( "n", "<F4>", ":lua require('dapui').toggle()<CR>" )
keymap( "n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>" )
keymap( "n", "<F9>", ":lua require('dap').continue()<CR>" )

keymap( "n", "<F1>", ":lua require('dap').step_over()<CR>" )
keymap( "n", "<F2>", ":lua require('dap').step_into()<CR>" )
keymap( "n", "<F3>", ":lua require('dap').step_out()<CR>" )

keymap( "n", "<Leader>dsc", ":lua require('dap').continue()<CR>" )
keymap( "n", "<Leader>dsv", ":lua require('dap').step_over()<CR>" )
keymap( "n", "<Leader>dsi", ":lua require('dap').step_into()<CR>" )
keymap( "n", "<Leader>dso", ":lua require('dap').step_out()<CR>" )

keymap( "n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>" )
keymap( "v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>" )

keymap( "n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>" )
keymap( "n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>" )

keymap( "n", "<Leader>dro", ":lua require('dap').repl.open()<CR>" )
keymap( "n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>" )

keymap( "n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" )
keymap( "n", "<Leader>dbm", ":lua require('dap').set_breakpoint( nil, nil, vim.fn.input('Log point message: ') )<CR>" )
keymap( "n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>" )

keymap( "n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>" )
keymap( "n", "<Leader>di", ":lua require('dapui').toggle()<CR>" )
