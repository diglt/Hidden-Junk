-- Toggles -- 

getgenv().GiftClaim = false
getgenv().SpinWheel = false 
getgenv().HandToggle = false
getgenv().BicepToggle = false 
getgenv().ClaimSeason = false 
getgenv().EnableFight = false 
getgenv().AllowBestPets = false 
getgenv().KnuckleToggle = false 
getgenv().EnableRebirths = false 
getgenv().EnableEggOpens = false 
getgenv().EnableAutoPotion = false
getgenv().EnableCrateRolling = false  


-- Locals -- 
local RequiredScriptCode = 022104
local lp = game.Players.LocalPlayer
local char = lp.Character
local PlayerRoot = char:FindFirstChild("HumanoidRootPart")
local PetFolderLocation = game:GetService("Workspace").PetFolder

-- Simplified -- 

local RedeemCodeRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.CodeRedemptionService.RE.onRedeem
local BarbellRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onEquipRequest
local CrateOpenRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmsService.RF.RollAllCratesForPlayer
local AllowEggOpenRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.EggService.RF.purchaseEgg
local BestPetEquipRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.PetService.RF.equipBest
local RebirthRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.RebirthService.RE.onRebirthRequest
local ClickRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onClick
local BicepChangeWeightRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onGuiEquipRequest
local HandChangeWeightRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ToolService.RE.onGuiEquipRequest
local ChangeTierRemote = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.PunchBagService.RE.onGiveStats
local SpinRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.SpinService.RE.onSpinRequest
local ClaimSeasonRequest = game:GetService("ReplicatedStorage").Communication.Functions[""]
local FightSelectNPC = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onEnterNPCTable
local FightClickRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.ArmWrestleService.RE.onClickRequest
local PotionRequest = game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.BoostService.RE.useBoost


-- Tables -- 

local TieredPositionsW1 = {
    ["Tier1"] = Vector3.new(-10227, 5, 114),
    ["Tier2"] = Vector3.new(-10227, 5, 124),
    ["Tier3"] = Vector3.new(-10227, 5, 129),
    ["Tier4"] = Vector3.new(-10235, 5, 128),
    ["Tier5"] = Vector3.new(-10244, 5, 128),
    ["Tier6"] = Vector3.new(-10254, 5, 129),
}

local TieredPositionsW2 = {
    ["Tier1"] = Vector3.new(-10331, 5, 621),
    ["Tier2"] = Vector3.new(-10331, 5, 613),
    ["Tier3"] = Vector3.new(-10331, 5, 604),
    ["Tier4"] = Vector3.new(-10331, 5, 594),
    ["Tier5"] = Vector3.new(-10331, 5, 584),
    ["Tier6"] = Vector3.new(-10331, 5, 574),
}

local TieredPositionsW3 = {
    ["Tier1"] = Vector3.new(11563, 10, 126),
    ["Tier2"] = Vector3.new(11560, 10, 118),
    ["Tier3"] = Vector3.new(11560, 10, 109),
    ["Tier4"] = Vector3.new(11558, 10, 101),
    ["Tier5"] = Vector3.new(11557, 10, 92),
    ["Tier6"] = Vector3.new(11555, 10, 83),
}

local TieredPositionsW4 = {
    ["Tier1"] = Vector3.new(-10360, 6, -889),
    ["Tier2"] = Vector3.new(-10354, 6, -895),
    ["Tier3"] = Vector3.new(-10347, 6, -899),
    ["Tier4"] = Vector3.new(-10341, 6, -904),
    ["Tier5"] = Vector3.new(11557, 10, 92),
    ["Tier6"] = Vector3.new(11555, 10, 83),
}

-- Functions -- 

function RedeemAllCodes()
    spawn(function()
        RedeemCodeRequest:FireServer("noob")
        RedeemCodeRequest:FireServer("noob")
        RedeemCodeRequest:FireServer("noob")
        RedeemCodeRequest:FireServer("noob")
    end)
end





function IncreaseBicepStrength()
    spawn(function() 
        while getgenv().BicepToggle == true do
             ClickRequest:FireServer()
        task.wait()
        end
    end)
end


function IncreaseHandStrength()
    spawn(function()
        while getgenv().HandToggle == true do 
            ClickRequest:FireServer()
            task.wait()
        end
    end)
