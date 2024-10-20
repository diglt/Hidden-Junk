getgenv().Toggle = true

local lp = game:GetService("Players").LocalPlayer

function CheckValid(Object, Target)
    if Object ~= nil then 
        return Object:IsDescendantOf(Target or game.Workspace) 
    end
end

function CheckAlive(humanoid)
    if humanoid ~= nil then 
        return humanoid and (CheckValid(humanoid) and humanoid.Health > 0)
    end
end

function GetCharacter(player)
    return player.Character
end

function GetHumanoid(player)
    local char = GetCharacter(player)
    return char:FindFirstChildOfClass("Humanoid")
end

function GetHead(player)
    local char = player.Character
    return char:FindFirstChild("Head")
end

function KillAll()
    local wand = lp.Backpack:FindFirstChild("Wand") or lp.Character:FindFirstChild("Wand")

    if wand then 
        wand.Parent = GetCharacter(lp)
        local FireRemote = GetCharacter(lp).Wand:FindFirstChild("Fire") 

    while getgenv().Toggle == true do 
            for i,v in next, game:GetService("Players"):GetChildren() do 
                local CharV = GetCharacter(v)
                local CharMe = GetCharacter(lp)

                local CheckLp = CheckValid(CharMe) and CheckAlive(GetHumanoid(lp)) 
                local CheckV = CheckValid(CharV) and CheckAlive(GetHumanoid(v)) 

                local Head = GetHead(v)

                if v ~= lp and CheckV and not GetCharacter(v):FindFirstChildOfClass("ForceField") then
                    if CharV and CharMe and CheckV and CheckLp and Head and wand then 

                        local args = {
                            [1] = Head.CFrame,
                            [2] = 100,
                            [3] = 1.5,
                            [4] = wand,
                            [5] = 15,
                            [6] = workspace:WaitForChild("rawestmetatable") or workspace:WaitForChild(lp)
                        }
                        
                        if FireRemote and FireRemote:IsDescendantOf(GetCharacter(game.Players.LocalPlayer)) then 
                            FireRemote:FireServer(unpack(args))
                        end
                    end
                end
            end
            task.wait()
        end
    end
end

KillAll()
