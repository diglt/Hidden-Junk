-- globals -- 
getgenv().GC = false 
getgenv().OE = false 
getgenv().DR = false 
getgenv().AU = false 


-- locals --
local mr = game.Players.LocalPlayer.Character.HumanoidRootPart


-- functions --


function coinG()
    while GC == true do 
        if not getgenv then break end 
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("MeshPart") then
                local transmitter = v:FindFirstChild("TouchTransmitter") 
                firetouchinterest(mr, v, 0)
                firetouchinterest(mr, v, 1)
                wait(0.0001)
                print("Coin Collected..")
            end
        end
    end
end




-- GUI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Free Hatchers",
    LoadingTitle = "math.huge",
    LoadingSubtitle = "by diglt",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "Digital Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "wk2xtM8H", 
       RememberJoins = true 
    },
 })



 Rayfield:Notify({
   Title = "Notification",
   Content = "add bleep all here.",
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

 local Tab = Window:CreateTab("Main")
 local Tab1 = Window:CreateTab("Other",4483362458) 

 
 local Section = Tab1:CreateSection("Other Features")

 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Section = Tab1:CreateSection("I have an issue!")
 
 local Button = Tab1:CreateButton({
   Name = "Paste the user and dm them for any issues.",
   Callback = function()
    setclipboard("diglt#3397")
   end,
})


 local Section = Tab:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Collect Coins",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().GC = bool
    if bool then
        coinG()
    end
   end,
})


local Section = Tab:CreateSection("Rebirths")

local rebirthsConvert = {
    ["1"] = 1,
    ["2"] = 2,
    ["3"] = 3,
    ["5"] = 4,
    ["10"] = 5,
    ["15"] = 6,
    ["25"] = 7,
    ["50"] = 8,
    ["75"] = 9,
    ["100"] = 10,
    ["500"] = 11,
    ["1000"] = 12,
    ["5000"] = 13,
    ["10000"] = 14,
    ["20000"] = 15
}


local selectedRebirth
local Dropdown = Tab:CreateDropdown({
   Name = "Choose Rebirth Amount",
   Options = {"1","2","3","5","10","15","25","50","75","100","500","1000","5000","10000","20000"},
   CurrentOption = "--",
   Callback = function(value)
    selectedRebirth = rebirthsConvert[value[1]] 
   end,
})



function doR()
    while DR == true do
        if not getgenv then break end
        local args = {[1] = selectedRebirth}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer(unpack(args))
        wait(0.05)        
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().DR = bool
     if bool then
         doR()
     end
    end,
 })


 local Section = Tab:CreateSection("Upgrades")


 local upgrades = {
    ["Coins"] = "CoinMultiplier3",
    ["Walkspeed"] = "WalkSpeed2",
    ["HatchSpeed"] = "HatchSpeed2",
    ["RebirthButtons"] = "Rebirth2",
    ["Egg Luck"] = "Luck3",
    ["Pet EXP"] = "EXP",
    ["Percent Pet Slot"] = "PercentPetEquipped"
}


local selectedUpgrade 
 local Dropdown = Tab:CreateDropdown({
    Name = "Choose Upgrade",
    Options = {"Coins","Walkspeed","HatchSpeed","RebirthButtons","Egg Luck","Pet EXP","Percent Pet Slot"},
    CurrentOption = "--",
    Callback = function(value)
     selectedUpgrade = upgrades[value[1]] 
    end,
 })
 

 function autoU()
    while AU == true do
        if not getgenv then break end
        local args = {[1] = selectedUpgrade}
        game:GetService("ReplicatedStorage"):WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteEvent"):WaitForChild("Upgrade Controller"):FireServer(unpack(args))        
        wait(0.1)
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Auto Chosen Upgrade",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().AU = bool
     if bool then
         autoU()
     end
    end,
 })




local Section = Tab:CreateSection("Auto Eggs")

