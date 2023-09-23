
local Configs = {
    whitelist = {},
}

getgenv().ToggleEsp = false
getgenv().ToggleNoclip = false
getgenv().ToggleKill = false
getgenv().ToggleAura = false
getgenv().ToggleArrest = false
getgenv().ToggleTargetKill = false
getgenv().ToggleGodMode = false
getgenv().ProtectPresident = false
getgenv().ToggleSilent = false


local cloneref = cloneref or function(obj) return obj end
local MetaTable = getrawmetatable(game)
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local closestPlayer
local camera = game.Workspace.CurrentCamera
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Teams = cloneref(game:GetService("Teams"))
local Workspace = cloneref(game:GetService("Workspace"))
local Players = cloneref(game:GetService("Players"))
local lp = cloneref(Players.LocalPlayer)
local DmgRemote = ReplicatedStorage.meleeEvent
local CallingRemoteFolder = cloneref(Workspace:WaitForChild("Remote"))
local ArrestRemote = cloneref(CallingRemoteFolder:WaitForChild("arrest"))  
local ShootEvent = game:GetService("ReplicatedStorage"):WaitForChild("ShootEvent")


table.insert(Configs.whitelist,lp.Name)

local function getchar(plr)
    return (plr or lp).Character
end


local function gethumanoid(plr)
    local char = plr and plr:IsA("Model") and plr or getchar(plr)
    return (char and char:FindFirstChildWhichIsA("Humanoid")),char
end

local function getroot(plr)
    local char = plr and plr:IsA("Model") and plr or getchar(plr)
    return (char and char:FindFirstChild("HumanoidRootPart")),char
end


local function IsValidMember(obj,target)
    return obj:IsDescendantOf(target or game)
end


local function IsAlive(Humanoid)
    return Humanoid and (IsValidMember(Humanoid) and Humanoid.Health > 0)
end

local function DenySeating()
    for i,v in pairs(Workspace:GetDescendants()) do 
        if v:IsA("Seat") then 
            v:Destroy()
        end
    end
end


local function GetHumanoids()
    local Humanoids = {}
    for i,v in Players:GetPlayers() do
        if not table.find(Configs.whitelist,v.Name) then 
            local Humanoid,char = gethumanoid(v)
            if IsAlive(Humanoid) then 
                Humanoids[char] = Humanoid
            end
        end
    end
    return Humanoids
end


local function NoClip()
    while ToggleNoclip do
    local char = getchar(lp)
        for i,child in pairs(char:GetChildren()) do
                if child:IsA("Part") then 
            child.CanCollide = false
            end
        end
        task.wait()
    end
end

local function Clip()
    local char = getchar(lp)
        for i,child in pairs(char:GetChildren()) do
                if child:IsA("Part") then 
            child.CanCollide = true
        end
    end
end

local function ModGunNoDmg()
    for i,v in next, getgc(true) do 
        if typeof(v) == "table" then 
            if rawget(v, "MaxAmmo") then 
                rawset(v, "MaxAmmo", math.huge)
                rawset(v, "ReloadTime", 0.1)
                rawset(v, "Range", math.huge)
            end
        end
    end
end

local function ModGunSpam()
    for i,v in next, getgc(true) do 
        if typeof(v) == "table" then 
            if rawget(v, "MaxAmmo") then 
                rawset(v, "MaxAmmo", math.huge)
                rawset(v, "ReloadTime", 0.1)
                rawset(v, "Range", math.huge)
                rawset(v, "AutoFire", true)
            end
        end
    end
end

local function MagCheck(point1, point2)
    return (point1 - point2).Magnitude
end

local function isOnScreen(part)
    local vector, onScreen = camera:WorldToScreenPoint(part.Position)
    return onScreen
end

local runserv = game:GetService("RunService")

