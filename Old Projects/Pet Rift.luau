-- globals --

getgenv().AC = false 
getgenv().AE = false

-- locals -- 

local lp = game.Players.LocalPlayer
local rp = lp.Character.HumanoidRootPart




-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "Pet Rift",
    LoadingTitle = "why are you reading this",
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

 local Tab = Window:CreateTab("Main",4483362458)
 local Tab3 = Window:CreateTab("Pets",4483362458)
 local Tab2 = Window:CreateTab("Worlds",4483362458)
 local Tab1 = Window:CreateTab("Other",4483362458) 

 
 local Section = Tab1:CreateSection("Other Features")
 local Section = Tab2:CreateSection("World Features")
 local Section = Tab3:CreateSection("Pet Features")

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

 local worlds = {
    ["Spawn"] = "SPAWN",
    ["Spring"] = "SPRING",
    ["Volcano"] = "VOLCANO",
    ["Zombie"] = "ZOMBIE",
    ["Ocean"] = "OCEAN",
    ["Fantasy Nature"] = "FANTASY_NATURE",
    ["Volcano Matter"] = "VOLCANO_MATTER",
    ["War City"] = "WAR_CITY",
    ["Break City"] = "BREAK_CTIY",
    ["Moon"] = "MOON",
    ["Void"] = "VOID",
    ["Troll"] = "TROLL",
    ["Witch"] = "WITCH",
    ["Orc"] = "ORC",
    ["Cyber"] = "CYBER",
    ["Atlantis"] = "ATLANTIS",
    ["Dwarf"] = "DWARF",
    ["Goblin"] = "GOBLIN",
    ["Beach"] = "BEACH",
    ["Deep Ocean"] = "DEEP_OCEAN",
    ["Dead Nature"] = "DEAD_NATURE",
    ["Hell"] = "HELL",
    ["Magma"] = "MAGMA",
    ["Skeletons"] = "SKELETONS"
}

local selectedWorld
local Dropdown = Tab:CreateDropdown({
    Name = "Choose World To Attack",
    Options = {"Spawn","Spring","Fantasy Nature","Dead Nature","Volcano","Zombie","Witch","Skeletons","Hell","Magma","Volcano Mattter","Void","Ocean","Atlantis","Deep Ocean","Beach","Goblin","Dwarf","Orc","Troll","Cyber","Moon","Break City","War City"},
    CurrentOption = "--",
    Callback = function(value)
        selectedWorld = worlds[value[1]]
        print(selectedWorld)
    end,
})

local piles = {
    ["Pile"] = "_pile",
    ["Safe"] = "_safe",
    ["Crate"] = "_crate"
}

local joinedpile

local selectedPile 
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Pile To Attack",
    Options = {"Pile","Safe","Crate"},
    CurrentOption = "--",
    Callback = function(value)
        selectedPile = piles[value[1]]
        joinedpile = selectedWorld .. selectedPile
        print(joinedpile)
    end,
})

local petamount = 1
local pilepart

function AttackC()
    while AC == true do 
        task.wait()
        if not getgenv then break end
        local path = game:GetService("Workspace").ObjectsFolder[selectedWorld]:GetChildren()
        for i,v in pairs(path) do 
            if v.Name == joinedpile and v ~= nil then 
                    pilepart = v
                    local pilename = v.Name
                    repeat
                    petamount = petamount + 1
                    print(petamount)
                    local args = {
                        [1] = "PetAttack",
                        [2] = workspace:WaitForChild("ObjectsFolder"):WaitForChild(selectedWorld):WaitForChild(pilename)
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Client"):FireServer(unpack(args))
                    task.wait(0.2)
                until petamount >= 5
                petamount = 1
                print("Max Amount!")
                task.wait(5)
            end
         end
    end
end







local Toggle = Tab:CreateToggle({
   Name = "Auto Selected Coin",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().AC = bool
    if bool then
        AttackC()
    end
   end,
})







local dudvalue 
local buyworld 
local Dropdown = Tab2:CreateDropdown({
    Name = "Choose World To Buy",
    Options = {"Spawn","Spring","Fantasy Nature","Dead Nature","Volcano","Zombie","Witch","Skeletons","Hell","Magma","Volcano Mattter","Void","Ocean","Atlantis","Deep Ocean","Beach","Goblin","Dwarf","Orc","Troll","Cyber","Moon","Break City","War City"},
    CurrentOption = "--",
    Callback = function(value)
        buyworld = value[1]
    end,
})

 
local Button = Tab2:CreateButton({
    Name = "Buy World",
    Callback = function()
    local args = {
        [1] = "BuyWorld",
        [2] = buyworld
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Client"):FireServer(unpack(args))
    end,
 })





local eggPositions = {
    ["SpawnE"] = Vector3.new(143, 10, -470),
    ["SpringE"] = Vector3.new(143, 10, -470),

    ["Fantasy NatureE"] = Vector3.new(151, 10, -454),
    ["Dead NatureE"] = Vector3.new(151, 10, -454),

    ["VolcanoE"] = Vector3.new(176, 10, -432),
    ["ZombieE"] = Vector3.new(176, 10, -432),

    ["WitchE"] = Vector3.new(195, 10, -421),
    ["SkeletonsE"] = Vector3.new(195, 10, -421),

    ["HellE"] = Vector3.new(227, 10, -405),
    ["MagmaE"] = Vector3.new(227, 10, -405),

    ["Volcano MatterE"] = Vector3.new(247, 10, -402),
    ["VoidE"] = Vector3.new(247, 10, -402),

    ["OceanE"] = Vector3.new(282, 10, -402),
    ["AtlantisE"] = Vector3.new(282, 10, -402),

    ["Deep_OceanE"] = Vector3.new(302, 10, -406),
    ["BeachE"] = Vector3.new(302, 10, -406),

    ["GoblinE"] = Vector3.new(335, 10, -423),
    ["DwarfE"] = Vector3.new(335, 10, -423),

    ["OrcE"] = Vector3.new(350, 10, -433),
    ["TrollE"] = Vector3.new(350, 10, -433),

    ["CyberE"] = Vector3.new(373, 10, -460),
    ["MoonE"] = Vector3.new(373, 10, -460),

    ["Break_CityE"] = Vector3.new(385, 10, -475),
    ["War_CityE"] = Vector3.new(385, 10, -475),
}





local eggPOS = eggPositions["Spawn"]
 local buyEgg 
 local Dropdown = Tab3:CreateDropdown({
     Name = "Choose Egg To Buy",
     Options = {"SpawnE","SpringE","Fantasy NatureE","Dead NatureE","VolcanoE","ZombieE","WitchE","SkeletonsE","HellE","MagmaE","Volcano MatterE","VoidE","OceanE","AtlantisE","Deep_OceanE","BeachE","GoblinE","DwarfE","OrcE","TrollE","CyberE","MoonE","Break_CityE","War_CityE"},
     CurrentOption = "--",
     Callback = function(value)
        buyEgg = string.gsub(value, "E", "") 
        eggPOS = eggPositions[value[1]]
 end,

 })


 function openE()
    rp.CFrame = CFrame.new(eggPOS)
    while AE == true do
        if not getgenv then break end 
        local args = {
            [1] = buyEgg,
            [2] = "Single"}
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EggOpened"):InvokeServer(unpack(args))        
    end
end


local Toggle = Tab3:CreateToggle({
    Name = "Auto Selected Egg",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().AE = bool
     if bool then
         openE()
     end
    end,
 })
