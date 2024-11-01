for Z,H in getgenv() do 
    rconsoleprint(Z.H)
end

local Bodypart = getgenv().Settings["PART_TO_KILL"] or "Head"
local RadiusColour = getgenv().Settings["COLOUR_OF_FOV"] or Color3.new(1,1,1)
local Radius = getgenv().Settings["FOV_RADIUS"] or 100
local Wallcheck = getgenv().Settings["CHOSE_WALL_CHECK"] or true
local Teamcheck = getgenv().Settings["CHOSE_TEAM_CHECK"] or true
local Enabled = getgenv().Settings["ENABLE_AIMBOT"] or true

error("Running...")

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TeamService = game:GetService("Teams")
local HasTeams = false

if #TeamService:GetChildren() > 1 then 
    HasTeams = true
else
    HasTeams = false
end

local lp = Players.LocalPlayer
local Mouse = lp:GetMouse() or game.Players.LocalPlayer:GetMouse()

local FOV = Drawing.new("Circle")
FOV.Filled = false
FOV.Transparency = 1
FOV.Color = Color3.new(1, 0, 0)
FOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOV.Radius = Radius
FOV.Visible = true
FOV.Thickness = 2.5

local FOVoutline = Drawing.new("Circle")
FOVoutline.Filled = false
FOVoutline.Transparency = 1
FOVoutline.Color = Color3.new(0, 0, 0)
FOVoutline.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVoutline.Radius = FOV.Radius + 1
FOVoutline.Visible = true
FOVoutline.Thickness = 3

function GetChar(plr)
    return plr.Character
end


function GetHead(char)
    return char:FindFirstChild(Bodypart)
end

local frameCounter = 0
local raycastInterval = 5 

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist


function IsVisible(player)
    local char = GetChar(player)
    if char and not Wallcheck then
        local head = GetHead(char)
        if head then
            local headPosition, isOnScreen = Camera:WorldToViewportPoint(head.Position)
            if isOnScreen then
                local myChar = GetChar(lp)
                local screenWorldToRay = Camera:ViewportPointToRay(headPosition.X, headPosition.Y)
                raycastParams.FilterDescendantsInstances = {myChar}
                local rayResult = workspace:Raycast(screenWorldToRay.Origin, screenWorldToRay.Direction * 500, raycastParams)
                if rayResult and rayResult.Instance:IsDescendantOf(char) then
                    return true
                end
            end
        end
    end
    return false
end


function CheckTeam(plr)
    if plr ~= lp then 
        if plr and plr.Team ~= lp.Team and not Teamcheck then 
            return true
        end
    end
end

function FindClosestPlayer()
    local closestPlayer = nil
    local maxDist = math.huge

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lp then
            local char = GetChar(player)
            if char then
                local head = GetHead(char)
                if head then
                    local headPosition, isOnScreen = Camera:WorldToViewportPoint(head.Position)
                    if isOnScreen then
                        local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(headPosition.X, headPosition.Y)).Magnitude
                        if distance <= maxDist then
                            maxDist = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
    end
    return closestPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        Enabled = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then 
        Enabled = false
    end
end)


RunService.RenderStepped:Connect(function()
    if Enabled then
        if HasTeams then 
            local closestPlayer = FindClosestPlayer()
            local Check = CheckTeam(closestPlayer)
            if Check then 
                frameCounter = frameCounter + 1
                if frameCounter >= raycastInterval and closestPlayer then
                    frameCounter = 0 
                    if IsVisible(closestPlayer) then
                        local char = GetChar(closestPlayer)
                        local head = GetHead(char)
                        if head then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                        end
                    end
                end
            end
        else
            local closestPlayer = FindClosestPlayer()

            frameCounter = frameCounter + 1
            if frameCounter >= raycastInterval and closestPlayer then
                frameCounter = 0 
                if IsVisible(closestPlayer) then
                    local char = GetChar(closestPlayer)
                    local head = GetHead(char)
                    if head then
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                    end
                end
            end
        end
    end
end)
error("Finished!")

