--[[
    Status: (Most Likely Not Returning)
]]--


--[[ Toggles ]]-- 
getgenv().EnableAttack = false 
getgenv().EnableFruitCollect = false
getgenv().EnableQuestTrack = false


-- [[ Locals ]] -- 
local cloneref = cloneref or function(obj) return obj end 
local Players = cloneref(game:GetService("Players"))
local Workspace = cloneref(game:GetService("Workspace"))
local lp = Players.LocalPlayer
local lpGui = cloneref(lp:FindFirstChildWhichIsA("PlayerGui"))

-- [[ Tables ]] -- 
local QuestConvert = {
    ["Level 10"] = "QuestLvl0",
}

local MobConvert = {
    [""] = "",
}

-- [[ Remotes ]] -- 
local PunchRemote = game:GetService("ReplicatedStorage").Remotes.Functions.SkillAction

-- [[ Functions ]] --

local function getchar(plr)
    return (plr or lp).Character
end

local function getroot(plr)
    local char = getchar(plr)
    return (char and char:FindFirstChild("HumanoidRootPart"))
end

local function getrootnpc(npc)
    return npc:FindFirstChild("HumanoidRootPart")
end

local function IsValid(obj,target)
    return obj:IsDescendantOf(target or game)
end

local function Punch()
    if IsValid(getchar(lp)) then 
        PunchRemote:InvokeServer("FS_None_M1") 
    end   
end

local function FindFruits()
    while EnableFruitCollect do 
        if not IsValid(getchar(lp)) then 
            while not IsValid(getchar(lp)) do 
                wait()
            end
        else
        for i,v in Workspace:GetChildren() do 
            if v:IsA("Tool") and v:FindFirstChild("Handle") then
                local FruitName = v.Name
                local FruitHandle = v:FindFirstChild("Handle")
                local LpRoot = getroot(lp)
                    firetouchinterest(FruitHandle, LpRoot, 0)
                    task.wait()
                    firetouchinterest(FruitHandle, LpRoot, 1)
                    print("Found",FruitName)
                break
            elseif not v:IsA("Tool") then
                task.wait()
                end
            end
        end
    end
end


local TargetQuestNpc = "QuestLvl0"

local function GoToQuest()
    if not IsValid(getchar(lp)) then 
        repeat
            wait()
        until IsValid(getchar(lp))
    else
        for i,v in pairs(Workspace:GetChildren()) do 
            if v:IsA("Folder") and v.Name == "AllNPC" then 
                local NPCFolder = v 
                for i,NPC in pairs(NPCFolder:GetChildren()) do 
                    if NPC:IsA("Part") and NPC.Name == TargetQuestNpc then 
                        local LpRoot = getroot(lp)
                        local NpcToGo = NPC
                        LpRoot.CFrame = NpcToGo.CFrame + Vector3.new(0,0,-2)
                    task.wait()
                    end
                end
            end
        end
    end
end


local function TrackQuest()
    while EnableQuestTrack do 
        for i, v in pairs(lpGui:GetChildren()) do 
            if v:IsA("ScreenGui") and v.Name == "Quest" then 
                    local Quest = v 
                    local QuestBoard = v:FindFirstChild("QuestBoard")
                    local QuestIdentifiy = QuestBoard:FindFirstChild("QuestCount") 
                    local QuestMob = QuestIdentifiy.Text
                    if QuestMob == "??? ?/?" then 
                        repeat
                            wait()
                        until not QuestMob == "??? ?/?" or not EnableQuestTrack
                    else
                        local parts = {}
                            for part in QuestMob:gmatch("%S+") do
                                table.insert(parts, part)
                            end
                        local relevantText = table.concat(parts, " ", 2)
                        print("Successful Quest!")
                        print(QuestMob)
                        task.wait()
                    return relevantText
                end
            end
        end
    end
end


local TargetMob = "Soldier [Lv. 1]"

local function FindMonster()
    local relevantText = TrackQuest()
    while EnableAttack do 
        local char = getchar(lp)
            if not IsValid(getchar(lp)) then 
            repeat
                wait()
            until IsValid(getchar(lp)) and not char:FindFirstChildWhichIsA("ForceField") ~= nil 
        else
    for i,v in pairs(Workspace:GetChildren()) do
        if v:IsA("Folder") and v.Name == "Monster" then
            local MonsterFolder = v 
            
            for i,Monster in MonsterFolder:GetDescendants() do 
                if IsValid(Monster,Workspace) and Monster:IsA("Model") and Monster.Name == relevantText then 
                    if IsValid(getchar(lp)) and not char:FindFirstChildWhichIsA("ForceField") and Monster:FindFirstChild("Humanoid") and Monster:FindFirstChild("Humanoid").Health > 0 then 
                    local TargetMonster = Monster
                    local LpRoot = getroot(lp)
                    repeat
                            local TargetRoot = getrootnpc(TargetMonster)
                            local TargetHumanoid = TargetMonster:FindFirstChildWhichIsA("Humanoid")
                                LpRoot.CFrame = TargetRoot.CFrame + Vector3.new(0,0,2)
                                Punch()
                                task.wait()
                            until TargetHumanoid.Health <= 0 or not EnableAttack
                        else 
                            wait()
                            end
                        end
                    end
                end
            end
        end
    end
    task.wait()
end

-- [[ Fire Functions ]] --

TrackQuest()
