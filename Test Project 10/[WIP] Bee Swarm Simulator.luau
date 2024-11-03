-- // Enviroment Checks \\ -- 


if getgenv().cloneref then 
    print("HAS cloneref!")
else
    getgenv().cloneref = function(obj) return obj end
end


-- // Variables and Tables \\ --

local Services = {
    ["Workspace"] = cloneref(workspace),
    ["ReplicatedStorage"] = cloneref(game:GetService("ReplicatedStorage")),
    ["TweenService"] = cloneref(game:GetService("TweenService")),
    ["VirtualUser"] = cloneref(game:GetService("VirtualUser"))
}

local CommonPlaces = {
    ["Events"] = cloneref(Services["ReplicatedStorage"]:FindFirstChild("Events"))
}

local RemotesTable = {
    ["UseTool"] = cloneref(CommonPlaces["Events"]:WaitForChild("ToolCollect")),
    ["ClaimHive"] = cloneref(CommonPlaces["Events"]:WaitForChild("ClaimHive")),
}

local Variables = {
    ["LocalPlayer"] = cloneref(game:GetService("Players").LocalPlayer),
    ["Honeycombs"] = Services["Workspace"]:FindFirstChild("Honeycombs"),
    ["HiveDeco"] = Services["Workspace"]:FindFirstChild("HiveDeco"),
    ["FlowerZones"] = Services["Workspace"]:FindFirstChild("FlowerZones"),
    ["NPCFolder"] = Services["Workspace"]:FindFirstChild("NPCs"),
    ["ShopFolder"] = Services["Workspace"]:FindFirstChild("Shops"),
    ["Collectibles"] = Services["Workspace"]:FindFirstChild("Collectibles")
}

local PotentialHivePositions = {
    ["1"] = CFrame.new(-3, 7, 332), 
    ["2"] = CFrame.new(-40, 7, 330), 
    ["3"] = CFrame.new(-77, 7, 330), 
    ["4"] = CFrame.new(-113, 7, 330), 
    ["5"] = CFrame.new(-149, 7, 331), 
    ["6"] = CFrame.new(-186, 6, 331)
}

local FlowerZones = {}
local NPCS = {}
local Shops = {}

-- // Main Function Logic \\ --

function GetCharacter(player)
    return player.Character
end

function GetRoot(char)
    return char.HumanoidRootPart
end


function IsValidMember(object, target)
    if object:IsDescendantOf(target or workspace) then 
        return true
    end
end

function InputFlowerZones()
    for Index, Zone in Variables["FlowerZones"]:GetChildren() do 
        table.insert(FlowerZones, Zone)
    end
end

function InputNPCS()
    for Index, Zone in Variables["NPCFolder"]:GetChildren() do 
        table.insert(NPCS, Zone)
    end
end

function InputShops()
    for Index, Zone in Variables["ShopFolder"]:GetChildren() do 
        table.insert(Shops, Zone)
    end

    table.insert(Shops, Services["Workspace"]:FindFirstChild("BearShop1"))
end

InputNPCS()
InputFlowerZones()
InputShops()

function FindRoyalJellyCount()
    local EggMenuPos = Vector2.new(25, 62)

    Services["VirtualUser"]:CaptureController()
    Services["VirtualUser"]:ClickButton1(EggMenuPos)

    task.wait(1)

    local FirstCheck = Variables["LocalPlayer"].PlayerGui.ScreenGui.Menus.Children.Eggs.Content

    for a,b in FirstCheck.Content.EggRows:GetDescendants() do 
        if b:IsA("TextLabel") and b.Name == "TypeName" then 
            if b.Text == "Royal Jelly" then 
                b.Parent.Name = "Royal Jelly Interface"

                local Count = string.gsub(tostring(b.Parent.EggSlot:FindFirstChild("Count").Text), "x", "")
                print(Count)
                return Count
            end
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
                                print("RAN REMOTE!")
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
    local CurrentJellies = FindRoyalJellyCount()

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
            print("CREATING TWEEN...")
            local PlaceInformation = {
                CFrame = RoyalJelly.CFrame,
            }
        
            local Tween = Services["TweenService"]:Create(LocalRoot, TweenInfo.new(3), PlaceInformation)
    
            local success, errorInfo = pcall(function()
                Tween:Play()
                Tween.Completed:Wait()
            end)

            if success and CurrentJellies == CurrentJellies + 1 then 
                print("CLAIMED!")

                table.remove(AvailableJellies, Index)
                CurrentJellies = FindRoyalJellyCount()
            else
                warn("ERROR OCCURED: " .. errorInfo)
                break
            end
        end
        task.wait(1)
    end
end



ClaimEmptyHive()
task.wait(3)
ClaimAllRoyalJellys()
