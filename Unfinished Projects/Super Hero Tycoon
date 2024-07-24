local Players = game:GetService("Players")
local lp = game.Players.LocalPlayer
local rp = lp.Character.HumanoidRootPart

local PossibleTycoons = {}
local MyTycoon
function GetTycoon() 
    for i,v in pairs(game:GetService("Workspace").Tycoons.Tycoons:GetDescendants()) do
        if v:IsA("ObjectValue") and v.Name == "Owner" and v.Value ~= nil then
            table.insert(PossibleTycoons,v)
            
            for i,tycoon in next,PossibleTycoons do
                if tycoon.Value == lp then 
                    MyTycoon = tostring(tycoon.Parent)
                end
            end
        end
    end
end

GetTycoon()
local TycoonPath = game:GetService("Workspace").Tycoons.Tycoons[MyTycoon]



function buyButtons()
    for i,v in pairs(TycoonPath.Buttons:GetDescendants()) do 
       if v:IsA("IntValue") and v.Name == "Price" then 
                    local TouchPart = v.Parent.Head
                firetouchinterest(rp,TouchPart,0)
                task.wait()
                firetouchinterest(rp,TouchPart,1)
       end
    end
    wait(1)
end


function getCash()
    for i,v in pairs(TycoonPath:GetDescendants()) do 
       if v.Name == "Giver" and v:IsA("Part") and v:FindFirstChildOfClass("TouchTransmitter") then 
            firetouchinterest(rp,v,0)
            task.wait()
            firetouchinterest(rp,v,1)
        end
    end
    wait(1)
end

function collectCrates()
    for i,crate in pairs(game:GetService("Workspace").Crates:GetChildren()) do 
        if crate:IsA("Model") and crate.CashCrate:FindFirstChildOfClass("TouchTransmitter") then 
            firetouchinterest(rp,crate.CashCrate,0)
            task.wait()
            firetouchinterest(rp,crate.CashCrate,1)
        elseif crate == nil then 
            break
        end
    end
end

function spamClick()
    fireclickdetector(game:GetService("Workspace").Tycoons.Tycoons["Green Lantern"].Essentials.Drop0.Model.clicker.ClickDetector)
    wait(1)
end


while task.wait() do 
--collectCrates()
--buyButtons()
--getCash()
--spamClick()
end
