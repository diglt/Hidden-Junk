--[[
    Status: (Never Returning)
]]--

-- Toggles -- 
getgenv().EnableStrength = false 
getgenv().EnableGift = false
getgenv().EnableKick = false
getgenv().EnablePetOpen = false
getgenv().CallStrengthToggle = false
getgenv().EnableAutoBoss = false

-- locals --
local cloneref = cloneref or function(obj) return obj end 
local Workspace = cloneref(game:GetService("Workspace"))
local lp = cloneref(game:GetService("Players").LocalPlayer)
local BorderWalls = Workspace:FindFirstChild("BorderWalls")
local TweeenService = cloneref(game:GetService("TweenService"))

-- Remotes --
local SpinRemote = game:GetService("ReplicatedStorage").Remotes.SpinsRemote
local EggRemote = cloneref(game:GetService("ReplicatedStorage").Remotes.OpenEgg)
local GiftRemote = cloneref(game:GetService("ReplicatedStorage").Remotes.GiftRemote)
local StrengthRemote = cloneref(game:GetService("ReplicatedStorage").Remotes.StrengthRemote)

-- Convert Tables --

local TranslateEgg = {
    ["Snow"] = "SnowEgg",
    ["Ice"] = "IceEgg",
    ["Bubble"] = "BubbleEgg",
    ["Sea"] = "Sea Egg",
    ["Magma"] = "MagmaEgg",
    ["Blue Magma"] = "BlueMagmaEgg",
}

local TranslateZone = {
    ["Starter"] = "StarterZone",
    ["Frost"] = "FrostZone",
    ["Sea"] = "SeaZone",
    ["Volcano"] = "VolcanoZone",
    ["Desert"] = "DesertZone",
    ["Alien"] = "AlienZone",
    ["Lightning"] = "LightningZone",
    ["Demon"] = "DemonZone",
}

local EggsPositon = {
    ["Snow"] = Vector3.new(-377, 8, -368),
    ["Ice"] = Vector3.new(-377, 8, -368),
    ["Bubble"] = Vector3.new(-371, 8, -558),
    ["Sea"] = Vector3.new(-371, 8, -558),
    ["Magma"] = Vector3.new(-378, 8, -720),
    ["Blue Magma"] = Vector3.new(-378, 8, -720),
}


-- functions -- 

local function GetChar(plr)
    return (plr or lp).Character
end

local function GetRoot(plr)
    local char = plr and plr:IsA("Model") and plr or GetChar(plr)
    return (char and char:FindFirstChild("HumanoidRootPart")), char
end

local function IsValidMemeber(obj,target)
    return obj:IsDescendantOf(target or game)
end


local function ClaimGifts()
    while EnableGift do 
        for i = 1,10 do 
            local NewGiftNumber = i
            GiftRemote:FireServer(NewGiftNumber)
            task.wait(1)
        end
    end
end

local function NoClip()
    for i,v in pairs(Workspace:GetChildren()) do
        if v.Name == lp.Name then 
            local children = v:GetChildren()
            for i,v2 in pairs(children) do
                if v2:IsA("BasePart") then 
                    v2.CanCollide = false 
                end
            end
        end    
    end
end

local function CallStrength()
    while CallStrengthToggle do 
        StrengthRemote:FireServer()
        task.wait()
    end
end

local function Spin()
    SpinRemote:FireServer("spin")
end