local eggLocation = {
    ["Basic Egg"] = Vector3.new(797, 887, 110),
    ["Wild Egg"] = Vector3.new(820, 887, 104),
    ["Snowfall Egg"] = Vector3.new(814, 887, -155),
    ["Glacier Egg"] = Vector3.new(808, 887, -144),
    ["Beachball Egg"] = Vector3.new(1094, 889, -344),
    ["Sunshine Egg"] = Vector3.new(1095, 889, -333),
    ["Pail Egg"] = Vector3.new(1083, 889, -331),
    ["Ninja Egg"] = Vector3.new(1216, 887, -687),
    ["Yokai Egg"] = Vector3.new(1233, 887, -706),
    ["Busy City Egg"] = Vector3.new(1560, 887, -842),
    ["Technology Egg"] = Vector3.new(1578, 888, -854),
    ["Village Egg"] = Vector3.new(1731, 888, -1239),
    ["Queen's Jewel Egg"] = Vector3.new(1743, 887, -1259),
    ["UFO Egg"] = Vector3.new(1660, 888, -1629),
    ["Futuristic Egg"] = Vector3.new(1659, 888, -1645),
    ["Leprachaun Egg"] = Vector3.new(1672, 887, -1695),


}

local selectedEggPosition = eggLocation["Basic Egg"]
local selectedEgg
local Dropdown = Tab:CreateDropdown({
   Name = "Choose Egg",
   Options = {"Basic Egg","Wild Egg","Snowfall Egg","Glacier Egg","Beachball Egg","Sunshine Egg","Pail Egg","Ninja Egg","Yokai Egg","Busy City Egg","Technology Egg","Queen's Jewel Egg","Village Egg","UFO Egg","Futuristic Egg","Leprachaun Egg"},
   CurrentOption = "--",
   Callback = function(value)
    selectedEgg = value[1]
    selectedEggPosition = eggLocation[value[1]] 
   end,
})
 

function openE()
    mr.CFrame = CFrame.new(selectedEggPosition)
    while OE == true do
        if not getgenv() then break end
        local args = {[1] = selectedEgg,[2] = "Buy1"}
        game:GetService("ReplicatedStorage"):WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteFunction"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))     
        game:GetService("ReplicatedStorage"):WaitForChild("Marchy"):WaitForChild("PetRemotes"):WaitForChild("Generic"):WaitForChild("EquipBest"):FireServer()   
        game:GetService("ReplicatedStorage"):WaitForChild("Marchy"):WaitForChild("PetRemotes"):WaitForChild("Generic"):WaitForChild("CraftAll"):FireServer()
        wait(0.5)
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Auto Open Selected Egg (Stay Close)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().OE = bool
     if bool then
         openE()
     end
    end,
 })

























 local Section = Tab:CreateSection("Unlock Worlds")

local worldLocation = {
    ["Spawn"] = Vector3.new(739, 890, 108),
    ["Frozen Wonderland"] = Vector3.new(756, 887, -197),
    ["Sunny Beach"] = Vector3.new(969, 889, -452),
    ["Samurai Meadow"] = Vector3.new(1292, 887, -713),
    ["Busy City"] = Vector3.new(1537, 887, -950),
    ["Medieval Fortress"] = Vector3.new(1800, 887, -1231),
    ["The Future"] = Vector3.new(1727, 888, -1635)
}


local selectedWordPosition = worldLocation["Frozen Wonderland"]
local selectedWorld
local Dropdown = Tab:CreateDropdown({
   Name = "Choose World",
   Options = {"Spawn","Frozen Wonderland","Sunny Beach","Samurai Meadow","Busy City","Medieval Fortress","The Future"},
   CurrentOption = "--",
   Callback = function(value)
    selectedWorld = value[1]
    selectedWordPosition = worldLocation[value[1]] 
   end,
})
 



 function buyW()
    mr.CFrame = CFrame.new(selectedWordPosition)
        local args = {[1] = selectedWorld}
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuyWorld"):FireServer(unpack(args))
    wait()
end


local Button = Tab:CreateButton({
    Name = "Buy/Goto Selected World",
    Callback = function()
        buyW()
    end,
 })
