-- // Enviroment Checks \\ -- 
if getgenv().cloneref then 
    print("Cloneref was found!")
else
    getgenv().cloneref = function(obj) return obj end
end

local Services = {
    ["Workspace"] = cloneref(workspace),
    ["ReplicatedStorage"] = cloneref(game:GetService("ReplicatedStorage")),
    ["TweenService"] = cloneref(game:GetService("TweenService")),
    ["TeleportService"] = cloneref(game:GetService("TeleportService")),
    ["RunService"] = cloneref(game:GetService("RunService")),
    ["HttpService"] = cloneref(game:GetService("HttpService")),
}

if game.PlaceId ~= 1537690962 then 
    Services["TeleportService"]:Teleport(1537690962)
end

-- // Variables and Tables \\ --

getgenv().Toggles = {
    ["KeepUsingTool"] = false,
    ["AutoConvert"] = false,
}


local CommonPlaces = {
    ["Events"] = cloneref(Services["ReplicatedStorage"]:FindFirstChild("Events"))
}

local RemotesTable = {
    ["UseTool"] = cloneref(CommonPlaces["Events"]:WaitForChild("ToolCollect")), -- no args
    ["ClaimHive"] = cloneref(CommonPlaces["Events"]:WaitForChild("ClaimHive")), -- 1 argument (hive number)
    ["PlayerHiveCommand"] = cloneref(CommonPlaces["Events"]:WaitForChild("PlayerHiveCommand")), -- 1 argument
}

local Variables = {
    ["LocalPlayer"] = cloneref(game:GetService("Players").LocalPlayer),
    ["Honeycombs"] = Services["Workspace"]:FindFirstChild("Honeycombs"),
    ["HiveDeco"] = Services["Workspace"]:FindFirstChild("HiveDeco"),
    ["FlowerZones"] = Services["Workspace"]:FindFirstChild("FlowerZones"),
    ["NPCFolder"] = Services["Workspace"]:FindFirstChild("NPCs"),
    ["ShopFolder"] = Services["Workspace"]:FindFirstChild("Shops"),
    ["Collectibles"] = Services["Workspace"]:FindFirstChild("Collectibles"),
}

local PotentialHivePositions = {
    ["1"] = CFrame.new(-3, 7, 332), 
    ["2"] = CFrame.new(-40, 7, 330), 
    ["3"] = CFrame.new(-77, 7, 330), 
    ["4"] = CFrame.new(-113, 7, 330), 
    ["5"] = CFrame.new(-149, 7, 331), 
    ["6"] = CFrame.new(-186, 6, 331)
}

local FlowerZonesTable = {}
local FlowerZonesStringTable = {}
local NPCQuests = {}
local NPCQuestsStringTable = {}
local Shops = {}
local ShopsStringTable = {}
local AvailableItems = {}


-- // Main Function Logic \\ --

function GetCharacter(player)
    return player.Character
end

function GetRoot(char)
    return char.HumanoidRootPart
end

function GetHumanoid(char)
    return char.Humanoid or char:FindFirstChildOfClass("Humanoid")
end


function IsValidMember(object, target)
    if object:IsDescendantOf(target or workspace) then 
        return true
    end
end

function InputFlowerZones()
    for Index, Zone in Variables["FlowerZones"]:GetChildren() do 
        table.insert(FlowerZonesTable, Zone)
    end
end

function InputNPCS()
    for Index, Zone in Variables["NPCFolder"]:GetChildren() do 
        table.insert(NPCQuests, Zone)
    end
end

function InputShops()
    for Index, Zone in Variables["ShopFolder"]:GetChildren() do 
        table.insert(Shops, Zone)
    end

    table.insert(Shops, Services["Workspace"]:FindFirstChild("BearShop1"))
end

function FromInstanceToString(tbl, newtbl)
    for a,b in tbl do 
        table.insert(newtbl, tostring(b))
    end
    table.sort(newtbl, function(a, b)
        return a:lower() < b:lower()
    end)
end

task.spawn(function()
    InputNPCS()
    InputFlowerZones()
    InputShops()
    FromInstanceToString(FlowerZonesTable, FlowerZonesStringTable)
    FromInstanceToString(NPCQuests, NPCQuestsStringTable)
    FromInstanceToString(Shops, ShopsStringTable)
end)