local function findClosestPlayerOnScreen()
    closestPlayer = nil
    local closestDistance = math.huge 
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player then
            local character = otherPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = character.HumanoidRootPart
                if isOnScreen(humanoidRootPart) then
                    local playerPosition = humanoidRootPart.Position
                    local distance = MagCheck(playerPosition, mouse.Hit.p)
                    if distance < closestDistance then
                        closestPlayer = otherPlayer
                        closestDistance = distance
                    end
                end
            end
        end
    end
    return closestPlayer
end


local function EnableSilent()

    runserv.RenderStepped:Connect(function()
        findClosestPlayerOnScreen()
    end)

    setreadonly(MetaTable, false)

    local oldmt = MetaTable.__namecall

    MetaTable.__namecall = newcclosure(function(Self,...)
        local method = getnamecallmethod()
        local Args = {...}

        if typeof(Self) == "Instance" and Self == ShootEvent and method == "FireServer" then 
            for i,v in next, Args[1] do 
                v.Hit = closestPlayer.Character.Head
                v.CFrame = closestPlayer.Character.Head.CFrame
                v.Distance = 0.1
            end
            return oldmt(Self, unpack(Args))
        end
        return oldmt(Self,...)
    end)

    setreadonly(MetaTable,true)
end

local function TargetKill(Target)
    while ToggleTargetKill do 
            for _,v in pairs(Players:GetPlayers()) do 
                if v.Name == Target and not table.find(Configs.whitelist, v.name) then 
                    local GuyToKill = v 

                    local LpRoot = getroot(lp)
                    local OldCFrame = LpRoot.CFrame 
                    local LpHuman = gethumanoid(lp)

                    local TargetRoot = getroot(v)
                    local TargetHumanoid = gethumanoid(v)
                    local TargetChar = getchar(v)

                    if not TargetChar:FindFirstChildWhichIsA("ForceField") and IsAlive(TargetHumanoid) and IsValidMember(LpRoot) and IsAlive(LpHuman) then
                        repeat
                                LpRoot.CFrame = TargetRoot.CFrame - Vector3.new(0,0,3)
                                DmgRemote:FireServer(GuyToKill) 
                                task.wait()
                        until not IsAlive(TargetHumanoid) or not ToggleTargetKill
                    LpRoot.CFrame = OldCFrame
                else
                end
            end
        end
        task.wait()
    end
end

local function TargetTeleport(Target)
            for _,v in pairs(Players:GetPlayers()) do 
                if v.Name == Target then 
                local GuyToTeleport = v 
                local TargetRoot = getroot(GuyToTeleport)

                local LpRoot = getroot(lp)
                if IsValidMember(LpRoot) and IsValidMember(TargetRoot) then 
            LpRoot.CFrame = TargetRoot.CFrame - Vector3.new(0,2,0)
            end
        end
        task.wait()
    end
end

local function PresidentTargetTeleport(Target)
    while ProtectPresident do 
        for _,v in pairs(Players:GetPlayers()) do 
            if v.Name == Target then  
                if IsAlive(gethumanoid(lp)) and IsValidMember(getchar(v)) then 
                    local GuyToTeleport = v 
                    local LpRoot = getroot(lp)
                    local TargetRoot = getroot(GuyToTeleport)
                    if IsValidMember(LpRoot) and IsValidMember(TargetRoot) then 
                    LpRoot.CFrame = TargetRoot.CFrame + Vector3.new(0,0,3)
                wait()
                else
                    break
                end
            end
        end
    end
    wait(0.1)
    end
    local ToNumberPresident = tonumber(Target)
    table.remove(Configs.whitelist,ToNumberPresident)
end

local function BecomeCriminal()
    if IsValidMember(getchar(lp)) and IsAlive(gethumanoid(lp)) then  
        local LpRoot = getroot(lp)
        local LpHumanoid = gethumanoid(lp)
        local OldCFrame = LpRoot.CFrame
        LpRoot.CFrame = CFrame.new(-975, 109, 2062)
        task.wait()
        LpRoot.CFrame = OldCFrame
    end
