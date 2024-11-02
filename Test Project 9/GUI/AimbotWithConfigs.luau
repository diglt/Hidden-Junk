local ScriptConfigs = {
    ["Bodypart"] =  getgenv().Settings["PART_TO_KILL"] or "Head",
    ["RadiusColour"] =  getgenv().Settings["COLOUR_OF_FOV"],
    ["RadiusColour2"] =  getgenv().Settings["COLOUR_OF_FOV2"],
    ["RadiusSize"] =  getgenv().Settings["FOV_RADIUS"] or 200,
    ["FOVisible"] = getgenv().Settings["FOV_VISIBLE"] or true,
    ["Wallcheck"] =  getgenv().Settings["CHOSE_WALL_CHECK"] or true,
    ["Teamcheck"] =  getgenv().Settings["CHOSE_TEAM_CHECK"] or true,
    ["AimbotToggle"] = getgenv().Settings["ENABLE_AIMBOT"],
    ["Manage_Control"] = false,
}

getgenv().ScriptConfigs = ScriptConfigs


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
FOV.Color = ScriptConfigs["RadiusColour"]
FOV.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOV.Radius = ScriptConfigs["RadiusSize"]
FOV.Visible = ScriptConfigs["FOVisible"]
FOV.Thickness = 2.5

local FOVoutline = Drawing.new("Circle")
FOVoutline.Filled = false
FOVoutline.Transparency = 1
FOVoutline.Color = Color3.new(1,1,1)
FOVoutline.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVoutline.Radius = FOV.Radius + 1
FOVoutline.Visible = ScriptConfigs["FOV_VISIBLE"]
FOVoutline.Thickness = 3

function GetChar(plr)
    return plr.Character
end


function GetHead(char)
    return char:FindFirstChild(ScriptConfigs["Bodypart"])
end

function RefreshConfigs()
    ScriptConfigs["Bodypart"] = getgenv().Settings["PART_TO_KILL"]
    ScriptConfigs["RadiusColour"] =  getgenv().Settings["COLOUR_OF_FOV"]
    ScriptConfigs["RadiusColour2"] =  getgenv().Settings["COLOUR_OF_FOV2"]
    ScriptConfigs["RadiusSize"] =  getgenv().Settings["FOV_RADIUS"]
    ScriptConfigs["FOVisible"] = getgenv().Settings["FOV_VISIBLE"]
    ScriptConfigs["Wallcheck"] =  getgenv().Settings["CHOSE_WALL_CHECK"]
    ScriptConfigs["Teamcheck"] =  getgenv().Settings["CHOSE_TEAM_CHECK"]
    ScriptConfigs["AimbotToggle"] = getgenv().Settings["ENABLE_AIMBOT"]
end

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist


function IsVisible(player)
    local char = GetChar(player)
    if char then
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
        if plr and plr.Team ~= lp.Team then 
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
    RefreshConfigs()

    if input.UserInputType == Enum.UserInputType.MouseButton2 and ScriptConfigs["AimbotToggle"] ~= false then 
        ScriptConfigs["Manage_Control"] = true
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    RefreshConfigs()

    if input.UserInputType == Enum.UserInputType.MouseButton2 and ScriptConfigs["AimbotToggle"] ~= false then 
        ScriptConfigs["Manage_Control"] = false
    end
end)


RunService.RenderStepped:Connect(function()
    RefreshConfigs()

    FOV.Visible = ScriptConfigs["FOVisible"]
    FOVoutline.Visible = ScriptConfigs["FOV_VISIBLE"]

    if ScriptConfigs["AimbotToggle"] ~= nil and ScriptConfigs["AimbotToggle"] == true then
        if ScriptConfigs["Manage_Control"] == true then 
            if not HasTeams then 
                local closestPlayer = FindClosestPlayer()

                if ScriptConfigs["Wallcheck"] then 
                    if IsVisible(closestPlayer) then
                        local char = GetChar(closestPlayer)
                        local head = GetHead(char)

                        if head then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                        end
                    end
                else
                    local char = GetChar(closestPlayer)
                    local head = GetHead(char)

                    if head then
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                    end
                end

            elseif HasTeams then
                if ScriptConfigs["Wallcheck"] == true and ScriptConfigs["Teamcheck"] == true then 
                    local closestPlayer = FindClosestPlayer()
                    local Check = CheckTeam(closestPlayer)

                    if Check then 
                        if IsVisible(closestPlayer) then
                            local char = GetChar(closestPlayer)
                            local head = GetHead(char)

                            if head then
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                            end
                        end
                    end
                end


                elseif ScriptConfigs["Wallcheck"] == true and not ScriptConfigs["Teamcheck"] then
                    local closestPlayer = FindClosestPlayer()

                    if IsVisible(closestPlayer) then
                        local char = GetChar(closestPlayer)
                        local head = GetHead(char)
                        
                        if head then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                        end
                    end
                end


                elseif not ScriptConfigs["Wallcheck"] and ScriptConfigs["Teamcheck"] then
                    local closestPlayer = FindClosestPlayer()
                    local Check = CheckTeam(closestPlayer)

                    if Check then 
                        local char = GetChar(closestPlayer)
                        local head = GetHead(char)
                        if head then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                        end
                    end


                elseif not ScriptConfigs["Wallcheck"] and not ScriptConfigs["Teamcheck"] then
                    local closestPlayer = FindClosestPlayer()
                        local char = GetChar(closestPlayer)
                        local head = GetHead(char)

                        if head then
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
                        end
                    end
                end
end)
