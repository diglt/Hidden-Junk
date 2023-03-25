getgenv().AutoBuild = false
getgenv().AutoPet = false
getgenv().AutoRebirth = false
getgenv().AutoPet2 = false
getgenv().AutoPet3 = false
getgenv().AutoPet4 = false
getgenv().AutoPet5 = false
getgenv().AutoPet6 = false
getgenv().AutoPet7 = false
getgenv().AutoPet8 = false
getgenv().AutoPet9 = false

function doBlock()
spawn(function()
    while AutoBuild == true do
      if not getgenv() then break end
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceBlock"):FireServer()
  wait()
    end
end)
end

function doPet()
spawn(function()
    while AutoPet == true do
      if not getgenv() then break end
      local args = {[1] = "Grass",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end

function doRebirth()
    spawn(function()
        while AutoRebirth == true do
          if not getgenv() then break end
          local args = {[1] = "RebirthShop"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):InvokeServer(unpack(args))        
      wait()
        end
    end)
end

function doPet2()
spawn(function()
    while AutoPet2 == true do
      if not getgenv() then break end
      local args = {[1] = "Stone",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet3()
spawn(function()
    while AutoPet3 == true do
      if not getgenv() then break end
      local args = {[1] = "Christmas",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet4()
spawn(function()
    while AutoPet4 == true do
      if not getgenv() then break end
      local args = {[1] = "Void",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet5()
spawn(function()
    while AutoPet5 == true do
      if not getgenv() then break end
      local args = {[1] = "Atlantis",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet6()
spawn(function()
    while AutoPet6 == true do
      if not getgenv() then break end
      local args = {[1] = "Lava",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet7()
spawn(function()
    while AutoPet7 == true do
      if not getgenv() then break end
      local args = {[1] = "Candy Land",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet8()
spawn(function()
    while AutoPet8 == true do
      if not getgenv() then break end
      local args = {[1] = "Frozen Star",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end


function doPet9()
spawn(function()
    while AutoPet9 == true do
      if not getgenv() then break end
      local args = {[1] = "Galatic",[2] = "Single"}game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpen"):InvokeServer(unpack(args))    
  wait()
    end
end)
end

-- teleporting

function getCurrentPlayerPOS()
    local playr = game.Players.LocalPlayer
    if playr.Character then
    return playr.Character.HumanoidRootPart.Positon
    end
    return false
end


function teleportTo(placeCFrame)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame
end
end


-- GUI


local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("+1 Blocks diglt#3397") -- Creates the window

local b = w:CreateFolder("Auto Blocks")

local c = w:CreateFolder("Auto Eggs") 

local d = w:CreateFolder("Auto Rebirth")

b:DestroyGui()

b:Toggle("Auto Blocks",function(bool)
    getgenv().AutoBuild = bool
    print("Auto Build is ", bool)
    if bool then
    doBlock()
    end
  end)



c:Toggle("Auto Buy Grass",function(bool)
    getgenv().AutoPet = bool
    print("Auto Buy Grass is ", bool)
    if bool then
    doPet()
      while AutoPet == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Grass.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Stone",function(bool)
    getgenv().AutoPet2 = bool
    print("Auto Buy Stone is ", bool)
    if bool then
    doPet2()
      while AutoPet2 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Stone.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Christmas",function(bool)
    getgenv().AutoPet3 = bool
    print("Auto Buy Christmas is ", bool)
    if bool then
    doPet3()
      while AutoPet3 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Christmas.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Void",function(bool)
    getgenv().AutoPet4 = bool
    print("Auto Buy Void is ", bool)
    if bool then
    doPet4()
      while AutoPet4 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Void.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Atlantis",function(bool)
    getgenv().AutoPet5 = bool
    print("Auto Buy Grass is ", bool)
    if bool then
    doPet5()
      while AutoPet5 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Atlantis.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Lava",function(bool)
    getgenv().AutoPet6 = bool
    print("Auto Buy Lava is ", bool)
    if bool then
    doPet6()
      while AutoPet6 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs.Lava.EggModel.Egg.CFrame)
    end
  end
end)

c:Toggle("Auto Buy Candy",function(bool)
    getgenv().AutoPet7 = bool
    print("Auto Buy Candy is ", bool)
    if bool then
    doPet7()
      while AutoPet7 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs["Candy Land"].EggModel.CandyLandEggCFrame)
    end
  end
end)

c:Toggle("Auto Buy Frozen Star",function(bool)
    getgenv().AutoPet8 = bool
    print("Auto Buy Frozen Star is ", bool)
    if bool then
    doPet8()
      while AutoPet8 == true do 
        function teleportTo(placeCFrame)
          local plyr = game.Players.LocalPlayer
          if plyr.Character then
              plyr.Character.HumanoidRootPart.CFrame = placeCFrame
              wait()
          end
      end
      teleportTo(game:GetService("Workspace").Eggs["Frozen Star"].EggModel.FrozenStarEgg.CFrame)
    end
  end
end)

d:Toggle("Auto Rebirth",function(bool)
    getgenv().AutoRebirth = bool
    print("Auto Build is ", bool)
    if bool then
    doRebirth()
    end
  end)
