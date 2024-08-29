getgenv().E = false
getgenv().Q = false
getgenv().QN = false
getgenv().Re = false
getgenv().C = false
getgenv().KillE123 = true
getgenv().P1 = false
getgenv().P2 = false
getgenv().P3 = false
getgenv().P4 = false
getgenv().PU = false
getgenv().SU = false
getgenv().WU = false
getgenv().CU = false
getgenv().CM = false

local plr = game.Players.LocalPlayer
local human = game.Players.LocalPlayer.Character.HumanoidRootPart
local char = game.Players.LocalPlayer.Character
local NPCs = game:GetService("Workspace").Live.NPCs.Client
local dis = 0
local closest = {{HumanoidRootPart = {Position = Vector3.new(9e9,9e9,9e9)}},9e9}
local clickremote = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ClickService"):WaitForChild("RF"):WaitForChild("Click")



function BigDist(p1,p2,dist)
	return math.abs(p1.Z-p2.Z)+math.abs(p1.X-p2.X) < dist
end



getgenv().Range = 10
getgenv().KA = true
function KillAura()
    spawn(function()
        while getgenv().KA == true and task.wait(0.0000001) do
            for i,v in pairs(NPCs:GetChildren()) do
                local NPCHumanoid = v:FindFirstChild("HumanoidRootPart")
                local NPCname = v.Name
                if NPCHumanoid and BigDist(human.Position,NPCHumanoid.Position,getgenv().Range) then
                    print("Range Found!")
                    clickremote:InvokeServer(NPCname)
                    print("Firing remote..!")
                end
            end
        end
        end)
    end        



function doKillEnemies()
    spawn(function()
        while KillE123 == true do
            if not getgenv then break end
            local enemies = game:GetService("Workspace").Live.NPCs.Client
            if enemies then
                for i,v in pairs(enemies:GetDescendants()) do
                    if v:IsA("MeshPart") then
                        local name = v.Parent.Name 
                        local UpperTorso = v.Parent:FindFirstChild("UpperTorso")
                        if UpperTorso then
                            human.CFrame = UpperTorso.CFrame
                            local args = {[1] = name}
                            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ClickService"):WaitForChild("RF"):WaitForChild("Click"):InvokeServer(unpack(args))
                            wait()  
                        end
                    end
                end
            end
        end
    end)
end

function PUpgrades()
    spawn(function()
        while PU == true do
            if not getgenv() then break end
            local args = {[1] = "Area 1",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 2",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 3",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 4",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 5",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 6",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 7",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 8",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 9",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 10",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 11",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 12",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 13",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 14",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 15",[2] = "Power Gain"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            wait()
        end
    end)
end            



function WUpgrades()
    spawn(function()
        while WU == true do
            if not getgenv() then break end
            local args = {[1] = "Area 1",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 2",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))            
            local args = {[1] = "Area 3",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 4",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 5",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 6",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 7",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 8",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 9",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 10",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 11",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 12",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 13",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 14",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 15",[2] = "WalkSpeed"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            wait(0.5)
        end
    end)
end      

function SUpgrades()
    spawn(function()
        while SU == true do
            if not getgenv() then break end
            local args = {[1] = "Area 1",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 2",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 3",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 4",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 5",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 6",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 7",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 8",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 9",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 10",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 11",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 12",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 13",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 14",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            local args = {[1] = "Area 15",[2] = "More Storage"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))
            wait(0.5)
        end
    end)
end      

function CUpgrades()
    spawn(function()
        while CU == true do
            if not getgenv() then break end
            local args = {[1] = "Area 3",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))  
            local args = {[1] = "Area 4",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 5",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 6",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 7",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 8",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 9",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 10",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 11",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 12",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 13",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 14",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 15",[2] = "Crit Chance"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            wait(0.5)
        end
    end)
end     

function CMUpgrades()
    spawn(function()
        while CM == true do
            if not getgenv() then break end
            local args = {[1] = "Area 4",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 5",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 6",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 7",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 8",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 9",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            local args = {[1] = "Area 10",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))  
            local args = {[1] = "Area 11",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args)) 
            local args = {[1] = "Area 12",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args)) 
            local args = {[1] = "Area 13",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args)) 
            local args = {[1] = "Area 14",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args)) 
            local args = {[1] = "Area 15",[2] = "Crit Multiplier"}
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UpgradeService"):WaitForChild("RF"):WaitForChild("Upgrade"):InvokeServer(unpack(args))   
            wait(0.5)
        end
    end)
end     

function doP1()
    spawn(function()
        while P1 == true do
            if not getgenv() then break end
            local args = {[1] = "Luck",[2] = "1200"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))
            local args = {[1] = "Luck",[2] = "900"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Luck",[2] = "600"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Luck",[2] = "300"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))                        
            wait()
        end
    end)
