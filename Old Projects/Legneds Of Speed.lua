getgenv().AutoG = false
getgenv().AutoS = false
getgenv().AutoR = false
getgenv().AutoP = false

function doG()
   spawn(function()
       while AutoG == true do
       if not getgenv() then break end
       local args = {[1] = "collectOrb",[2] = "Gem",[3] = "City"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))     
          wait()
       end
   end)
end

function doS()
   spawn(function()
       while AutoS == true do
       if not getgenv() then break end
       local args = {[1] = "collectOrb",[2] = "Orange Orb",[3] = "City"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
       local args = {[1] = "collectOrb",[2] = "Red Orb",[3] = "City"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
       local args = {[1] = "collectOrb",[2] = "Yellow Orb",[3] = "City"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))
       local args = {[1] = "collectOrb",[2] = "Blue Orb",[3] = "City"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("orbEvent"):FireServer(unpack(args))                    
          wait()
       end
   end)
end

function doR()
   spawn(function()
       while AutoR == true do
       if not getgenv() then break end
       local args = {[1] = "rebirthRequest"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthEvent"):FireServer(unpack(args))     
          wait()
       end
   end)
end


function doP()
   spawn(function()
       while AutoP == true do
       if not getgenv() then break end
       local args = {[1] = "openCrystal",[2] = "Electro Legends Crystal"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openCrystalRemote"):InvokeServer(unpack(args))      
          wait()
       end
   end)
end


-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "Legends Of Speed",
    LoadingTitle = "why are you reading this",
    LoadingSubtitle = "by diglt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Digital Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "wk2xtM8H", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Sirius Hub",
       Subtitle = "Key System",
       Note = "Join the discord (discord.gg/sirius)",
       FileName = "SiriusKey",
       SaveKey = true,
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = "Hello"
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

 local Button = Tab:CreateButton({
   Name = "Join Race",
   Callback = function()
      local args = {[1] = "joinRace"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("raceEvent"):FireServer(unpack(args))      
   end,
})


local Toggle = Tab:CreateToggle({
   Name = "Auto Gem (Only Works In City)",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AutoG = bool
    if bool then
        doG()
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Speed (Only Works In City)",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AutoS = bool
    if bool then
        doS()
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AutoR = bool
    if bool then
        doR()
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Omega Pet (U NEED 100K GEMS FIRST)",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AutoP = bool
    if bool then
        doP()
    end
   end,
})



 Rayfield:LoadConfiguration()