end

local function KillAll()
    while getgenv().ToggleKill do
    for char,Humanoid in GetHumanoids() do

        for _,v in pairs(Players:GetPlayers()) do
            if v.Character == char and v.Team ~= Teams:FindFirstChild("Neutral") and not table.find(Configs.whitelist,v.Name) then
                local Target = v
                    if IsValidMember(char) and IsAlive(Humanoid) and not char:FindFirstChildWhichIsA("ForceField") then
                    local lpchar = getchar(lp)
                    local lphuman = gethumanoid(lp)
                    local PlayerRoot = getroot(char)
                    local lpRoot = getroot(lp)
                    repeat
                    if IsValidMember(lpchar) and IsValidMember(lpRoot) and IsAlive(lphuman) then
                        lpRoot.CFrame = PlayerRoot.CFrame - Vector3.new(0,5,0)
                        DmgRemote:FireServer(Target)
                        task.wait()
                        elseif not IsValidMember(lpchar) or not IsAlive(lphuman) or not getgenv().ToggleKill then
                            break
                                end
                            until not IsAlive(Humanoid) or not getgenv().ToggleKill
                        end
                    end
                end
            end
    task.wait()
    end
end


local function Esp()
    local Highlights = {} 

    while ToggleEsp do 
        for _, player in pairs(Players:GetPlayers()) do 
            if not table.find(Configs.whitelist, player.Name) then
                local VChar = getchar(player)
                local VHumanoid = gethumanoid(player)
                if IsAlive(VHumanoid) then 
                    local Highlight = Highlights[player] -- Add Players Highlight To Table
                    if not Highlight then -- If The Player Doesn't Have A Highlight Then 
                        Highlight = cloneref(Instance.new("Highlight"))
                        Highlight.Name = player.Name
                        Highlight.FillTransparency = 0.5
                        Highlight.OutlineColor = Color3.new(0, 0, 0)
                        Highlight.OutlineTransparency = 0.5
                        Highlight.Parent = VChar
                        Highlights[player] = Highlight  -- Set The Player In Table To A Highlight
                    else
                        Highlight.Parent = VChar
                    end
                    if player.Team then
                        local teamName = player.Team.Name
                        if teamName == "Guards" then
                            Highlight.FillColor = Color3.new(0, 0, 1) -- Blue for Guards
                        elseif teamName == "Inmates" then
                            Highlight.FillColor = Color3.new(1, 0.5, 0) -- Orange for Inmates
                        elseif teamName == "Criminals" then
                            Highlight.FillColor = Color3.new(1, 0, 1) -- Pink for Criminals
                        end
                    end
                else
                    local Highlight = Highlights[player]
                    if Highlight then
                        Highlight:Destroy()
                        Highlights[player] = nil
                    end
                end
            end
        end
        task.wait()
    end
end

local function FindEsp()
    for i,v in pairs(Players:GetPlayers()) do 
        local Vchar = getchar(v)
        for i,Highlight in Vchar:GetDescendants() do 
            if Highlight:IsA("Highlight") then 
                Highlight:Destroy()
            end
        end
    end
end



