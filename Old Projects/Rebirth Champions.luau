getgenv().AutoT = false
getgenv().AutoR = false
getgenv().AutoC = false
getgenv().AutoCO = false
getgenv().AutoU = false
getgenv().AutoCU = false
getgenv().AutoSU = false
getgenv().AutoCup = false

function doT()
    spawn(function()
        while AutoT == true do
        if not getgenv() then break end
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click3"):FireServer()
           wait()
        end
    end)
end


function doR()
    spawn(function()
        while AutoR == true do
        if not getgenv() then break end
        local args = {[1] = selectedRebirth}game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
           wait()
        end
    end)
end


-- thank you amity and chaptgpt for helping me fix this and automate it. :)


local plr = game.Players.LocalPlayer.Character.HumanoidRootPart

function doC()
    spawn(function()
        while AutoC do 
            if not getgenv() then break end
            for i,v in pairs(game:GetService("Workspace").Scripts.CollectCupcakes.Storage:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    firetouchinterest(plr, v.Parent, 0)
                    wait()
                    firetouchinterest(plr, v.Parent, 1)
                end
            end
            wait(1)
            repeat until math.huge
        end
    end)
end



function doCO()
    spawn(function()
        while AutoCO == true do
        if not getgenv() then break end
        local args = {[1] = "Anniversary",[2] = "Triple"}game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Unbox"):InvokeServer(unpack(args))        
        local args = {[1] = "CraftAll",[2] = {}}game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Request"):InvokeServer(unpack(args))                
           wait()
        end
    end)
end



-- teleport


function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
  end
end






-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "digital hub",
    LoadingTitle = "watch darling in the franxx",
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
 local Tab2 = Window:CreateTab("100M EVENT!")  
 local Tab3 = Window:CreateTab("Other")

 
 local Button = Tab3:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })


 local Section = Tab:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AutoT = bool
    if bool then
        doT()
    end
   end,
})


local Button = Tab:CreateButton({
    Name = "Get All Potions (50 hours, need 100O+ Clicks)",
    Callback = function()
        local args = {[1] = "x2Clicks",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))
        local args = {[1] = "x2Gems",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x2Luck",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x2Rebirths",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x2PetXP",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x2HatchSpeed",[2] = 100}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))
        local args = {[1] = "x3Clicks",[2] = 100, [3] = "aqua"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))
        local args = {[1] = "x3Gems",[2] = 100, [3] = "aqua"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x3Luck",[2] = 100,[3] = "aqua"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x3Rebirths",[2] = 100,[3] = "aqua"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args))      
        local args = {[1] = "x3PetXP",[2] = 100,[3] = "aqua"}game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Potion"):FireServer(unpack(args)) 
    end,
 })


local Section = Tab:CreateSection("Upgrades")

local Button = Tab:CreateButton({
    Name = "(You can't see gem cost if use this)",
    Callback = function()
        print("hi :)")
    end,
 })


local selectedUpgrade
local Dropdown = Tab:CreateDropdown({
   Name = "Upgrade Choice",
   Options = {"ClickMultiplier","RebirthButtons","WalkSpeed","GemsMultiplier","PetStorage","LuckMultiplier","FasterFreeAutoClicker","PetEquip",},
   CurrentOption = "--",
   Callback = function(value)
    selectedUpgrade = value[1]
   end,
})

function doU()
    spawn(function()
        while AutoU == true do
        if not getgenv() then break end
        local args = {[1] = selectedUpgrade}game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Upgrade"):InvokeServer(unpack(args))        
           wait()
        end
    end)
end


local Toggle = Tab:CreateToggle({
    Name = "Auto Upgrade",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().AutoU = bool
     if bool then
         doU()
     end
    end,
 })




 local selectedSpaceUpgrade
 local Dropdown = Tab:CreateDropdown({
    Name = "Space Upgrade Choice",
    Options = {"ClickMultiplier","ChestCountdown","BankSlot","MaxCombo","PetEquip","LuckMultiplier","Teleport","GoldenChance","ToxicChance"},
    CurrentOption = "--",
    Callback = function(value)
        selectedSpaceUpgrade = value[1]
    end,
 })
 
 function doSU()
     spawn(function()
         while AutoSU == true do
         if not getgenv() then break end
         local args = {[1] = selectedSpaceUpgrade, [2] = "space"}game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Upgrade"):InvokeServer(unpack(args))        
            wait()
         end
     end)
 end
 
 
 local Toggle = Tab:CreateToggle({
     Name = "Auto Space Upgrade",
     CurrentValue = false,
     Callback = function(bool)
      getgenv().AutoSU = bool
      if bool then
          doSU()
      end
     end,
  })


local Section = Tab:CreateSection("Rebirths")

local Button = Tab:CreateButton({
    Name = "To find dropdown number, Number of rebirth buttons +3",
    Callback = function()
        print("hi :)")
    end,
 })

 local Button = Tab:CreateButton({
    Name = "You can see number of rebirth buttons in upgrades shop :)",
    Callback = function()
        print("hi :)")
    end,
 })



local selectedRebirth
local Dropdown = Tab:CreateDropdown({
   Name = "Rebirth Amount",
   Options = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,38,38,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,85,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100},
   CurrentOption = "--",
   Callback = function(value)
    selectedRebirth = value[1]
   end,
})

function doR()
    spawn(function()
        while AutoR == true do
        if not getgenv() then break end
        local args = {[1] = selectedRebirth}game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
           wait()
        end
    end)
end


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



 local Toggle = Tab2:CreateToggle({
    Name = "Auto Cupcake",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().AutoC = bool
     if bool then
         doC()
     end
    end,
 })



 local Toggle = Tab2:CreateToggle({
    Name = "Auto 100M Pets (30k cupcakes required, current best pets)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().AutoCO = bool
     if bool then
         doCO()
     end
    end,
 })

 
 
 


 local selectedCupCakeUpgrade
 local Dropdown = Tab2:CreateDropdown({
    Name = "Cupcake Upgrade Choice",
    Options = {"ClickMultiplier","PetEquip","BankSpace","HatchSpeed","CupcakesMultiplier","LuckMultiplier"},
    CurrentOption = "--",
    Callback = function(value)
    selectedCupCakeUpgrade = value[1]
    end
 })
 
 function doCU()
     spawn(function()
         while AutoCU == true do
         if not getgenv() then break end
         local args = {[1] = selectedCupCakeUpgrade,[2] = "100m"}game:GetService("ReplicatedStorage"):WaitForChild("Functions"):WaitForChild("Upgrade"):InvokeServer(unpack(args))        
            wait()
         end
     end)
 end
 
 
 local Toggle = Tab2:CreateToggle({
     Name = "Auto Cupcake Upgrade",
     CurrentValue = false,
     Callback = function(bool)
      getgenv().AutoCU = bool
      if bool then
          doCU()
      end
     end,
  })
 






 Rayfield:LoadConfiguration()
