getgenv().click = true 
getgenv().collect = true 
getgenv().button = true 
getgenv().crate = true 

local rp = game.Players.LocalPlayer.Character.HumanoidRootPart
local nm = game.Players.LocalPlayer.Name
local lp = game.Players.LocalPlayer
local base 


function findBase()
    for i,v in pairs(game:GetService("Workspace").Tycoons.Spawned:GetDescendants()) do 
        if v:IsA("ObjectValue") and v.Name == "Owner" and v.Value ~= nil and v.Value.Name == nm then 
            base = v.Parent.Parent
            task.wait()
            return base
        end
    end
end

findBase()
local newbase = tostring(base)


function autoCollect()
    while collect == true do 
        task.wait(0.00001)
        local oldPos = rp.Position
        for i,v in pairs(game:GetService("Workspace").Tycoons.Spawned[newbase].Objects.Floor1.Begin.Begin.CashCollector:GetDescendants()) do 
            if v:IsA("TouchTransmitter") and v.Parent ~= nil then
                local p = v.Parent
                local t = v 
                rp.CFrame = CFrame.new(-516, 4, -66)
                firetouchinterest(rp, p, 0)
                firetouchinterest(rp, p, 1)
                wait(0.2)
            end
        end
        rp.CFrame = CFrame.new(oldPos)
    end
end

function getCrates()
    while crate == true do 
        for _, crate in pairs(game:GetService("Workspace").SupplyDrop.Spawned:GetDescendants()) do 
            if crate:IsA("ClickDetector") then 
                fireclickdetector(crate)
                else
            end
        end
        task.wait()        
    end
end


function buyButtons()
    while button == true do 
        task.wait(0.5)
        for i,v in pairs(game:GetService("Workspace").Tycoons.Spawned[newbase].Buttons:GetDescendants()) do 

            local mc = lp.leaderstats.Cash.Value
            local me = lp.leaderstats.Energy.Value

            if v:IsA("Model") and v.Parent ~= nil then
                local touch = v:FindFirstChild("TouchPart")
                local dhem = v 
                    if touch ~= nil then 
                        local pricevalue = v:FindFirstChild("PriceValues")
                            if pricevalue then 
                                local price = pricevalue:FindFirstChild("Cash")
                                    local notprice = pricevalue:FindFirstChild("Energy")
                                    if notprice ~= nil then 
                                        local np = notprice.Value
                                    elseif price ~= nil then
                                        local pv = price.Value
                                            if price or notprice ~= nil then 
                                                if pv <= mc or np <= me then 
                                                    for i,v2 in pairs(game:GetService("Workspace").Tycoons.Spawned[newbase].Buttons:GetDescendants()) do 
                                                        if v2:IsA("TouchTransmitter") and v2.Parent == touch and v2.Parent.Parent == dhem then 
                                                            print(dhem)
                                                            print(touch.Parent)
                                                        firetouchinterest(rp, touch, 0)
                                                firetouchinterest(rp, touch, 1)
                                            else
                                        end
                                    end
                                end
                            end
                        end 
                    end
                end   
            end
        end
    end
end



function autoClick()
    while click == true do 
        fireclickdetector(game:GetService("Workspace").Tycoons.Spawned[newbase].Objects.Floor1.Begin.Begin.DropMachine1.ClickPart.ClickDetector)
        task.wait() 
    end
end

-- remove the -- if u wanna use that function :)

--autoClick()
---getCrates()
--autoCollect() buggy/pointless
--buyButtons() 