-- Library -- 
 
 local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
 
 local Window = Rayfield:CreateWindow({
     Name = "Work In Progress",
     LoadingTitle = "Example Text",
     LoadingSubtitle = "By Neural",
     ConfigurationSaving = {
        Enabled = true,
        FolderName = nil, 
        FileName = "Neural Hub"
     },
     Discord = {
        Enabled = true,
        Invite = "wk2xtM8H", 
        RememberJoins = true 
     },
  })
 
 
 
  Rayfield:Notify({
    Title = "Notification",
    Content = "add all here.",
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
  local Tab2 = Window:CreateTab("Pets/Eggs",4483362458)
  local Tab3 = Window:CreateTab("Misc",4483362458)
  local Tab1 = Window:CreateTab("Info",4483362458) 
 
  local Section = Tab1:CreateSection("Info / Support")
  local Section = Tab3:CreateSection("Other Features")
 
  local Button = Tab1:CreateButton({
     Name = "Destroy Gui",
     Callback = function()
         Rayfield:Destroy()
     end,
  })
 
  local Paragraph = Tab1:CreateParagraph({Title = "Credits To", Content = "Neural - Script Creator"})


 local Button = Tab3:CreateButton({
    Name = "Spin Wheel",
    Callback = function()
        Spin()
    end,
 })
 
 local Button = Tab3:CreateButton({
    Name = "Enable NoClip",
    Callback = function()
        NoClip()
    end,
 })

 local Section = Tab:CreateSection("Select World")

 local Paragraph = Tab:CreateParagraph({Title = "Required", Content = "You must select the world/zone you wish to use this script for, or else it will not work, You cannot teleport more than 3 worlds infront of your current world."})

 local selectedZoneTranslate
 local Dropdown = Tab:CreateDropdown({
    Name = "World/Zone Select",
    Options = {"Starter","Frost","Sea","Volcano"},
    CurrentOption = {"Empty"},
    MultipleOptions = false,
    Callback = function(value)
        selectedZoneTranslate = TranslateZone[value[1]]
        return selectedZoneTranslate
    end,
 })

 local function TeleportToZone()
    local char = GetChar(lp)
    NoClip()
    if IsValidMemeber(char) then 
        local lpRoot = GetRoot(lp)
        local ti = TweenInfo.new(6, Enum.EasingStyle.Linear)
        local New_CFrame 
            if selectedZoneTranslate == "StarterZone" then 
                New_CFrame = CFrame.new(-394, 7, -293)
            elseif selectedZoneTranslate == "FrostZone" then
                New_CFrame = CFrame.new(-392, 8, -443)
                elseif selectedZoneTranslate == "SeaZone" then
                    New_CFrame = CFrame.new(-396, 7, -603)
                elseif selectedZoneTranslate == "VolcanoZone" then
                     New_CFrame = CFrame.new(-394, 7, -765)
                     elseif selectedZoneTranslate == "DesertZone" then
                        New_CFrame = CFrame.new
                end
            local tp = {CFrame = New_CFrame}
        TweeenService:Create(lpRoot, ti,tp):Play()
    end
 end

 local Button = Tab:CreateButton({
    Name = "Goto World/Zone",
    Callback = function()
        TeleportToZone()
    end,
 })


 local Section = Tab:CreateSection("Main Features")

 local function TeleportToStrength()
    local char = GetChar(lp)
    if IsValidMemeber(char) then 
        local lpRoot = GetRoot(lp)
        local New_CFrame 
            NoClip()
            if selectedZoneTranslate == "StarterZone" then 
                New_CFrame = CFrame.new(-333, 8, -233)
            elseif selectedZoneTranslate == "FrostZone" then
                New_CFrame = CFrame.new(-370, 8, -407)
                elseif selectedZoneTranslate == "SeaZone" then
                    New_CFrame = CFrame.new(-365, 8, -590)
                elseif selectedZoneTranslate == "VolcanoZone" then
                     New_CFrame = CFrame.new(-376, 8, -762)
                end
            local ti = TweenInfo.new(6, Enum.EasingStyle.Linear)
            local tp = {CFrame = New_CFrame}
        TweeenService:Create(lpRoot, ti,tp):Play()
    end
 end

 local function GainStrength()
    TeleportToStrength()
    while EnableStrength do 
            StrengthRemote:FireServer()
        task.wait()
    end
end




 local Toggle = Tab:CreateToggle({
    Name = "Auto Train",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().EnableStrength = bool
     if bool then
        GainStrength()
     end
    end,
 })

local function KickWall()
    while EnableKick do 
    task.wait()
    for i = 1,16 do 
        local HouseNumber = i 
       local char = GetChar(lp)
       if IsValidMemeber(char) then 
            for i,v in pairs(Workspace:GetChildren()) do 
                if v:IsA("Folder") and v.Name == "Zones" then 
                    local ZoneFolder = v 
                    for i, zone in pairs(ZoneFolder:GetChildren()) do 
                        if zone.Name == selectedZoneTranslate then 
                            local FoundZone = zone
                            local ZoneDoors = zone:FindFirstChild("Doors")
                            local LpRoot = GetRoot(lp)
                        for i,child in pairs(ZoneDoors:GetDescendants()) do 
                            if child:IsA("Part") and child.Parent:IsA("Model") and child.Name == "Door" then 
                                if not child.CanCollide == false and child.Parent.Name == "House"..HouseNumber then 
                                local Door = child 
                                LpRoot.CFrame = Door.CFrame - Vector3.new(0,0,6)
                                StrengthRemote:FireServer()
                                repeat
                                    task.wait()
                                until child.CanCollide == false 
                                elseif child.CanCollide == false or not child.Parent.Name == "House"..HouseNumber then  
                                    for i,y in pairs(FoundZone:GetChildren()) do 
                                        if y:IsA("Part") and y.Name == "EndZone" then 
                                            local EndZone = y 
                                            LpRoot.CFrame = EndZone.CFrame
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


local Toggle = Tab:CreateToggle({
    Name = "Auto Kick Wall",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().EnableKick = bool
     if bool then
        KickWall()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Kick",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().CallStrengthToggle = bool
     if bool then
        CallStrength()
     end
    end,
 })


 local Toggle = Tab:CreateToggle({
    Name = "Auto Claim Gifts",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().EnableGift = bool
     if bool then
        ClaimGifts()
     end
    end,
 })

 local Section = Tab:CreateSection("Bosses")

 local ChosenBoss
 local Dropdown = Tab:CreateDropdown({
    Name = "Select Boss",
    Options = {"Forest Protector","Ice Dragon","Fenix"},
    CurrentOption = {"Empty"},
    MultipleOptions = false,
    Callback = function(value)
        ChosenBoss = value[1]
        return ChosenBoss
    end,
 })

 local function DefeatBoss()
    while EnableAutoBoss do 
    if IsValidMemeber(GetChar(lp))then 
        for i,v in pairs(Workspace:GetChildren()) do 
            if v:IsA("Folder") and v.Name == "Bosses" then 
                local BossesFolder = v 
                for i,boss in BossesFolder:GetChildren() do 
                    if boss:IsA("Model") and boss.Name == ChosenBoss then 
                        if boss ~= nil then 
                NoClip()
                local Lproot = GetRoot(lp)
                local BossRoot = boss:FindFirstChild("HumanoidRootPart")
                    local New_CFrame 
                        New_CFrame = BossRoot.CFrame
                    local ti = TweenInfo.new(6, Enum.EasingStyle.Linear)
                local tp = {CFrame = New_CFrame}
                TweeenService:Create(Lproot, ti,tp):Play()
                            end
                        end
                    end
                end
            end
        end
        task.wait()
    end
 end

 local Toggle = Tab:CreateToggle({
    Name = "Auto Goto Boss",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().EnableAutoBoss = bool
     if bool then
        DefeatBoss()
     end
    end,
 })


  local Section = Tab2:CreateSection("Eggs")

  local selectedEggToOpen
  local selectedEggPOS
  local Dropdown = Tab2:CreateDropdown({
      Name = "Choose Egg To Open",
      Options = {"Snow","Ice","Bubble","Sea","Magma","Blue Magma"},
      CurrentOption = "--",
      Callback = function(value)
          selectedEggToOpen = TranslateEgg[value[1]]
          selectedEggPOS = EggsPositon[value[1]]
          return selectedEggToOpen, selectedEggPOS
      end,
  })
  
  
local function AutoOpenPets()
    local char = GetChar(lp)
    if IsValidMemeber(char) then 
        local lpRoot = GetRoot(lp)
        lpRoot.CFrame  = CFrame.new(selectedEggPOS)
            while EnablePetOpen do 
            EggRemote:FireServer(selectedEggToOpen,1)
        task.wait(0.5)
        end
    end
end
  
  
  local Toggle = Tab2:CreateToggle({
     Name = "Auto Open Selected Egg",
     CurrentValue = false,
     Callback = function(bool)
      getgenv().EnablePetOpen = bool
      if bool then
        AutoOpenPets()
      end
     end,
  })