local function AutoArrest()
    while ToggleArrest do
        if IsValidMember(getchar(lp)) then 
            for _,v in pairs(Players:GetPlayers()) do 
                if  v.Team ~= Teams:FindFirstChild("Neutral") and not table.find(Configs.whitelist, v.name) then 
                    local PotTarget = v 
                    if PotTarget.Team == Teams:FindFirstChild("Criminals") and PotTarget.Name ~= lp.Name then 
                        if IsValidMember(getchar(lp)) and IsAlive(gethumanoid(lp)) and IsValidMember(getchar(v)) and IsAlive(gethumanoid(v)) then 
                        local TargetRoot = getroot(PotTarget)
                        local LpRoot = getroot(lp) 
                        repeat 
                                LpRoot.CFrame = TargetRoot.CFrame - Vector3.new(0,0,5)
                                ArrestRemote:InvokeServer(TargetRoot)
                                task.wait()
                        until PotTarget.Team ~= Teams:FindFirstChild("Criminals") or not ToggleArrest
                    else
                        wait()
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
    LoadingTitle = "Goodnight punpun",
    LoadingSubtitle = "by diglt",
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

 local Tab = Window:CreateTab("Aggressive Feautres",4483362458)
 local Tab9 = Window:CreateTab("Non Aggressive Feautres",4483362458)
 local Tab1 = Window:CreateTab("Other",4483362458) 

 local Section = Tab1:CreateSection("Whitelist Features")

 local ChosenWhitelist
 local Input = Tab1:CreateInput({
     Name = "Add Player To Global Whitelist",
     PlaceholderText = "...",
     RemoveTextAfterFocusLost = false,
     Callback = function(Text)
        ChosenWhitelist = Text
        table.insert(Configs.whitelist,ChosenWhitelist)
        print(ChosenWhitelist)
     end,
  })
 
  local ChosenRemoveWhitelist
  local Input = Tab1:CreateInput({
   Name = "Remove Player From Global Whitelist",
   PlaceholderText = "...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
    ChosenRemoveWhitelist = Text
    local ToNumbWhitelist = tonumber(ChosenRemoveWhitelist)
    print(ChosenRemoveWhitelist)
      table.remove(Configs.whitelist,ToNumbWhitelist)
   end,
})

local Section = Tab1:CreateSection("Checking Whitelist")


local Label = Tab1:CreateLabel("Most Recent Whitelisted Player Here!")

local Button = Tab1:CreateButton({
    Name = "Check Recent Player Added ",
    Callback = function()
        for k, v in pairs(Configs.whitelist) do 
            if v.Name ~= lp.Name then 
                Label:Set(v)
            end
        end
    end,
 })

local Section = Tab1:CreateSection("Other Things!")

 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Paragraph = Tab1:CreateParagraph({Title = "Credits to:", Content = "Neural - Script Creator"})


 local Section = Tab:CreateSection("Main Features")

local Toggle = Tab:CreateToggle({
   Name = "Auto Kill All",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().ToggleKill = bool
    if bool then
        KillAll()
    end
   end,
})

local ChosenKillPlayer 
local Input = Tab:CreateInput({
    Name = "Player Name To Kill",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        ChosenKillPlayer = Text
        return ChosenKillPlayer
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Kill Chosen Player",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleTargetKill = bool
     if bool then
        if not table.find(Configs.whitelist,ChosenKillPlayer) then 
        TargetKill(ChosenKillPlayer)
     else
        Rayfield:Notify({
            Title = "Error Occured...",
            Content = "You cannot kill this player, as they are whitelisted.",
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
        end
     end
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Auto Arrest Criminals",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleArrest = bool
     if bool then
         AutoArrest()
     end
    end,
 })

local Section = Tab:CreateSection("Kill Aura")

local AuraRange
local Slider = Tab:CreateSlider({
    Name = "Set Aura Range",
    Range = {0, 30},
    Increment = 5,
    Suffix = "",
    CurrentValue = 0,
    Callback = function(Value)
        AuraRange = Value
        return AuraRange
    end,
 })

local function ShowAuraRadius()
    if not IsValidMember(getchar(lp)) then 
        return
    end 
    local Humanoid = gethumanoid(lp)
    local char = getchar(lp)
    local RadiusPart = cloneref(Instance.new("Part"))
    RadiusPart.Size = Vector3.new(AuraRange, 0, AuraRange)
    RadiusPart.Transparency = 0.5
    RadiusPart.Anchored = true
    RadiusPart.CanCollide = false
    RadiusPart.BrickColor = BrickColor.new("Bright red")
    RadiusPart.Parent = cloneref(game:GetService("Workspace"))
    local yOffset = -2.5
    local LpRoot = getroot(lp)
    if IsValidMember(char) and IsAlive(Humanoid) and IsValidMember(LpRoot) then
        local CharacterPosition = LpRoot.Position
        RadiusPart.Position = Vector3.new(CharacterPosition.X, CharacterPosition.Y + yOffset, CharacterPosition.Z)
        wait()
    end
    RadiusPart:Destroy()
end

local function KillAura()
    while ToggleAura do
        ShowAuraRadius()
        if IsValidMember(getchar(lp)) then 
            local LpHuman = gethumanoid(lp)
            local ChosenDist = AuraRange
            if IsAlive(LpHuman) then 
                local DmgRemote = ReplicatedStorage.meleeEvent
                for i,v in pairs(Players:GetPlayers()) do 
                    if IsValidMember(v) and not table.find(Configs.whitelist,v.Name) then 
                        local Target = v
                        local VRoot = getroot(v)
                        local LRoot = getroot(lp)
                        local VHuman = gethumanoid(v)
                        if IsAlive(LpHuman) and IsAlive(VHuman) then 
                            local DistBetween = (LRoot.Position - VRoot.Position).Magnitude
                            if DistBetween <= ChosenDist then
                                DmgRemote:FireServer(Target)
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
    Name = "Visible Kill Aura",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleAura = bool
     if bool then
         KillAura()
     end
    end,
 })

 local ChosenMrPresident 
