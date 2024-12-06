--[[
    Status: (Potential Return)
]]--


-- // TOGGLES \\ --

getgenv().Toggles = {
    ["AutoClickShake"] = true,
}

-- // Variables \\ -- 

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser") 

function GetCharacter(player)
    return player.Character
end

function EquipRod()
    local Char = GetCharacter(LocalPlayer)
    local BackPack = LocalPlayer.Backpack

    if Char then 
        for _, Item in BackPack:GetChildren() do 
            if string.match(Item.Name, "Rod") then 
                local Rod = Item
                Rod.Parent = Char
            end
        end
    end 
end

function CastRod()
    EquipRod()

    print("Waiting cuz ykwim")
    task.wait(2)

    local LocalChar = GetCharacter(LocalPlayer)
    local Rod = nil

    for _, Item in LocalChar:GetChildren() do 
        if Item:IsA("Tool") and string.match(Item.Name, "Rod") then 
            Rod = Item
        end
    end

    local FishRemote = Rod.events:WaitForChild("cast")

    if FishRemote then 
        FishRemote:FireServer(100, 1)
    end
end

function MainFarm()
    while getgenv().Toggles["AutoClickShake"] do
        local PlayerGui = LocalPlayer.PlayerGui
        
        for _, Inst in PlayerGui:GetChildren() do 
            if Inst:IsA("ScreenGui") and Inst.Name == "shakeui" then 
                local ShakeGUI = Inst
                local safezone = ShakeGUI:WaitForChild("safezone")

                if safezone then 
                    local ShakeButton = ShakeGUI:FindFirstChildOfClass("ImageButton")
                    local ButtonPos = Vector2.new(math.floor(ShakeButton.Position.X), math.floor(ShakeButton.Position.Y))

                    if ButtonPos then 
                        VirtualUser:Button1Down(ButtonPos)
                        task.wait(0.5)
                    end
                end

            elseif Inst:IsA("ScreenGui") and Inst.Name == "reel" then
                local ReelUI = Inst
                local ReelBar = Inst:FindFirstChildOfClass("Frame")
                local PlayerBar, FishBar
                
                for _, Item in ReelUI:GetChildren() do 
                    if Item:IsA("Frame") and Item.Name == "playerbar" then 
                        PlayerBar = Item
                    elseif Item:IsA("Frame") and Item.Name == "fish" then
                        FishBar = Item
                    end
                end

                if PlayerBar and FishBar then
                    local playerBarPosition = PlayerBar.AbsolutePosition
                    local playerBarSize = PlayerBar.AbsoluteSize
                    local fishBarPosition = FishBar.AbsolutePosition
                    local fishBarSize = FishBar.AbsoluteSize

                    local function isFishWithinPlayer()
                        return fishBarPosition.X >= playerBarPosition.X and
                               fishBarPosition.X + fishBarSize.X <= playerBarPosition.X + playerBarSize.X and
                               fishBarPosition.Y >= playerBarPosition.Y and
                               fishBarPosition.Y + fishBarSize.Y <= playerBarPosition.Y + playerBarSize.Y
                    end

                    if not isFishWithinPlayer() then
                        VirtualUser:Button1Down(Vector2.new())
                    else
                        VirtualUser:Button1Up(Vector2.new())
                    end
                end
            end
        end
        task.wait()
    end
end

CastRod()
MainFarm()