function CreateTween(PlacePosition, Speed)
    local LocalCharacter = GetCharacter(Variables["LocalPlayer"]) 
    local LocalRoot = GetRoot(LocalCharacter)
    LocalRoot.Anchored = true

    if IsValidMember(LocalCharacter) and IsValidMember(LocalRoot) then 
        local part = Instance.new("Part", Variables["Workspace"])
        part.Size = Vector3.new(5, 2, 5)
        part.Anchored = true
        part.CanCollide = false
        part.Position = LocalRoot.Position - Vector3.new(0, LocalRoot.Size.Y / 2 + part.Size.Y / 2 + 1, 0)
        
        local FinalPos = {Position = PlacePosition + Vector3.new(0, 10, 0)}
        local TweenInfo = TweenInfo.new((Speed or 1), Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local Tween = Services["TweenService"]:Create(part, TweenInfo, FinalPos)
        
        Tween:Play()
        
        local Connection

        Connection = Services["RunService"].RenderStepped:Connect(function()
            LocalRoot.CFrame = part.CFrame * CFrame.new(0, LocalRoot.Size.Y / 2 + part.Size.Y / 2, 0)
        end)
        
        Tween.Completed:Connect(function()
            part:Destroy()
            Connection:Disconnect()
            LocalRoot.Anchored = false
        end)        
    end
end




function AutoUseTool()
    while getgenv().Toggles["KeepUsingTool"] do 
        RemotesTable["UseTool"]:FireServer()
        task.wait(0.1)
    end
end

function FindOurHive()
    for Index, Item in Variables["Honeycombs"]:GetDescendants() do 
        if Item:IsA("ObjectValue") and Item.Name == "Owner" and tostring(Item.Value) == Variables["LocalPlayer"].Name then 
            local MyHive = string.gsub(tostring(Item.Parent), "Hive", "")
            return MyHive
        end
    end
end



function AutoConvert()
    while getgenv().Toggles["AutoConvert"] do
        local OtherVariables = {
            ["Pollen"] = Variables["LocalPlayer"].CoreStats.Pollen.Value,
            ["Honey"] = Variables["LocalPlayer"].CoreStats.Honey.Value,
            ["Capacity"] = Variables["LocalPlayer"].CoreStats.Capacity.Value,
        }

        if OtherVariables["Pollen"] >= OtherVariables["Capacity"] then 
            local MyHive = FindOurHive()       

            CreateTween(PotentialHivePositions[MyHive])
            RemotesTable["PlayerHiveCommand"]:FireServer("ToggleHoneyMaking")

            repeat
                task.wait(0.5)
            until OtherVariables["Pollen"] <= 5 or getgenv().Toggles["AutoConvert"] == false
        else
            task.wait(1)
        end
    end
end



function ClaimEmptyHive()
    local ClaimableHive

    if Variables["Honeycombs"] ~= nil then 
        for Index, Item in Variables["Honeycombs"]:GetDescendants() do 
            if Item:IsA("ObjectValue") and Item.Name == "Owner" and Item.Value == nil then 
                ClaimableHive = string.gsub(tostring(Item.Parent), "Hive", "")
                print("HIVE: (" .. ClaimableHive .. ") IS AVAILABLE!")
                
                for Index, HiveItem in Variables["HiveDeco"]:GetDescendants() do 
                    local HiveParentName = string.gsub(tostring(HiveItem.Parent.Parent), "StickerCanvas", "")

                    if HiveItem:IsA("Part") and HiveItem.Name == "NegateCircle" and HiveParentName == ClaimableHive then 
                        local LocalCharacter = GetCharacter(Variables["LocalPlayer"]) 
                        local LocalRoot = GetRoot(LocalCharacter)

                        if IsValidMember(LocalCharacter) and IsValidMember(LocalRoot) then 
                            local PlaceInformation = {
                                CFrame = PotentialHivePositions[ClaimableHive],
                            }
                        
                            local Tween = Services["TweenService"]:Create(LocalRoot, TweenInfo.new(1), PlaceInformation)
                    
                            local success, errorInfo = pcall(function()
                                Tween:Play()
                                Tween.Completed:Wait()
                            end)

                            if success then
                                RemotesTable["ClaimHive"]:FireServer(tonumber(ClaimableHive))
                            end
                        end
                    end
                end
                break
            end
        end
    end
end



function ClaimAllRoyalJellys()
    local AvailableJellies = {}

    for Index, Collectable in Variables["Collectibles"]:GetDescendants() do 
        if Collectable:IsA("Decal") and Collectable.Texture == "rbxassetid://1471882621" then 
            local Jelly = Collectable.Parent

            table.insert(AvailableJellies, Jelly)
        end
    end

    for Index, RoyalJelly in AvailableJellies do 
        local LocalChar = GetCharacter(Variables["LocalPlayer"])
        local LocalRoot =  GetRoot(LocalChar)

        if IsValidMember(RoyalJelly) and IsValidMember(LocalRoot) and RoyalJelly:FindFirstChildOfClass("ParticleEmitter") then 
            local PlaceInformation = {
                CFrame = RoyalJelly.CFrame,
            }
        
            local Tween = Services["TweenService"]:Create(LocalRoot, TweenInfo.new(3), PlaceInformation)
    
            local success, errorInfo = pcall(function()
                Tween:Play()
                Tween.Completed:Wait()
            end)

            if success then 
                print("CLAIMED!")

                table.remove(AvailableJellies, Index)
            else
                warn("ERROR OCCURED: " .. errorInfo)
                break
            end
        end
        task.wait(1)
    end
end


function GotoField(field)
    field = Variables["FlowerZones"]:FindFirstChild(field)

    CreateTween(field.Position, 1)
end


function GotoShop(EpicShop)
    EpicShop = Variables["ShopFolder"]:FindFirstChild(EpicShop)

    CreateTween(EpicShop.Position, 8)
end


function GotoNPC(BestNpc)
    BestNpc = Variables["NPCFolder"]:FindFirstChild(BestNpc)

    CreateTween(BestNpc.Position, 8)
end

-- // Library \\ --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Neural Network",
    LoadingTitle = "play fear and hunger termina",
    LoadingSubtitle = "by neural",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, 
       FileName = "Neural Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "wk2xtM8H", 
       RememberJoins = true 
    },
 })


