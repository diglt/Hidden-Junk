local Try, Fail = pcall(function()
    if getgenv().getreg then table.clear(getreg()) 
    end
end)

if not Try then 
    while true do
        warn("hiworld")
    end
end
