getgenv().AutoGum = false
getgenv().AutoSell = false
getgenv().AutoPet = false
getgenv().AutoPet1 = false
getgenv().AutoPet2 = false
getgenv().AutoPet3 = false
getgenv().AutoPet4 = false
getgenv().AutoPet5 = false
getgenv().AutoPet6 = false
getgenv().AutoPet7 = false
getgenv().AutoPet8 = false
getgenv().AutoPet9 = false


function doGum()
spawn(function()
    while AutoGum == true do
      if not getgenv() then break end
      local args = {[1] = {[1] = {[1] = false},[2] = {[1] = 2}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("blow bubble"):FireServer(unpack(args))
  wait()
    end
end)
end


function doSell()
spawn(function()
    while AutoSell == true do
      if not getgenv() then break end
      local args = {[1] = {[1] = {[1] = false},[2] = {[1] = 2}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("sell bubbles"):FireServer(unpack(args))
  wait()
    end
end)
end







function doPet()
    spawn(function()
        while AutoPet == true do
          if not getgenv() then break end
          local args = {[1] = {[1] = {[1] = "Common Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
      wait()
        end
    end)
end

function doPet1()
  spawn(function()
      while AutoPet1 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Spotted Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet2()
  spawn(function()
      while AutoPet2 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Safe Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet3()
  spawn(function()
      while AutoPet3 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Magma Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet4()
  spawn(function()
      while AutoPet4 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Frosted Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet5()
  spawn(function()
      while AutoPet5 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Banana Bandana on Nana Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet6()
  spawn(function()
      while AutoPet6 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Void Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet7()
  spawn(function()
      while AutoPet7 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Lantern Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet8()
  spawn(function()
      while AutoPet8 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Galaxy Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

function doPet9()
  spawn(function()
      while AutoPet9 == true do
        if not getgenv() then break end
        local args = {[1] = {[1] = {[1] = "Season 1 Egg"},[2] = {[1] = false}}}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("buy egg"):InvokeServer(unpack(args))
    wait()
      end
  end)
end

-- GUI

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("BGC diglt#3397") -- Creates the window

local b = w:CreateFolder("Blow Bubbles")

local c = w:CreateFolder("Pet")


b:DestroyGui()


b:Toggle("Auto Gum",function(bool)
  getgenv().AutoGum = bool
  print("Auto Gum is ", bool)
  if bool then
    doGum()
  end
end)



b:Toggle("Auto Sell",function(bool)
    getgenv().AutoSell = bool
    print("Auto Sell is ", bool)
    if bool then
        doSell()
        function teleportTo(placeCFrame)
            local plyr = game.Players.LocalPlayer
            if plyr.Character then
                plyr.Character.HumanoidRootPart.CFrame = placeCFrame
                wait()
            end
        end
        teleportTo(game:GetService("Workspace").MAP.SellBubbles.CFrame)
    end
  end)










  c:Toggle("Auto Buy Common",function(bool)
    getgenv().AutoPet = bool
    print("Auto Buy Common is ", bool)
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
      teleportTo(game:GetService("Workspace").MAP.Eggs["Common Egg"].EGG.CFrame)
    end
  end
end)


c:Toggle("Auto Buy Spotted",function(bool)
  getgenv().AutoPet1 = bool
  print("Auto Buy Spotted is ", bool)
  if bool then
    doPet1()
    while AutoPet1 == true do
      function teleportTo(placeCFrame)
        local plyr = game.Players.LocalPlayer
        if plyr.Character then
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame
            wait()
        end
    end
    teleportTo(game:GetService("Workspace").MAP.Eggs["Spotted Egg"].EGG.CFrame)
  end
end
end)

c:Toggle("Auto Buy Safe",function(bool)
  getgenv().AutoPet2 = bool
  print("Auto Buy Safe is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Safe Egg"].EGG.CFrame)
  end
end
end)

c:Toggle("Auto Buy Magma",function(bool)
  getgenv().AutoPet3 = bool
  print("Auto Buy Magma is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Magma Egg"].EGG.CFrame)
  end
end
end)

c:Toggle("Auto Buy Frosted",function(bool)
  getgenv().AutoPet4 = bool
  print("Auto Buy Frosted is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Frosted Egg"].EGG.CFrame)
  end
end
end)


c:Toggle("Auto Buy Banana Bandana on Nana ",function(bool)
  getgenv().AutoPet5 = bool
  print("Auto Buy Banana Bandana on Nana Egg is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Banana Bandana on Nana Egg"].EGG.CFrame)
  end
end
end)

c:Toggle("Auto Buy Void",function(bool)
  getgenv().AutoPet6 = bool
  print("Auto Buy Void is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Void Egg"].EGG.CFrame)
  end
end
end)


c:Toggle("Auto Buy Lantern",function(bool)
  getgenv().AutoPet7 = bool
  print("Auto Buy Lantern is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Lantern Egg"].EGG.CFrame)
  end
end
end)


c:Toggle("Auto Buy Galaxy",function(bool)
  getgenv().AutoPet8 = bool
  print("Auto Buy Galaxy is ", bool)
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
    teleportTo(game:GetService("Workspace").MAP.Eggs["Galaxy Egg"].EGG.CFrame)
  end
end
end)

c:Toggle("Auto Buy Season 1",function(bool)
  getgenv().AutoPet9 = bool
  print("Auto Buy Season 1 is ", bool)
  if bool then
    doPet9()
    while AutoPet9 == true do
      function teleportTo(placeCFrame)
        local plyr = game.Players.LocalPlayer
        if plyr.Character then
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame
            wait()
        end
    end
    teleportTo(game:GetService("Workspace").MAP.Eggs["Season 1 Egg"].EGG.CFrame)
  end
end
end)
