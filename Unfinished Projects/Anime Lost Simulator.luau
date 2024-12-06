--[[
    Status: (Never Finishing)
]]--

getgenv().A = false 
getgenv().B = false
getgenv().C = false
getgenv().D = false 
getgenv().F = false 
getgenv().E = false 
getgenv().G = false 
getgenv().H = false 








-- locals --
local lp = game.Players.LocalPlayer
local ch = lp.Character
local rp = ch.HumanoidRootPart



-- functions --

function dr()
    while G == true do 
        if not getgenv then break end 
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("RebirthRem"):FireServer()
        task.wait(10)
    end
end





function cl()
    while A == true do 
        if not getgenv then break end 
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("attackFunc"):FireServer()
        task.wait()
    end
end



function bs()
    while C == true do 
        if not getgenv then break end 
        local args = {
            [1] = "Swords"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("EquipBest"):FireServer(unpack(args))      
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetFunctions"):WaitForChild("Inventories"):WaitForChild("Swords"):InvokeServer()     
        task.wait(1)
    end
end


function bp()
    while F == true do 
        if not getgenv then break end 
        local args = {
            [1] = "Pets"
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("EquipBest"):FireServer(unpack(args))          
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetFunctions"):WaitForChild("Inventories"):WaitForChild("Pets"):InvokeServer()    
        task.wait(1)
    end
end


function dq()
    rp.CFrame = CFrame.new(-617, 16, 202)
    while E == true do 
        if not getgenv then break end 
        local args = {[1] = "Get"}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("questStatus"):FireServer(unpack(args))    
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("getQuestStatus"):InvokeServer()    
        task.wait(5)
    end
end







-- GUI

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()


local Window = Rayfield:CreateWindow({
    Name = "Anime Lost Simulator",
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
   Content = "beebeeboop.",
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
 local Tab1 = Window:CreateTab("Other",4483362458) 

 
 local Section = Tab1:CreateSection("Other Features")




 local Button = Tab1:CreateButton({
    Name = "Redeem All Codes",
    Callback = function()
        local args = {[1] = "SORRYFORSHUT"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeemCode"):InvokeServer(unpack(args))
        local args = {[1] = "NODROPCOIN"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeemCode"):InvokeServer(unpack(args))
        local args = {[1] = "SORRYBUGPOTION"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeemCode"):InvokeServer(unpack(args))
        local args = {[1] = "Release"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeemCode"):InvokeServer(unpack(args))
        local args = {[1] = "SHUTDOWN1"}game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("redeemCode"):InvokeServer(unpack(args))
    end,
 })

 
 local Slider = Tab1:CreateSlider({
    Name = "Set WalkSpeed ",
    Range = {0, 500},
    Increment = 10,
    Suffix = "WS",
    CurrentValue = 10,
    Callback = function(Value)
        ch.Humanoid.WalkSpeed = Value
    end,
 })





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
   Name = "Auto Click",
   CurrentValue = false,
   Callback = function(bool)
    getgenv().A = bool
    if bool then
        cl()
    end
   end,
})

local Toggle = Tab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().G = bool
     if bool then
         dr()
     end
    end,
 })
 



local Toggle = Tab:CreateToggle({
    Name = "Auto Equipt Best Sword",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().C = bool
     if bool then
         bs()
     end
    end,
 })

 local Toggle = Tab:CreateToggle({
    Name = "Auto Equipt Best Pets",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().F = bool
     if bool then
         bp()
     end
    end,
 })



 local Toggle = Tab:CreateToggle({
    Name = "Auto Accept Quest",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().E = bool
     if bool then
         dq()
     end
    end,
 })
 


 local convertWorld = {
    ["Namek"] = "Sarnek",
    ["Naruto"] = "Ninja Town"

}


local convert = {
    ["Raditz"] = "Radio",
    ["Cell"] = "Imperfect Bug",
    ["Perfect Cell"] = "Perfect Bug",
    ["Freiza"] = "Fruit",
    ["Majin Boo"] = "Bul",
    ["Gaara"] = "Desert Ninja",
    ["Zabuza"] = "Mist Ninja",
    ["Orochimaru"] = "Ninja Snake King",
    ["Obito"] = "Untouchable Ninja",
    ["Madara"] = "God Ninja",
    
}

local Section = Tab:CreateSection("Mobs")


local sw
local Dropdown = Tab:CreateDropdown({
    Name = "Choose World To Attack",
    Options = {"Namek","Naruto"},
    CurrentOption = "--",
    Callback = function(value)
        sw = convertWorld[value]
    end,
})








local sm
local Dropdown = Tab:CreateDropdown({
    Name = "Choose Mob To Attack",
    Options = {"Namek Mobs","↓↓↓↓","Raditz","Cell","Perfect Cell","Freiza","Majin Boo","Naruto Mobs","↓↓↓↓","Gaara","Zabuza","Orochimaru","Obito","Madara"},
    CurrentOption = "--",
    Callback = function(value)
        sm = convert[value]
    end,
})





function KT()
    while B == true do 
        if not getgenv then break end 
        for i,v in pairs(game:GetService("Workspace").EnemyNPCs[sw]:GetDescendants()) do 
            if v.Name == sm then 
                local t = v 
                local tr = v:FindFirstChild("HumanoidRootPart")
                if t ~= nil then 
                    repeat
                        rp.CFrame = tr.CFrame + Vector3.new(4,0,0)
                        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("attackFunc"):FireServer()
                        task.wait(0.01)
                    until t.Parent == nil or not t.Parent:FindFirstChild(t.Name) or B == false
                    task.wait(1.5)              
                    else
                        print("None Alive")
                        break
                end
            end
        end
    end
end



local Toggle = Tab:CreateToggle({
    Name = "Auto Kill Selected",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().B = bool
     if bool then
         KT()
     end
    end,
 })
 






 local Section = Tab:CreateSection("Eggs")

 local convertEgg = {
    ["Namek"] = 24175,
    ["Naruto"] = 28812,
}



local eggPos = {
    ["Namek"] = Vector3.new(-663, 16, 174),
    ["Naruto"] = Vector3.new(-428, 24, 2725)
}


local egg
 local se
 local Dropdown = Tab:CreateDropdown({
     Name = "Choose Egg To Open",
     Options = {"Namek","Naruto"},
     CurrentOption = "--",
     Callback = function(value)
        se = convertEgg[value]
        egg = eggPos[value]
     end,
 })
 

function oe() 
    rp.CFrame = CFrame.new(egg)
    while D == true do 
        if not getgenv then break end 
        local args = {
            [1] = se,
            [2] = "Open_1"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("LBConnection"):WaitForChild("Remotes"):WaitForChild("Egg_Spin"):WaitForChild("Sent"):FireServer(unpack(args))        
        task.wait(0.1)
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Auto Open Chosen Egg",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().D = bool
     if bool then
         oe()
     end
    end,
 })
 






 local Section = Tab:CreateSection("Potions")



 local sp
 local Dropdown = Tab:CreateDropdown({
     Name = "Choose Potion To Use",
     Options = {"Damage","Power","Luck","Coins"},
     CurrentOption = "--",
     Callback = function(value)
        sp = value
     end,
 })
 

function up() 
    while G == true do 
        if not getgenv then break end 
        local args = {[1] = sp}
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UsePotion"):FireServer(unpack(args))        
        task.wait(0.5)
    end
end

local Toggle = Tab:CreateToggle({
    Name = "Auto Use Chosen Potion",
    CurrentValue = false,
    Callback = function(bool)
     getgenv().G = bool
     if bool then
         up()
     end
    end,
 })
 