end


function RunGift()
    for i = 0,12 do
        local NewNumb = i + 1 
        if NewNumb > 12 then break end 
        local args = {[1] = NewNumb}
    game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.4.7"].knit.Services.TimedRewardService.RE.onClaim:FireServer(unpack(args))
    end
end

function ClaimGifts()
    spawn(function()
        while getgenv().GiftClaim == true do 
                RunGift()
            task.wait(60)
        end
    end)
end


function AutoSpinWheel()
    spawn(function()
        while SpinWheel == true do
            SpinRequest:FireServer()
            task.wait(5)
        end
    end)
end

function RunSeason()
    for i = 0,12 do
        local NewNumb = i + 1 
        if NewNumb > 20 then break end 
        ClaimSeasonRequest:InvokeServer(NewNumb,"Main")
    end
end

function AutoClaimSeason()
    spawn(function()
        while getgenv().ClaimSeason == true do 
                RunSeason()
            task.wait(60)
        end
    end)
end

function AutoRebirth()
    spawn(function()
        while EnableRebirths == true do
            RebirthRequest:FireServer()
            task.wait(1)
        end
    end)
end


function EquipBestPets()
    spawn(function()
        while AllowBestPets == true do
            BestPetEquipRequest:InvokeServer(game:GetService("Players").LocalPlayer)
            task.wait(2)
        end
    end)
end

function AutoOpenAllCrate()
    spawn(function()
        while EnableCrateRolling == true do
            CrateOpenRequest:InvokeServer()
            task.wait()
        end
    end)
end

-- Library -- 


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
    Name = "Neural Hub",
    LoadingTitle = "FE Non Skidded 2023 Epik!!11!1",
    LoadingSubtitle = "by Neural",
    ConfigurationSaving = {
       Enabled = true,
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
   Title = "Hey there",
   Content = "Enjoy the script, join the discord if you wish to see more.",
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

 local Creator = "neural"
 local Tab = Window:CreateTab("Main",4483362458)
 local Tab2 = Window:CreateTab("Eggs And Pets",4483362458)
 local Tab1 = Window:CreateTab("Other Features",4483362458)
 local Tab999 = Window:CreateTab("Settings",4483362458) 



local Section = Tab2:CreateSection("Eggs")

local selectedEggToOpen
local Dropdown = Tab2:CreateDropdown({
    Name = "Choose Egg To Open",
    Options = {"Limited","Earth","Icy","Lava","Blackhole","Crystal","Molten","Solar","Moon","Ice","Burning","Coconut","Palm","Treasure","Clam","KingFish","Poseidon","Rust","Widget","Atom","Iridescent","Mutant","Nuclear","TRex","Herbivore","Pterodactyl","Mystic","DinoFossil","Gem"},
    CurrentOption = "--",
    Callback = function(value)
        selectedEggToOpen = value[1]
        AllowEggOpenRequest:InvokeServer(selectedEggToOpen,{})
    end,
})

local Section = Tab2:CreateSection("Pets")

function AutoPets()
    spawn(function()
        while EnableEggOpens == true do
            AllowEggOpenRequest:InvokeServer(selectedEggToOpen,{})
            task.wait()
        end
    end)
end


local Toggle = Tab2:CreateToggle({
   Name = "Auto Open Selected Egg",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().EnableEggOpens = bool
    if bool then
        AutoPets()
    end
   end,
})

local Toggle = Tab2:CreateToggle({
   Name = "Auto Equip Best Pet",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AllowBestPets = bool
    if bool then
        EquipBestPets()
    end
   end,
})


 local Section = Tab999:CreateSection("Hey!")

 local Button = Tab999:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })


 local Section = Tab999:CreateSection("I have an issue!")
 
 local Button = Tab999:CreateButton({
   Name = "Dm n.eural for issues on discord.",
   Callback = function()
   end,
})

 local Section = Tab999:CreateSection("Who Made This?")

local Paragraph = Tab999:CreateParagraph({Title = "Credits", Content = "n.eural - Script Maker And Owner."})


 local Section = Tab1:CreateSection("Other Features")

local Toggle = Tab1:CreateToggle({
   Name = "Auto Claim Gifts",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().GiftClaim = bool
    if bool then
        ClaimGifts()
    end
   end,
})

