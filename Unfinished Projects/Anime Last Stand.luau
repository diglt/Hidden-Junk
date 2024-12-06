--[[
    Status: (Potential Return)
]]--

getgenv().Toggle = false
getgenv().Debug = false

local lp = game.Players.LocalPlayer

local maps = {
    [1] = "Desert Village",
    [2] = "Water Park",
    [3] = "Hollow Dimension",
    [4] = "Planet Nemak",
    [5] = "Star Mansion",
    [6] = "Super Hero City",
    [7] = "Hero Association",
    [8] = "Snowy Domain",
    [9] = "Infested City",
    [10] = "Lost Castle",
    [11] = "Ruined City",
}

function GetChar(player)
    return player.Character or player.CharacterAdded:Wait()
end

function GetRoot(char)
    return char:FindFirstChild("HumanoidRootPart")
end

function RunMapRemote(map, act, difficulty)
    local StoryTeleporterFolder = workspace.TeleporterFolder:FindFirstChild("Story")

    for i,v in pairs(StoryTeleporterFolder:GetDescendants()) do 
        if v:IsA("Part") and v:FindFirstChildOfClass("TouchTransmitter") then 
            local Char = GetChar(lp)
            local Root = GetRoot(Char)
            local Remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Teleporter"):WaitForChild("MapSelect")
            local StartRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Teleporter"):WaitForChild("Interact")
            
            firetouchinterest(Root, v, 0)
            task.wait()
            firetouchinterest(Root, v, 1)

            local args = {
                [1] = "Ready",
                [2] = map,
                [3] = act,
                [4] = nil
            }

            if difficulty == "Normal" then
                args[4] = "Normal"
            else
                args[4] = "Nightmare"

                Remote:InvokeServer(unpack(args))
                task.wait(2)
                StartRemote:FireServer("Skip")
            end
        end
    end
end


function ConvertKtoThousand(UrSplitString)
    local tointCash
    if UrSplitString:match("%a") == "k" then 
         tointCash = tonumber(UrSplitString:match("%d")) * 1000
    else
        tointCash = tonumber(UrSplitString:match("%d")) * 100
    end
    return tointCash
end

function DeleteAnnoyingErrors()
    local ErrorFolder = lp.PlayerGui.MessageUI:FindFirstChild("ErrorHolder")

    for i,v in pairs(ErrorFolder:GetChildren()) do 
        if v:IsA("TextLabel") and v.Name == "3" then 
            v:Destroy()
        end
    end
end

function RunDebug(check)
    local DebugTable = {
        upgrade = "locate upgrade UI",
        streng = "handle string split",
        cash = "afford / find cash",
        upgradeval = "locate upgrade value",
        spend = "Upgrade the certain unit"
    }


    if getgenv().Debug == true then 
        print("Success in ".. DebugTable[check])
    end
end


function PurchaseUpgrade()
    local Cash = game.Players.LocalPlayer.Cash.Value
    local TowersFolder = game.Workspace:FindFirstChild("Towers")
    local UpgradeRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Upgrade")

    while getgenv().Toggle == true do 
        local UpgradeGui = lp.PlayerGui:FindFirstChild("Upgrade")
        if UpgradeGui ~= nil and UpgradeGui:IsDescendantOf(lp.PlayerGui) then 
            RunDebug("upgrade")

            for i,v in pairs(lp.PlayerGui:GetDescendants()) do 
                if v:IsA("TextLabel") then 
                    if v.Parent and v.Parent.Name == "Upgrade" and v.Name == "Value" then 
                        RunDebug("upgradeval")

                        local price = v.Text 

                        local UnwantedPart = string.split(price, "$")
                        local StringPrice = UnwantedPart[2]

                            if UnwantedPart ~= nil and StringPrice and StringPrice.Text ~= "" and StringPrice ~= nil and StringPrice then
                            RunDebug("streng")
                                
                            local NewCashValue = ConvertKtoThousand(StringPrice)
                            local UnitName

                                if NewCashValue ~= nil and NewCashValue <= Cash then 
                                    RunDebug("cash")

                                    local GreatGreatGrandma = v.Parent.Parent.Parent
                                    for i,Unit in pairs(GreatGreatGrandma:GetChildren()) do 
                                        if Unit:IsA("ObjectValue") then 
                                            UnitName = Unit.Value
                                        end
                                    end

                                    if UnitName then 
                                        for i,Tower in pairs(TowersFolder:GetChildren()) do 
                                            if Tower.Name == tostring(UnitName) then 

                                                UpgradeRemote:InvokeServer(Tower)
                                                RunDebug("spend")
                                                DeleteAnnoyingErrors()

                                                task.wait()
                                            end
                                        end
                                    end
                                end
                        else
                            return 
                        end
                    end
                end
            end
        end
        task.wait()
    end
end


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "example1",
    LoadingTitle = "wip eeeee",
    LoadingSubtitle = "by neural",
 })


 local Tab1 = Window:CreateTab("Main", 4483362458)
 local Tab2 = Window:CreateTab("Misc Features", 4483362458)
 local Section = Tab1:CreateSection("Main Features")
 local Section = Tab2:CreateSection("Misc Features")

 local DestroyGui = Tab2:CreateButton({
    Name = "Click to destroy the GUI",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local DisableToggles = Tab1:CreateButton({
    Name = "Click to disable all current toggles",
    Callback = function()
        getgenv().Toggle = false
    end,
 })


 local Toggle = Tab1:CreateToggle({
    Name = "Toggle Auto-Upgrade (OPEN A UNITS UI BEFORE ENABLING)",
    CurrentValue = false,
    Callback = function()
        getgenv().Toggle = true
        PurchaseUpgrade()
    end,
 })

 local Section = Tab1:CreateSection("Lobby Features")

 local selectedmap 
 local MapDropdown = Tab1:CreateDropdown({
    Name = "Map Selection",
    Options = {maps[1],maps[2],maps[3],maps[4],maps[5],maps[6],maps[7],maps[8],maps[9],maps[10],maps[11]},
    CurrentOption = {"-"},
    MultipleOptions = false,
    Callback = function(map)
        selectedmap = map
    end,
 })

 local selectedact 
 local ActDropdown = Tab1:CreateDropdown({
    Name = "Act Selection",
    Options = {1,2,3,4,5,6},
    CurrentOption = {"-"},
    MultipleOptions = false,
    Callback = function(act)
        for i,v in next, act do 
            selectedact = v
        end
    end,
 })

 local selectedmode
 local DiffDropdown = Tab1:CreateDropdown({
    Name = "Select Difficulty",
    Options = {"Normal", "Nightmare"},
    CurrentOption = {"-"},
    MultipleOptions = false,
    Callback = function(difficulty)
        selectedmode = tostring(difficulty)
    end,
 })

 local StartMapButton = Tab1:CreateButton({
    Name = "Click to start map...",
    Callback = function()
        if selectedmap and selectedact and selectedmode then 
            RunMapRemote(selectedmap, selectedact, selectedmode)
        else
            Rayfield:Notify({
                Title = "Error Occured!",
                Content = "You didn't select either a Map or Act or Difficulty, please do so.",
                Duration = 5,
                Image = 4483362458,
             })             
        end
    end,
 })