-- // Main Tabs \\ --
local Tab = Window:CreateTab("Main Functions",4483362458)
local Tab2 = Window:CreateTab("Menu Functions",4483362458)
local Tab1 = Window:CreateTab("Other",4483362458) 

local Section = Tab1:CreateSection("Other Features")

local Button = Tab1:CreateButton({
   Name = "Destroy Gui",
   Callback = function()
       Rayfield:Destroy()
   end,
})

local Paragraph = Tab1:CreateParagraph({Title = "Credits:", Content = "Neural / digit - Script Creator \nSirius - Rayfield UI Library"})


local Section = Tab:CreateSection("Toggles")

local Toggle = Tab:CreateToggle({
    Name = "Toggle Auto-Tool",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles["KeepUsingTool"] = Value

        AutoUseTool()
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Toggle Auto-Convert",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Toggles["AutoConvert"] = Value

        AutoConvert()
    end,
})

local Section = Tab:CreateSection("Dropdowns")


local Dropdown = Tab:CreateDropdown({
   Name = "Choose Field To Farm",
   Options = FlowerZonesStringTable,
   CurrentOption = {"Bamboo Field"},
   MultipleOptions = false,
   Callback = function(CurrentOption)
       GotoField(unpack(CurrentOption))
   end,
})

local Dropdown = Tab:CreateDropdown({
    Name = "Select NPC To Talk To: ",
    Options = NPCQuestsStringTable,
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Callback = function(Option)
        GotoNPC(unpack(Option))
    end,
 })


local Dropdown = Tab:CreateDropdown({
    Name = "Select Shop To Go To: ",
    Options = ShopsStringTable,
    CurrentOption = {"Bearshop1"},
    MultipleOptions = false,
    Callback = function(Option)
        GotoShop(unpack(Option))
    end,
})




local Section = Tab1:CreateSection("Main")

local Dropdown = Tab2:CreateDropdown({
    Name = "Select Egg To Use: ",
    Options = {"Option 1","Option 2"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Callback = function(Option)

    end,
})

local Dropdown = Tab2:CreateDropdown({
    Name = "Select Item To Use: ",
    Options = {"Option 1","Option 2"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Callback = function(Option)
        return nil
    end,
})

local Section = Tab:CreateSection("Buttons")

local Button = Tab:CreateButton({
    Name = "Claim all royal jellies",
    Callback = function()
        ClaimAllRoyalJellys()
    end,
 })

local Button = Tab:CreateButton({
    Name = "Claim Hive",
    Callback = function()
        ClaimEmptyHive()
    end,
})