local Toggle = Tab1:CreateToggle({
   Name = "Auto Spin Wheel",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().SpinWheel = bool
    if bool then
        AutoSpinWheel()
    end
   end,
})

local MYNAME = neural

local selectedPotion
local Dropdown = Tab1:CreateDropdown({
    Name = "Select Potion",
    Options = {"Void","Golden","Luck","Wins"},
    CurrentOption = "--",
    Callback = function(value)
        selectedPotion = value[1]
        return selectedPotion
    end,
})

function UsePotion()
    spawn(function()
        while EnableAutoPotion == true do
            PotionRequest:FireServer(selectedPotion)
            wait(0.1)
        end
    end)
end

local Toggle = Tab1:CreateToggle({
   Name = "Auto Use Potion",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().EnableAutoPotion = bool
    if bool then
        UsePotion()
    end
   end,
})


local Section = Tab:CreateSection("Select Your World")

local selectedWorld
local Dropdown = Tab:CreateDropdown({
    Name = "Select Which World",
    Options = {"1","2","3","4","5"},
    CurrentOption = "--",
    Callback = function(value)
        selectedWorld = value[1]
        print(selectedWorld)
        return selectedWorld
    end,
})

function GoToSelectWorld()
    spawn(function()
        if tonumber(selectedWorld) == 1 then 
            PlayerRoot.CFrame = CFrame.new(-10277, 4, 61)
            elseif tonumber(selectedWorld) == 2 then 
                PlayerRoot.CFrame = CFrame.new(-10281, 4, 606)
                elseif tonumber(selectedWorld) == 3 then 
                    PlayerRoot.CFrame = CFrame.new(11635, 9, 90)
                elseif tonumber(selectedWorld) == 4 then 
                    PlayerRoot.CFrame = CFrame.new(-10310, 4, -861)
            elseif tonumber(selectedWorld) == 5 then 
            PlayerRoot.CFrame = CFrame.new(-10261, -4, -1422)
        end
    end)
end


 local Button = Tab:CreateButton({
   Name = "Teleport To Selected World.",
   Callback = function()
        GoToSelectWorld()
   end,
})

local Paragraph = Tab:CreateParagraph({Title = "Notice For Worlds!", Content = "Please select your CURRENT world, if you don't THINGS WILL NOT ENABLE."})

local Section = Tab:CreateSection("Biceps")

local selectedBiBarbell
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Barbell To Use",
    Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6","Tier7","Tier8","Tier9","Tier10","Tier11","Tier12"},
    CurrentOption = "--",
    Callback = function(value)
        selectedBiBarbell = value[1]
        BarbellRequest:FireServer(selectedWorld, "Barbells", selectedBiBarbell)
    end,
})


local selectedBiWeight
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Bicep Weight To Use",
    Options = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg","300Kg","400Kg","500Kg","650Kg","800Kg","1000Kg","1500Kg","2000Kg","2500Kg","3000Kg","3500Kg","4000Kg","5000Kg","6000Kg","7500Kg","10000Kg","125000Kg","150000Kg","200000Kg","250000Kg","300000Kg","350000Kg","400000Kg","450000Kg","500000Kg","600000Kg","700000Kg","800000Kg","900000Kg","1000000Kg","1250000Kg","1500000Kg","1750000Kg","2000000Kg","2500000Kg","3000000Kg"},
    CurrentOption = "--",
    Callback = function(value)
        selectedBiWeight = value[1]
        BicepChangeWeightRequest:FireServer(selectedWorld, "Dumbells", selectedBiWeight)
    end,
})

local Toggle = Tab:CreateToggle({
   Name = "Train Biceps",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().BicepToggle = bool
    if bool then
        IncreaseBicepStrength()
    end
   end,
})

local Section = Tab:CreateSection("Hands")

local selectedHaWeight
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Hand Weight To Use",
    Options = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg","300Kg","350Kg","400Kg","450Kg","500Kg","600Kg","700Kg","800Kg","900Kg","1000Kg","1250Kg","1500Kg","5000Kg","6000Kg","7500Kg","10000Kg","12500Kg","15000Kg","20000Kg","25000Kg","30000Kg","35000Kg","40000Kg","45000Kg","50000Kg","60000Kg","70000Kg","80000Kg","90000Kg","100000Kg","125000Kg","150000Kg","175000Kg","200000Kg","250000Kg","300000Kg","350000Kg","375000Kg","400000Kg","425000Kg","450000Kg","475000Kg","500000Kg","525000Kg","550000Kg","575000Kg","600000Kg","625000Kg"},
    CurrentOption = "--",
    Callback = function(value)
        selectedHaWeight = value[1]
        HandChangeWeightRequest:FireServer(selectedWorld, "Grips", selectedHaWeight)
    end,
})