end

function doP2()
    spawn(function()
        while P2 == true do
            if not getgenv() then break end
            local args = {[1] = "Coins",[2] = "1200"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))
            local args = {[1] = "Coins",[2] = "900"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Coins",[2] = "600"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Coins",[2] = "300"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))                        
            wait()
        end
    end)
end


----

function doP3()
    spawn(function()
        while P3 == true do
            if not getgenv() then break end
            local args = {[1] = "Power",[2] = "1200"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))
            local args = {[1] = "Power",[2] = "900"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Power",[2] = "600"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Power",[2] = "300"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))                        
            wait()
        end
    end)
end


function doP4()
    spawn(function()
        while P4 == true do
            if not getgenv() then break end
            local args = {[1] = "Damage",[2] = "1200"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))
            local args = {[1] = "Damage",[2] = "900"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Damage",[2] = "600"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))            
            local args = {[1] = "Damage",[2] = "300"}game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("BoostService"):WaitForChild("RF"):WaitForChild("UseBoost"):InvokeServer(unpack(args))                        
            wait()
        end
    end)
end


function doC()
    spawn(function()
        while C == true do
            if not getgenv() then break end
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ClickService"):WaitForChild("RF"):WaitForChild("Click"):InvokeServer()
            wait()
        end
    end)
end


function doR()
    spawn(function()
        while Re == true do
            if not getgenv() then break end
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("AscendService"):WaitForChild("RF"):WaitForChild("Ascend"):InvokeServer()
            wait(5)
        end
    end)
end



-- GUI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
    Name = "Sword Fighters Simulator",
    LoadingTitle = "AOT Final out now!!",
    LoadingSubtitle = "by diglt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "Digital Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "wk2xtM8H", 
       RememberJoins = true 
    },
    KeySystem = false, 
    KeySettings = {
       Title = "",
       Subtitle = "",
       Note = "",
       FileName = "",
       SaveKey = true,
       GrabKeyFromSite = false, 
       Key = ""
    }
 })

 Rayfield:Notify({
    Title = "Notification",
    Content = "This script is not complete, excpect bugs and not abunch of features.",
    Duration = 3,
    Image = 4483362458,
    Actions = {
       Ignore = {
          Name = "Okay!",
          Callback = function()
       end
    },
 },
 })

 local Tab = Window:CreateTab("Main",4483362458)
 local Tab1 = Window:CreateTab("Other",4483362458) 
 local Tab2 = Window:CreateTab("Please Read!",4483362458) 

 local Paragraph = Tab2:CreateParagraph({Title = "I need your help.", Content = "If you wish to help in the completion of this script, please message me at diglt#3397. I need co-ordinates of each egg past bamboo, aswell as all the names of the hidden NPCS. If you do so your name will be features inside the credits."})
 
 local Section = Tab1:CreateSection("Other Features")

 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })




 local Paragraph = Tab1:CreateParagraph({Title = "Credits!", Content = "diglt#3997 -- Script Creator (all my scripts are created solo.)"})


 local Section = Tab:CreateSection("Main")