local Input = Tab:CreateInput({
    Name = "Player To Protect!",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        ChosenMrPresident = Text
        table.insert(Configs.whitelist,ChosenMrPresident)
        return ChosenMrPresident
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Protect Player (Use With Aura)!",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ProtectPresident = bool
     if bool then
        PresidentTargetTeleport(ChosenMrPresident)
     end
    end,
 })

 local Section = Tab:CreateSection("Guns / Auto Headshot")

 local Button = Tab:CreateButton({
    Name = "Mod All Gun (Renable If Die) ",
    Callback = function()
        ModGunNoDmg()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Mod Gun, Spam Bullets",
    Callback = function()
        ModGunSam()
    end,
 })
 
 local Toggle = Tab:CreateToggle({
    Name = "Auto Headshot",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleSilent = bool
     if bool then
        EnableSilent()
     end
    end,
 })
 

 local Section = Tab9:CreateSection("Main")


local Toggle = Tab9:CreateToggle({
    Name = "Teamed Esp",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleEsp = bool
     if bool then
         Esp()
     end
    end,
 })

 local Toggle = Tab9:CreateToggle({
    Name = "Auto Noclip",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().ToggleNoclip = bool
     if bool then
         NoClip()
     else
        Clip()
     end
    end,
 })


 local Button = Tab9:CreateButton({
    Name = "Remove Esp",
    Callback = function()
        FindEsp()
    end,
 })


 local Section = Tab9:CreateSection("Player Based")

 local Slider = Tab9:CreateSlider({
    Name = "Set Walkspeed",
    Range = {0, 500},
    Increment = 10,
    Suffix = "",
    CurrentValue = 50,
    Callback = function(Value)
        local LpHuman = gethumanoid(lp)
        LpHuman.WalkSpeed = Value
    end,
 })

 local ChosenTeleportPlayer 
local Input = Tab9:CreateInput({
    Name = "Player Name To Teleport",
    PlaceholderText = "...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        ChosenTeleportPlayer = Text
        return ChosenTeleportPlayer
    end,
 })

 local Button = Tab9:CreateButton({
    Name = "Teleport To Selected Player",
    Callback = function()
        TargetTeleport(ChosenTeleportPlayer)
    end,
 })

 local Section = Tab9:CreateSection("Teams")

 local Button = Tab9:CreateButton({
    Name = "Become Criminal",
    Callback = function()
        BecomeCriminal()
    end,
 })

 DenySeating()
