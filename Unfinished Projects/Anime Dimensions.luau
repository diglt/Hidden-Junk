getgenv().KillToggle = false
getgenv().AutoSkill = false

local lp = game.Players.LocalPlayer
local MonstersFolder = game.Workspace.Folders:FindFirstChild("Monsters")
local MeleeEvent = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("MainRemoteEvent")
local skillArray = {1,2,3,4}

function CheckValid(Object, Target)
    return Object:IsDescendantOf(Target or game)
end

function IsAlive(Humanoid)
    return Humanoid and (CheckValid(Humanoid) and Humanoid.Health > 0)
end

function GetChar(player)
    return player.Character or player.CharacterAdded:Wait()
end

function GetRoot(character)
    return character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart")
end

function GetHumanoid(character)
    return (character:FindFirstChildOfClass("Humanoid")), character
end

function FindMob()
    for _,v in ipairs(MonstersFolder:GetChildren()) do 
        if v:IsA("Model") then 
            return v 
        end
    end
    return nil
end

function RepeatSkillEvents()
    while getgenv().AutoSkill do 
        local hrp = GetRoot(GetChar(lp))
        local lph = GetChar(lp):FindFirstChildOfClass("Humanoid")

        if hrp and CheckValid(hrp) and IsAlive(lph) then 
            for _, skillID in ipairs(skillArray) do 
                MeleeEvent:FireServer("UseSkill", {["hrpCFrame"] = hrp.CFrame}, skillID)
                task.wait(0.5)
            end
        else
            break
        end
    end
end

function TweenToAndKillBoss(Boss)
    local MyChar = GetChar(lp)
    local MyRoot = GetRoot(MyChar)
    local lph = MyChar:FindFirstChildOfClass("Humanoid") or MyChar:WaitForChild("Humanoid")

    local TweenService = game:GetService("TweenService")
    local TweenInfo = TweenInfo.new(
        1, -- Duration should not be -1, using 1 as a placeholder
        Enum.EasingStyle.Linear
    )

    if not Boss or not CheckValid(Boss) or not Boss:FindFirstChild("HumanoidRootPart") or not CheckValid(Boss:FindFirstChild("HumanoidRootPart")) then
        task.wait(0.05)
        return
    end

    if not CheckValid(MyRoot) or not IsAlive(lph) then 
        task.wait(0.05)
        return
    end

    local BossHRP = Boss:FindFirstChild("HumanoidRootPart")

    while CheckValid(BossHRP) and getgenv().KillToggle do
        local BossInfo = {
            CFrame = BossHRP.CFrame - Vector3.new(0, 0, 15),
        }
    
        local Tween = TweenService:Create(MyRoot, TweenInfo, BossInfo)

        local success, errorInfo = pcall(function()
            Tween:Play()
            task.wait()
        end)

        if not success then 
            print("Error occurred running tween", errorInfo)
            break
        end
    end
end

function FinalFunction()
    while getgenv().KillToggle do
        local MyRoot = GetRoot(GetChar(lp))
        local lph = GetChar(lp):FindFirstChildOfClass("Humanoid") or GetChar(lp):WaitForChild("Humanoid")

        if CheckValid(MyRoot) and IsAlive(lph) then 
            local TheMob = FindMob()
            TweenToAndKillBoss(TheMob)
        else
            task.wait()
        end
    end
end

lp.CharacterAdded:Connect(function(character)
    if getgenv().KillToggle then 
        FinalFunction()
    elseif getgenv().AutoSkill then
        RepeatSkillEvents()
    end
    print("Recalled function!")
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Good Good Vibrations!",
    LoadingTitle = "Lets All Love Lain!",
    LoadingSubtitle = "by neural",
    Discord = {
       Enabled = true,
       Invite = "3M4PkmNgTw",
       RememberJoins = true 
    },
 })

local Tab = Window:CreateTab("Main")
local Tab2 = Window:CreateTab("Settings")

local Section = Tab2:CreateSection("Misc Features")

local Button = Tab2:CreateButton({
    Name = "Destroy GUI / End Script",
    Callback = function()
        Rayfield:Destroy()
        getgenv().KillToggle = false
        getgenv().AutoSkill = false
    end,
 })

local Section = Tab:CreateSection("Main Features")

local Toggle = Tab:CreateToggle({
    Name = "Toggle Kill All",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().KillToggle = Value
        if Value then 
            FinalFunction()
        end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Toggle Auto Use Skills",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AutoSkill = Value
        if Value then
            RepeatSkillEvents()
        end
    end,
 })