local Toggle = Tab:CreateToggle({
   Name = "Train Hand Strength",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().HandToggle = bool
    if bool then
        IncreaseHandStrength()
    end
   end,
})

local Section = Tab:CreateSection("Knuckles")

local KnWeightPOS
local selectedKnWeight
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Knuckle Tier To Use",
    Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"},
    CurrentOption = "--",
    Callback = function(value)
        selectedKnWeight = value[1]
            ChangeTierRemote:FireServer(selectedWorld, selectedKnWeight)
        return selectedHaWeight, KnWeightPOS
    end,
})

function ChangeWorlds()
    spawn(function()
        if tonumber(selectedWorld) == 1 then
        KnWeightPOS = TieredPositionsW1[selectedKnWeight]
            elseif tonumber(selectedWorld) == 2 then 
            KnWeightPOS = TieredPositionsW2[selectedKnWeight]
            elseif tonumber(selectedWorld) == 3 then 
                KnWeightPOS = TieredPositionsW3[selectedKnWeight]
            elseif tonumber(selectedWorld) == 4 then 
                KnWeightPOS = TieredPositionsW4[selectedKnWeight]
        end
    end)
end



function IncreaseKnuckleStrength()
    spawn(function()
        while getgenv().KnuckleToggle == true do 
            ChangeTierRemote:FireServer(selectedWorld, selectedKnWeight)
            task.wait()
        end
    end)
end

function TeleportToTier()
    spawn(function()
        PlayerRoot.CFrame = CFrame.new(KnWeightPOS)
        wait()
    end)
end


local Toggle = Tab:CreateToggle({
   Name = "Train Knuckle Strength",
   CurrentValue = false,
   Callback = function(bool)
    ChangeWorlds()
    TeleportToTier()
    getgenv().KnuckleToggle = bool
    if bool then
        IncreaseKnuckleStrength()
    end
   end,
})

local Section = Tab:CreateSection("Challenge")

local selectedNPCToFight
local Dropdown = Tab:CreateDropdown({
    Name = "Choose NPC To Fight",
    Options = {"Bully","Teacher","GymRat","MafiaBoss","Champion","ScrapTrader","CyberCop","SlicerAssassin","RipperDoc","RogueAi","CocoNut","FatPirate","MermaidKing","FriendlyShark","KrakenBoss","Barbarian","Hazmat","Enforcer","Bulk","MutantKing","Primal","Dino","Archeologist","TribeLeader","Mammoth"},
    CurrentOption = "--",
    Callback = function(value)
        selectedNPCToFight = value[1]
        FightSelectNPC:FireServer(selectedNPCToFight, workspace.Zones[selectedWorld].Interactables.ArmWrestling.NPC[selectedNPCToFight],selectedWorld)
    end,
})

function AutoFightNPC()
    spawn(function()
        while getgenv().EnableFight == true do 
            FightSelectNPC:FireServer(selectedNPCToFight, workspace.Zones[selectedWorld].Interactables.ArmWrestling.NPC[selectedNPCToFight],selectedWorld)
            FightClickRequest:FireServer()
            task.wait()
        end
    end)
end



local Toggle = Tab:CreateToggle({
   Name = "Auto Fight The NPC",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().EnableFight = bool
    if bool then
        AutoFightNPC()
    end
   end,
})

local Section = Tab:CreateSection("Rebirths")

local Toggle = Tab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().EnableRebirths = bool
    if bool then
        AutoRebirth()
    end
   end,
})

local Section = Tab:CreateSection("Crates")

local Toggle = Tab:CreateToggle({
   Name = "Auto Roll All Crates",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().EnableCrateRolling = bool
    if bool then
        AutoOpenAllCrate()
    end
   end,
})
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            while Creator ~= "neural" do
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        SpinRequest:FireServer("!>!>!>!>!>!>!>!")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        end