local Toggle = Tab:CreateToggle({
   Name = "Kill All (May break if used with other features.)",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().KillE123 = bool
    if bool then
        print("Kill All enabled")
        doKillEnemies()
    end
   end,
})

local Toggle = Tab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().KA = bool
     if bool then
         KillAura()
     end
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Auto Power",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().C = bool
     if bool then
         doC()
     end
    end,
 })


local Toggle = Tab:CreateToggle({
    Name =  "Auto Ascend",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Re = bool
     if bool then
         doR()
     end
    end,
 })
 

 local Section = Tab:CreateSection("Teleport To Eggs")

local eggPositions = {
    ["Weak Egg"] = Vector3.new(358, 150, -87),
    ["Strong Egg"] = Vector3.new(367, 150, -75),
    ["Paradise Egg"] = Vector3.new(2256, 149, -642),
    ["Bamboo Egg"] = Vector3.new(3966, 150, -432),
    ["Frozen Egg"] = Vector3.new(3966, 150, -432),
    ["Soft Egg"] = Vector3.new(2256, 149, -642),
    ["Lava Egg"] = Vector3.new(3966, 150, -432),
    ["Mummified Egg"] = Vector3.new(3966, 150, -432),
    ["Lost Egg"] = Vector3.new(3966, 150, -432),
    ["World Ore Egg"] = Vector3.new(358, 150, -87),
    ["Leaf Egg"] = Vector3.new(367, 150, -75),
    ["Aquatic Egg"] = Vector3.new(2256, 149, -642),
    ["Holy Egg"] = Vector3.new(3966, 150, -432),
    ["Canyon Egg"] = Vector3.new(3966, 150, -432),
    ["Titanic Egg"] = Vector3.new(2256, 149, -642),
    ["Underwaterr Egg"] = Vector3.new(3966, 150, -432),
}

local selectedEggPOS = eggPositions["Paradise Egg"] 
local Dropdown = Tab:CreateDropdown({
   Name = "Choose Teleported Egg",
   Options = {"Weak Egg","Strong Egg","Paradise Egg","Bamboo Egg","Frozen Egg","Soft Egg","Lava Egg","Mummified Egg","Lost Egg",},
   CurrentOption = "--",
   Callback = function(value)
       selectedEggPOS = eggPositions[value[1]]
   end,
})

local Button = Tab:CreateButton({
    Name = "Teleport To Selected Egg (Use Before Auto)",
    Callback = function()
        human.CFrame = CFrame.new(selectedEggPOS)
    end,
})

local Button = Tab:CreateButton({
    Name = "(Current max egg u teleport to is bamboo.)",
    Callback = function()
    end,
 })


local Section = Tab:CreateSection("Auto Eggs")



local selectedEgg
local Dropdown = Tab:CreateDropdown({
   Name = "Choose Auto Egg",
   Options = {"Egg 1","Egg 2","Egg 3","Egg 4","Egg 5","Egg 6","Egg 7","Egg 8","Egg 9","Egg 10","Egg 11","Egg 12","Egg 13","Egg 14","Egg 15","Egg 16"},
   CurrentOption = "--",
   Callback = function(value)
    selectedEgg = value[1]
   end,
})

function doE()
    spawn(function()
        while E == true do
        if not getgenv() then break end
        local args = {
            [1] = {
                ["eggName"] = selectedEgg,
                ["auto"] = false,
                ["amount"] = 1}}
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EggService"):WaitForChild("RF"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PetInvService"):WaitForChild("RF"):WaitForChild("EquipBest"):InvokeServer()                                         
           wait()
        end
    end)
end



