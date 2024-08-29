getgenv().W = false
getgenv().WM = false
getgenv().R = false
getgenv().F = false

local plr = game.Players.LocalPlayer.Character.HumanoidRootPart

function doW()
    spawn(function()
        while W do 
            if not getgenv() then break end
            for i,v in pairs(game:GetService("Workspace").Walls:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    firetouchinterest(plr, v.Parent, 0)
                    wait()
                    firetouchinterest(plr, v.Parent, 1)
                end
            end
            wait()
            repeat until math.huge
        end
    end)
end


function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
  end
end

function doWM()
    spawn(function()
        while WM do
            if not getgenv() then break end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1682, 182, 1138) 
            wait(2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1677, 182, 1138) 
        end
    end)
    repeat until math.huge
end



function doF()
    spawn(function()
        while F do 
            if not getgenv() then break end
            local New_CFrame = game:GetService("Workspace").EndTouch.CFrame -- put the path to the part here

            local ts = game:GetService("TweenService")
            local char = game.Players.LocalPlayer.Character

            local part = char.HumanoidRootPart

            local ti = TweenInfo.new(1, Enum.EasingStyle.Linear) -- 1 lower number = faster it goes
            local tp = {CFrame = New_CFrame}
            ts:Create(part, ti,tp):Play() 
            wait(3)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2, 3, -8) 
        end
    end)
end

function doR()
    spawn(function()
        while R == true do
            if not getgenv() then break end
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Rebirth"):WaitForChild("[C-S]TryBuyRebirth"):FireServer()
            wait(10)
        end
    end)
end

-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "Digital",
    LoadingTitle = "why are you reading this",
    LoadingSubtitle = "by diglt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "Digital Hub"
    },
    Discord = {
       Enabled = false,
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

 local Tab = Window:CreateTab("Main")
 local Tab1 = Window:CreateTab("Other") 

 
 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })


 local Section = Tab:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Wins(use with auto end)",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().W = bool
    if bool then
        doW()
    end
   end,
})

local Toggle = Tab:CreateToggle({
    Name = "Auto 2x Wins Boost",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().WM = bool
     if bool then
         doWM()
     end
    end,
 })
 
local Toggle = Tab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().R = bool
     if bool then
         doR()
     end
    end,
 })
 
 local Toggle = Tab:CreateToggle({
    Name = "Auto Tp End",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().F = bool
     if bool then
         doF()
     end
    end,
 })
 

 Rayfield:LoadConfiguration()
