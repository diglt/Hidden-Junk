getgenv().F = false
getgenv().O = false
getgenv().E = false

local plr = game.Players.LocalPlayer.Character.HumanoidRootPart


function doF()
    spawn(function()
        while F == true do
            if not getgenv() then break end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-57, 4, -4)
            wait(5.5)
        end
    end)
end


function doO()
    spawn(function()
        while O do 
            if not getgenv() then break end
            for i,v in pairs(game:GetService("Workspace").Collectibles:GetDescendants()) do
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

function doR()
    spawn(function()
        while R do
            if not getgenv() then break end
            game:GetService("ReplicatedStorage").Remotes.Rebirth:InvokeServer()
            wait(3)
        end
    end)
end

-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "Digital",
    LoadingTitle = "what should i put here",
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
 local Tab2= Window:CreateTab("Eggs")
 local Tab1 = Window:CreateTab("Other") 

 
 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Button = Tab1:CreateButton({
    Name = "Any problems dm diglt#3397",
    Callback = function()
    end,
 })

 local Button = Tab1:CreateButton({
    Name = "Credits to Scorch#5987 for some feautures.",
    Callback = function()
    end,
 })

 local Section = Tab:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Fly",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().F = bool
    if bool then
        doF()
    end
   end,
})

local Toggle = Tab:CreateToggle({
    Name = "Auto Orbs (Toggle this 3 times)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().O = bool
     if bool then
         doO()
     end
    end,
 })
 
 local Toggle = Tab:CreateToggle({
	Name = "Auto Rebirth",
	CurrentValue = false,
	Callback = function(bool)
     getgenv().R = bool
     if bool then
        doR()
     end 
    end  
})

local Section = Tab:CreateSection("Obby")

 local Button = Tab:CreateButton({
    Name = "Do Obby 1",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-148,5,35) 
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-373,21,-250)
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3849, 20, -1)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Do Obby 2",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-148,5,35)
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-379,21,-229)
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3845,20,0)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Do Obby 3",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-148,5,35)
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-400,21,-218)
        wait(3)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3845,20,0)
    end,
 })

 local Section = Tab2:CreateSection("Eggs")

 
local selectedEgg

local Dropdown = Tab2:CreateDropdown({
   Name = "Choose Egg",
   Options = {"Egg001","Egg002","Egg003","Egg004","Egg005","Egg006","Egg007","Egg008","Egg009","Egg010","Egg011","Egg012","Egg013","Egg014","Egg015","Egg016","Egg017","Egg018","Egg019","Egg020","Egg021","Egg022","Egg023","Egg024"},
   CurrentOption = "--",
   Callback = function(value)
    selectedEgg = value[1]
   end,
})

function doE()
    spawn(function()
        while E == true do
        if not getgenv() then break end
        local args = {[1] = selectedEgg,[2] = 1}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseEgg"):InvokeServer(unpack(args))
        wait(1.5)        
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MergePets"):InvokeServer()
           wait(2)
        end
    end)
end


 local Toggle = Tab2:CreateToggle({
    Name = "Auto Selected Egg (Auto Evolves)",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().E = bool
     if bool then
         doE()
     end
    end
})


 Rayfield:LoadConfiguration()
