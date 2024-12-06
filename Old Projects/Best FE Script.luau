xpcall(function() table.clear(getreg()) end,function(e) if e then warn'failed' while true do  spawn(function() warn"!" end) end end end)
