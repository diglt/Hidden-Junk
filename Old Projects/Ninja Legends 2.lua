getgenv().S = false
getgenv().B = false
getgenv().O = false
getgenv().Sh = false
getgenv().Se = false
getgenv().Gc = false
getgenv().Cr = false
getgenv().Gr = false
getgenv().Bo = false

-- rank

function doGr()
    spawn(function()
        while Gr == true do
        if not getgenv() then break end
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Spirit Warrior")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dragon Enforcer")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Elite Soul Hunter")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Awoken Samurai")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Mystic Horizons Master")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dark Galaxy Assassin")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))                                                                           
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Relentless Gladiator")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Unleashed Cyberninja")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Ancient Millenium Beast")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Infinity Overlord")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Starstrike Megalith")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Underworld Golem")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))   
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dark Universe Hunter")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args)) 
        local args = {[1] = "buyEvolution",[2] = game:GetService("ReplicatedStorage"):WaitForChild("Evolutions"):WaitForChild("Ground"):WaitForChild("Dual Eternity Legends")}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))                                                                                                                           
        wait(5)
        end
    end)
end




-- sell

function doSe()
    spawn(function()
        while Se == true do 
            if not getgenv() then break end
            local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
            local location = CFrame.new(-86, 8631, 36)
            pl.CFrame = location
            wait(0.5)
            local location = CFrame.new(-90, 8647, 36)
            pl.CFrame = location
            wait(0.5)
        end
    end)
end



-- boss
function doBo()
    spawn(function()
        while Bo == true do
        if not getgenv() then break end
        teleportTo(game:GetService("Workspace").spawnedBosses["Elemental Cyborg"].UpperTorso.CFrame)
        local args = {[1] = "swingBlade"}game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        wait()
        end
    end)
end







-- crystals 
function doCr()
    spawn(function()
        while Cr == true do 
            if not getgenv() then break end
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Crystals",
                    ["whichPlanet"] = "Planet Chaos"
                }
            }
            
            game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))            
            wait()
        end
    end)
end







-- blades
function doB()
    spawn(function()
        while B == true do 
            if not getgenv() then break end
            local args = {
                [1] = "buyAllItems",
                [2] = {
                    ["whichItems"] = "Swords",
                    ["whichPlanet"] = "Planet Chaos"
                }
            }
            game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))  
            wait()
        end
    end)
end








-- swing
function doS()
    spawn(function()
    while S == true do
    if not getgenv() then break end
        local args = {
            [1] = "swingBlade"
        }
        
        game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
        wait()
    end
end)
end







-- shards, coins
function doSh()
    spawn(function()
        while Sh == true do
            if not getgenv() then break end
            for i, v in pairs(game:GetService("Workspace").spawnedCoins["Shuriken City"]:GetDescendants()) do
                if v.Name == "Shard" and v.Parent then
                    teleportTo(game:GetService("Workspace").randomStuff.gradientCircle.CFrame)
                    wait(0.1)
                end
            end
        end
    end)
end

-- teleport to

function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
    end
  end



-- GUI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
    Name = "Ninja Legends 2",
    LoadingTitle = "AOT is peak fiction",
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
    Name = "Redeem All Codes",
    Callback = function()
        local args = {[1] = "powers500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "shurikencity500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "epicturrets450"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "waterfall500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "newgame500"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "bossbattle300"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "Firstplanet250"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "epictower350"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
        local args = {[1] = "treeninja400"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("codeRemote"):InvokeServer(unpack(args))
    end,
 })



 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })



 local Section = Tab:CreateSection("Sell")

local Toggle = Tab:CreateToggle({
    Name = "Auto Sell",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Se = bool
     if bool then
         doSe()
     end
    end,
 })
 

 local Section = Tab:CreateSection("Autos")

local Toggle = Tab:CreateToggle({
   Name = "Auto Swing",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().S = bool
    if bool then
        doS()
    end
   end,
}) 


 local Toggle = Tab:CreateToggle({
    Name = "Auto Crystal (More Element Storage)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Cr = bool
     if bool then
         doCr()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Blade (More Coins)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().B = bool
     if bool then
         doB()
     end
    end,
 })


 local Toggle = Tab:CreateToggle({
    Name = "Auto Rank",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Gr = bool
     if bool then
         doGr()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Boss",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Bo = bool
     if bool then
         doBo()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Shard/Coin (WIP/ Use Volcano Master For Now)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().Sh = bool
     if bool then
         doSh()
     end
    end,
 })


 local Section = Tab:CreateSection("Orb")

 local selectedOrb
 local Dropdown = Tab:CreateDropdown({
    Name = "Choose Orb",
    Options = {"Electro Orb","Astral Orb","Sky Tempest Orb","Mystic Fusion Orb","Dark Supernova Orb","Omega Genesis Orb","Secret Shadows Orb","Forgotten Legends Orb","Lighting Storm Orb"},
    CurrentOption = "--",
    Callback = function(value)
        selectedOrb = value[1]
    end,
})
 
 function doO()
     spawn(function()
         while O == true do
         if not getgenv() then break end
            local args = {
                [1] = "openOrb",
                [2] = workspace:WaitForChild("petOrbs"):WaitForChild(selectedOrb)
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("openOrbRemote"):InvokeServer(unpack(args))
            local args = {[1] = "autoEvolvePets"}game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("autoEvolveRemote"):InvokeServer(unpack(args))                                         
            wait()
         end
     end)
 end
 
 
 local Toggle = Tab:CreateToggle({
     Name = "Auto Selected Orb (Auto Evolves)",
     CurrentValue = false,
     Callback = function(bool)
      getgenv().O = bool
      if bool then
          doO()
      end
     end,
  })
 
  local Button = Tab:CreateButton({
    Name = "Orb Prices (Press F9 to read)",
    Callback = function()
        print("(Electro = 2k) (Astral = 5k) (Sky = 30k) (Mystic = 75k) (Supernova = 200k) (Omega Genesis = 500k) (Secret Shadows = 2M) (Lighting = 5M) (Forgotten = 10 Green Shards/Tokens)")
    end,
 })


 local Section = Tab:CreateSection("Other Features")

 local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
 local Button = Tab:CreateButton({
    Name = "Become Volacano Master",
    Callback = function()
        local location = CFrame.new(-352, 171, 8)
        pl.CFrame = location
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Get All Chests",
    Callback = function()
        local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
        local location = CFrame.new(86, 8642, 126)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 6321, 16)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(86, 4691, 128)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 3067, 128)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(87, 1477, 127)
        pl.CFrame = location
        wait(1)
        local location = CFrame.new(-335, 123, 217)
        pl.CFrame = location
        wait(1)
    end,
 })
 

 local Button = Tab:CreateButton({
    Name = "Buy All Skills",
    Callback = function()
        local args = {
            [1] = "buyAllItems",
            [2] = {
                ["whichItems"] = "Skills",
                ["whichPlanet"] = "Planet Chaos"
            }
        }
        
        game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Buy All Powers",
    Callback = function()
        local args = {
            [1] = "buyAllItems",
            [2] = {
                ["whichItems"] = "Powers",
                ["whichPlanet"] = "Planet Chaos"
            }
        }
        
        game.Players.LocalPlayer:WaitForChild("saberEvent"):FireServer(unpack(args))
    end,
 })


 Rayfield:LoadConfiguration()
