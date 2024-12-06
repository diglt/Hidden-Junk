--[[
    Status: (Never Returning)
]]--



local cloneref = cloneref or function() return obj end 
local lp = cloneref(game:GetService("Players")).LocalPlayer
local Workspace = cloneref(game:GetService("Workspace"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local RemoteEvents = cloneref(Workspace:WaitForChild("Fight"):WaitForChild("Events"))
local FightRemote = cloneref(RemoteEvents:WaitForChild("FightAttack"))
local DataPullFunc = cloneref(ReplicatedStorage:WaitForChild("CommonLibrary"):WaitForChild("Tool"):WaitForChild("RemoteManager"):WaitForChild("Funcs"):WaitForChild("DataPullFunc"))
local TeleportService = cloneref(game:GetService("TeleportService"))


local function getchar(plr)
    return (lp or plr).Character
end

local function IsValid(obj,target)
    return obj:IsDescendantOf(target or game)
end

local function getroot(plr)
    local char = getchar(plr)
    return (char and char:FindFirstChild("HumanoidRootPart")),char
end

local function Claimwheel()
    for i = 3,8 do 
        DataPullFunc:InvokeServer("NewWheelTakeDailyRollCountChannel",i)
        task.wait(0.1)
    end
    TeleportService:Teleport(game.PlaceId)
end

local function ClaimUGCwheel()
    for i = 1,20 do 
        DataPullFunc:InvokeServer("LimitedUGCSystemClaimTaskChannel",1,i)
        wait(0.05)
        DataPullFunc:InvokeServer("LimitedUGCSystemClaimTaskChannel",2,i)
        wait(0.05)
        DataPullFunc:InvokeServer("LimitedUGCSystemClaimTaskChannel",3,i)
        wait(0.05)
    end
    TeleportService:Teleport(game.PlaceId)
end

local function ClaimAutumnFestival()
    for i = 1,18 do 
        DataPullFunc:InvokeServer("ActivityOnlineRewardSkipAllTakeChannel",44,i)
        task.wait(0.1)
    end
    TeleportService:Teleport(game.PlaceId)
end

getgenv().ToggleAttackMob = false

local function AttackMob()
    while ToggleAttackMob do 
            for i,v in pairs(Workspace:GetChildren()) do 
                if v:IsA("Folder") and v.Name == "Fight" then 
                    local FightFolder = v 

                    for i,b in pairs(FightFolder:GetChildren()) do 
                        if b:IsA("Folder") and b.Name == "ClientChests" then 
                            local MobFolder = b 

                            for i,Mob in pairs(MobFolder:GetChildren()) do 
                                if Mob then 
                                    local MobName = tostring(Mob.Name)
                                    local MobRoot = Mob:FindFirstChild("Root")
                                    local LpRoot = getroot(lp)

                                    if IsValid(MobRoot) and IsValid(LpRoot) then 
                                        repeat
                                            LpRoot.CFrame = MobRoot.CFrame + Vector3.new(0,0,5)
                                            FightRemote:InvokeServer(0,MobName)
                                            task.wait()
                                        until not IsValid(Mob) or not IsValid(MobRoot) or not ToggleAttackMob

                                        for i,c in pairs(Workspace:GetChildren()) do 
                                            if c:IsA("Folder") and c.Name == "Rewards" then 
                                                local Rewards = c 
                                                
                                                for i,d in Rewards:GetChildren() do 
                                                    if d:IsA("Part") and IsValid(LpRoot) and IsValid(d) then 
                                                        repeat
                                                            LpRoot.CFrame = d.CFrame
                                                            task.wait()
                                                        until not IsValid(d) or not ToggleAttackMob 
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
        task.wait()
    end
end




local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Neural Hub",
    LoadingTitle = "rip hookmetamethod",
    LoadingSubtitle = "By Neural",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, 
       FileName = "Neural Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "3M4PkmNgTw", 
       RememberJoins = true 
    },
 })
 Rayfield:Notify({
   Title = "Notification",
   Content = "Join the discord for more scripts like this B)",
   Duration = 1,
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
 local Tab1 = Window:CreateTab("Misc",4483362458) 
 local Tab2 = Window:CreateTab("Events",4483362458) 
 local Tab999 = Window:CreateTab("Credits And Stuff",4483362458) 
 local Section = Tab999:CreateSection("Credits And Stuff")

 local Button = Tab999:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Paragraph = Tab999:CreateParagraph({Title = "Credits to:", Content = "Neural - Script Creator"})


 local Section = Tab:CreateSection("Features")

local Toggle = Tab:CreateToggle({
   Name = "Auto Kill All Mobs",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().ToggleAttackMob = bool
    if bool then
        AttackMob()
    end
   end,
})




local Section = Tab1:CreateSection("Regular Spin Wheel")



local Button = Tab1:CreateButton({
   Name = "Claim Wheel Spins",
   Callback = function()
       Claimwheel()
   end,
})

local SpinsToNumb 
local AmountOfSpins 
local Input = Tab1:CreateInput({
    Name = "Current Amount Of Spins",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
       AmountOfSpins = Text
       SpinsToNumb = tonumber(AmountOfSpins)
        return SpinsToNumb
    end,
 })


getgenv().ToggleSpinWheel = false

local function SpinWheel()
   DataPullFunc:InvokeServer("NewWheelSetSkinAnimChannel",true)
   while ToggleSpinWheel do 
       if SpinsToNumb > 0  then 
           repeat
               DataPullFunc:InvokeServer("NewWheelRollChannel")
               wait(3)
               SpinsToNumb  = SpinsToNumb - 1
               print(SpinsToNumb)
           until SpinsToNumb <= 0 or not ToggleSpinWheel
       else
           break
       end
       task.wait()
   end
   TeleportService:Teleport(game.PlaceId)
end

local Toggle = Tab1:CreateToggle({
   Name = "Auto Spin Wheel",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().ToggleSpinWheel = bool
    if bool then
       SpinWheel()
    end
   end,
})




local Section = Tab2:CreateSection("UGC Spin Wheel")

 local Button = Tab2:CreateButton({
    Name = "Claim UGC Wheel Spins",
    Callback = function()
        ClaimUGCwheel()
    end,
 })

 local UGCSpinsToNumb 
 local UGCAmountOfSpins 
 local Input = Tab2:CreateInput({
     Name = "Current Amount Of UGC Spins",
     PlaceholderText = "...",
     RemoveTextAfterFocusLost = false,
     Callback = function(Text)
        UGCAmountOfSpins = Text
        UGCSpinsToNumb = tonumber(UGCAmountOfSpins)
         return UGCSpinsToNumb
     end,
  })
 

getgenv().ToggleSpinUGCWheel = false

 local function SpinUGCWheel()
    DataPullFunc:InvokeServer("LimitedUGCSystemSetSkipAnimChannel",true)
    while ToggleSpinUGCWheel do 
        if UGCSpinsToNumb > 0  then 
            repeat
                DataPullFunc:InvokeServer("LimitedUGCSystemRollWheelChannel")
                wait(3)
                UGCSpinsToNumb  = UGCSpinsToNumb - 1
            until UGCSpinsToNumb <= 0 or not ToggleSpinUGCWheel
        else
            break
        end
        task.wait()
    end
    TeleportService:Teleport(game.PlaceId)
end

local Toggle = Tab2:CreateToggle({
    Name = "Auto Spin UGC Wheel",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleSpinUGCWheel = bool
     if bool then
        SpinUGCWheel()
     end
    end,
 })






 local Section = Tab2:CreateSection("Mid Autumn Festival")

 local Button = Tab2:CreateButton({
    Name = "Claim Festival Tokens",
    Callback = function()
        ClaimAutumnFestival()
    end,
 })


 local FestivalSpinsToNumb 
 local FestivalAmountOfSpins 
 local Input = Tab2:CreateInput({
     Name = "Spin Amount (1 Spin = 80 Tokens)",
     PlaceholderText = "...",
     RemoveTextAfterFocusLost = false,
     Callback = function(Text)
        FestivalAmountOfSpins = Text
        FestivalSpinsToNumb = tonumber(FestivalAmountOfSpins)
         return FestivalSpinsToNumb
     end,
  })
 

getgenv().ToggleSpinFestivalWheel = false

 local function SpinFestiveWheel()
    DataPullFunc:InvokeServer("LuckyDrawSetSkipAnimChannel",44,true)
    while ToggleSpinFestivalWheel do 
        if FestivalSpinsToNumb > 0  then 
            repeat
                DataPullFunc:InvokeServer("LuckyDrawItemTakenChannel",44)
                wait(0.01)
                FestivalSpinsToNumb  = FestivalSpinsToNumb - 1
            until FestivalSpinsToNumb <= 0 or not ToggleSpinFestivalWheel
        else
            break
        end
        task.wait()
    end
    TeleportService:Teleport(game.PlaceId)
end

local Toggle = Tab2:CreateToggle({
    Name = "Auto Spin Festival Wheel",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleSpinFestivalWheel = bool
     if bool then
        SpinFestiveWheel()
     end
    end,
 })
