warn("EXECUTED") -- remove this if u want 

-- // User Configuration \\ -- 
local PutUser = "PLAYERS USERNAME "
local PutKeybind = "E"


































-- // Setup Variables \\ --
getgenv().Runnin = false
AvoidList = {}
OwnedFishes = {}
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- // Functions \\ -- 
function AddToAvoidList()
    for _, item in LocalPlayer.Backpack:GetChildren() do 
        if item.Name == "Bestiary" or item.Name == "Equipment Bag" or string.match(item.Name, "Rod") then 
            table.insert(AvoidList, item)
        end
    end
end

function RefreshTable()
    OwnedFishes = {}  
    for _, item in LocalPlayer.Backpack:GetChildren() do 
        if not table.find(AvoidList, item) then 
            table.insert(OwnedFishes, item)
        end
    end
end

AddToAvoidList()
RefreshTable()

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode[PutKeybind] and not gameProcessedEvent then
        getgenv().Runnin = not getgenv().Runnin
        print("Toggled Runnin to:", getgenv().Runnin)

        if getgenv().Runnin then
            RefreshTable() 
        end
    end
end)


RunService.Heartbeat:Connect(function()
    if getgenv().Runnin then
        local success, errorInfo = pcall(function()
            for index, fish in ipairs(OwnedFishes) do 
                fish.Parent = LocalPlayer.Character
                fireproximityprompt(workspace[PutUser].TradeOffer)
                fish.Parent = workspace[PutUser]
                task.wait()
            end
        end)

        if not success then
            warn("Error occurred:", errorInfo)
        end
    end
end)
