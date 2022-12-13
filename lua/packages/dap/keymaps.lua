local keymap = require('utils').map

local start = '<leader>d';

keymap( "n", start .. "ui", ":lua require('dapui').toggle()<CR>" )
keymap( "n", start .. "bt", ":lua require('dap').toggle_breakpoint()<CR>" )
keymap( "n", start .. "c", ":lua require('dap').continue()<CR>" )

keymap( "n", start .. "so", ":lua require('dap').step_over()<CR>" )
keymap( "n", start .. "si", ":lua require('dap').step_into()<CR>" )
keymap( "n", start .. "st", ":lua require('dap').step_out()<CR>" )

keymap( "n", start .. "hh", ":lua require('dap.ui.variables').hover()<CR>" )
keymap( "v", start .. "hv", ":lua require('dap.ui.variables').visual_hover()<CR>" )

keymap( "n", start .. "uh", ":lua require('dap.ui.widgets').hover()<CR>" )
keymap( "n", start .. "uf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>" )

keymap( "n", start .. "sc", ":lua require('dap.ui.variables').scopes()<CR>" )

