-- Toggles -- 
getgenv().AutoClick = false
getgenv().AutoKillMob = false

local AutoKillMob = getgenv().AutoKillMob
local AutoClick = getgenv().AutoClick

-- Servicies -- 
local cloneref = cloneref or function(obj)
    return obj
end

local Players  = cloneref(game:GetService("Players"))
local VirtualUser = cloneref(game:GetService("VirtualUser"))
local TweenService = cloneref(game:GetService("TweenService"))
local lp = cloneref(Players.LocalPlayer)


-- Variables -- 
local Controller = VirtualUser:CaptureController()
local IsHoldingTool = false

local AutoKillThread
local AutoClickThread



-- functions / logic --

function ReturnChar(plr)
    return plr.Character
end

function ReturnRoot(char)
    return char:FindFirstChild("HumanoidRootPart") or char.HumanoidRootPart
end

function ReturnHumanoid(char)
    return char:FindFirstChildOfClass("Humanoid") or char:FindFirstChild("Humanoid")
end

function IsValid(object, target)
    return object:IsDescendantOf(target or game)
end

function IsAlive(humanoid)
    if IsValid(humanoid) and humanoid.Health > 0 then 
        return true
    end
end


function CallAutoClick()
    local Tool = lp.Backpack:FindFirstChild("Combat")

    if Tool and IsHoldingTool == false then 
        Tool.Parent = ReturnChar(lp) or lp.Character
        IsHoldingTool = true
    end

    while AutoClick do
            VirtualUser:Button1Down(Vector2.new(0,0))

        if not AutoKillMob then 
            task.wait(0.1)
        else
            return
        end
    end
end


function CallAutoKill(mob)
    local Enemies = workspace:FindFirstChild("Enemies")

    while AutoKillMob do
        for i,v in pairs(Enemies:GetChildren()) do 
            if v.Name == mob then 
                local PlrChar = ReturnChar(lp)
                local PlrRoot = ReturnRoot(PlrChar)
                local PlrHum = ReturnHumanoid(PlrChar)

                local MobRoot = ReturnRoot(v)
                if IsValid(PlrRoot) and IsAlive(PlrHum) and IsValid(MobRoot, Enemies) then 
                    NoClip(PlrChar)
                    PlrRoot.Anchored = true

                    local TweenCFrame = {
                        CFrame = MobRoot.CFrame - Vector3.new(0, 0, -6)
                    }

                    local Tween = TweenService:Create(PlrRoot, TweenInfo.new(1, Enum.EasingStyle.Linear), TweenCFrame)
                    local success, err = pcall(function()
                        Tween:Play()
                    end)

                    if not success then 
                        print(err)
                    end
                end
            end
        end
        task.wait()
    end
end


function NoClip(char)
    for i,v in pairs(char:GetChildren()) do 
        if v:IsA("Part") or v:IsA("BasePart") then 
            v.CanCollide = false
        end
    end
end


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Neural Hub",
    LoadingTitle = "No matter where you are, everyone is always connected!",
    LoadingSubtitle = "by neural",
    Discord = {
       Enabled = true,
       Invite = "3M4PkmNgTw",
       RememberJoins = true 
    },
 })

 local Tab = Window:CreateTab("Aggressive Feautres",4483362458)
 local Tab1 = Window:CreateTab("Other",4483362458) 

 local Section = Tab1:CreateSection("Misc Features")

 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Toggle Auto Click",
    Callback = function(bool)
        getgenv().AutoClick = bool
        if bool and not AutoClickThread then 
            print'created'
            AutoClickThread = coroutine.create(function()
                CallAutoClick()
            end)

            coroutine.resume(AutoClickThread)

        elseif not bool and AutoClickThread then
            print'yielding coroutine click.'
            coroutine.yield(AutoClickThread)
            AutoClickThread = nil
        end
    end
 })

 local Toggle = Tab:CreateToggle({
    Name = "Toggle Auto Kill",
    Callback = function(bool)
        getgenv().AutoKillMob = bool
        if bool and not AutoKillThread then 
            print("CREATED!")
            AutoKillThread = coroutine.create(function()
                
            CallAutoKill("Bandit")
            end)

            coroutine.resume(AutoKillThread)

        elseif not bool and AutoKillThread then
            print'yielding coroutine kill.'
            coroutine.yield(AutoKillThread)
            AutoKillThread = nil
        end
    end
 })