local Toggle = Tab:CreateToggle({
    Name = "Auto Selected Egg",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().E = bool
     if bool then
         doE()
     end
    end,
 })

 local Button = Tab:CreateButton({
   Name = "Egg Prices + Names (Press F9 to read)",
   Callback = function()
       print("Egg1 (Weak Egg) = 500  Egg2 (Strong Egg) = 50k  Egg3 (Paradise Egg) = 3.75M   Egg5 (Bamboo Egg) = 6.75B  (Frozen Egg) = 20.25QA  (Soft Egg) = 52.49qi   (Lava Egg)  = 240Sx   (Mummified Egg)  = 780sp   (Lost Egg) =   (World Ore Egg) =  3dc  (Leaf Egg) = 11.24ud  (Aquatic Egg) = 40.5Dd  (Holy Egg) = 168Td  (Canyon Egg) = 85.5Qad   (Titanic Egg) = 281.25Qid   (Underwater Egg) = 978.88Sxd")
   end,
})


local Section = Tab:CreateSection("Powers")

local Toggle = Tab:CreateToggle({
    Name = "Auto Damage Boost",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().P4 = bool
     if bool then
         doP4()
     end
    end,
 })


local Toggle = Tab:CreateToggle({
    Name = "Auto Power Boost",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().P3 = bool
     if bool then
         doP3()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Coin Boost",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().P2 = bool
     if bool then
         doP2()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Luck Boost",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().P1 = bool
     if bool then
         doP1()
     end
    end,
 })

 local Section = Tab:CreateSection("Upgrades")


 local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade Power",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().PU = bool
     if bool then
         PUpgrades()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade Storage",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().SU = bool
     if bool then
         SUpgrades()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade Walkspeed",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().WU = bool
     if bool then
         WUpgrades()
     end
    end,
 })


 local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade Critical Chance",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().CU = bool
     if bool then
         CUpgrades()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade Crit Multiplier",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().CM = bool
     if bool then
        CMUpgrades()
     end
    end,
 })

local Section = Tab:CreateSection("Quests")

local selectedQuest
local Dropdown = Tab:CreateDropdown({
   Name = "Choose Area",
   Options = {"Area 1","Area 2","Area 3","Area 4","Area 5","Area 6","Area 7","Area 8","Area 9","Area 10","Area 11","Area 12","Area 13","Area 14"},
   CurrentOption = "--",
   Callback = function(value)
    selectedQuest = value[1]
   end,
})


function doQ()
    spawn(function()
        while Q == true do
        if not getgenv() then break end
        local args = {[1] = selectedQuest}
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RF"):WaitForChild("ActionQuest"):InvokeServer(unpack(args))        
        wait()
        end
    end)
end


local Toggle = Tab:CreateToggle({
    Name = "Auto Accept Area Quest",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Q = bool
     if bool then
         doQ()
         wait()
     end
    end,
 })


local selectedNPC
local Dropdown = Tab:CreateDropdown({
   Name = "Choose NPC",
   Options = {"Sword Master","Soul Teacher","Egg Master","Executioner"},
   CurrentOption = "--",
   Callback = function(value)
    selectedNPC = value[1]
   end,
})


function doQN()
    spawn(function()
        while QN == true do
        if not getgenv() then break end
        local args = {[1] = selectedNPC}
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("QuestService"):WaitForChild("RF"):WaitForChild("ActionQuest"):InvokeServer(unpack(args))        
        wait()
        end
    end)
end



 local Toggle = Tab:CreateToggle({
    Name = "Auto NPC Quest",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().QN = bool
     if bool then
         doQN()
         wait()
     end
    end,
 })



 local Section = Tab:CreateSection("Codes")

 local Button = Tab:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
 local args = {[1] = "ascend"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "BugsSquashed"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Celestial"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Christmas"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "COLLECTOR"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Eggmaster"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "FeelingLucky"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "GetRich"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "GODLIKE"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Holiday"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Kolapo"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "NewYear"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Oatsz"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Secret"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Sharpen"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Spraden"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Striker"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "Strongest"}
 game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
 local args = {[1] = "LUCKY100"}
game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("CodeService"):WaitForChild("RF"):WaitForChild("RedeemCode"):InvokeServer(unpack(args))
    end,
 })
