local IsRainbow = getgenv().Settings["IsRainbow"]


local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

function GetChar(playor)
    return playor.Character
end

function GetRoot(char)
    return char:FindFirstChild("HumanoidRootPart")
end

function GetHead(char)
    return char:FindFirstChild("Head")
end

function GetHumanoid(char)
    return char:FindFirstChildOfClass("Humanoid")
end


local hue = 0
local speed = 0.25 


function HSVToRGB(h, s, v)
    local r, g, b
    local i = math.floor(h * 6)
    local f = h * 6 - i
    local p = v * (1 - s)
    local q = v * (1 - f * s)
    local t = v * (1 - (1 - f) * s)

    if i % 6 == 0 then
        r, g, b = v, t, p
    elseif i % 6 == 1 then
        r, g, b = q, v, p
    elseif i % 6 == 2 then
        r, g, b = p, v, t
    elseif i % 6 == 3 then
        r, g, b = p, q, v
    elseif i % 6 == 4 then
        r, g, b = t, p, v
    elseif i % 6 == 5 then
        r, g, b = v, p, q
    end

    return r * 255, g * 255, b * 255
end


local function CreateEsp(player)
    if player.Team ~= lp.Team then 
        local boxOutline = Drawing.new("Square")
        boxOutline.Visible = true
        boxOutline.Filled = false
        boxOutline.Thickness = 1.5

        local box = Drawing.new("Square")
        box.Visible = true
        box.Filled = false
        box.Thickness = 1.5
        box.Color = Color3.new(0,0,0)

        local HealthDisplay = Drawing.new("Line")
        HealthDisplay.Visible = true
        HealthDisplay.Transparency = 0.75
        HealthDisplay.Thickness = 1
        HealthDisplay.Color = Color3.new(0, 1, 0)

        local TextLabel = Drawing.new("Text")
        TextLabel.Visible = true
        TextLabel.Transparency = 1
        TextLabel.Color3 = Color3.new(1,1,1)

        local PlayerName = tostring(player.Name)
        TextLabel.Text = PlayerName
        TextLabel.Outline = true
        TextLabel.OutlineColor = Color3.new(0,0,0)
        TextLabel.Center = true

        local StudLabel = Drawing.new("Text")
        StudLabel.Visible = true
        StudLabel.Transparency = 1
        StudLabel.Color3 = Color3.new(1,1,1)
        StudLabel.Outline = true
        StudLabel.OutlineColor = Color3.new(0,0,0)
        StudLabel.Center = true

        local Line = Drawing.new("Line")
        Line.Visible = true
        Line.Transparency = 0.75
        Line.Thickness = 2
        Line.Color = Color3.new(1,0,0)


        local function UpdatePosition()
            if IsRainbow then 
                local r, g, b = HSVToRGB(hue, 1, 1) 
                boxOutline.Color = Color3.fromRGB(r, g, b)
                Line.Color = Color3.fromRGB(r, g, b)
                    
                hue = hue + speed * task.wait() 
                if hue >= 1 then
                    hue = 0 
                end
            else
                boxOutline.Color = Color3.new(1, 0, 0)
            end

            local char = GetChar(player)

            if char then 
                local Mychar = GetChar(lp)
                local Root = GetRoot(char)
                local MyRoot = GetRoot(Mychar)
                local Head = GetHead(char)

                if Root and Head then 
                    local ROOTPOS, ONSCREEN = Camera:WorldToViewportPoint(Root.Position)
                    local HEADPOS, ONSCREEN2 = Camera:WorldToViewportPoint(Head.Position)
                    local LEGPOS, ONSCREEN3 = Camera:WorldToViewportPoint(Root.Position - Vector3.new(0, 3, 0))

                    if ONSCREEN and ONSCREEN2 and ONSCREEN3 then 
                        local topLeft = Vector2.new(HEADPOS.X - (1500 / ROOTPOS.Z) / 2 , HEADPOS.Y - 7)
                        local bottomRight = Vector2.new(HEADPOS.X + (1500 / ROOTPOS.Z) / 2, LEGPOS.Y + 7)

                            boxOutline.Size = Vector2.new(bottomRight.X - topLeft.X, (bottomRight.Y - topLeft.Y))
                            boxOutline.Position = topLeft

                            box.Size = Vector2.new((bottomRight.X - topLeft.X) + 3.25, (bottomRight.Y - topLeft.Y) + 3)
                            box.Position = Vector2.new(topLeft.X - 2, topLeft.Y - 2)

                            TextLabel.Position = Vector2.new(box.Position.X + 20, box.Position.Y + 20)
                            StudLabel.Position = Vector2.new(TextLabel.Position.X, TextLabel.Position.Y + 10)

                    
                            local Distance = math.floor((MyRoot.Position - Root.Position).Magnitude)
                            StudLabel.Text = tostring(Distance) .. " Studs away"

                            local ToOneValue = Vector2.new(HEADPOS.X, HEADPOS.Y - 5)
                            Line.From = Vector2.new(960, 0)
                            Line.To = ToOneValue

                            HealthDisplay.From = Vector2.new(topLeft.X - 3, bottomRight.Y)
                            HealthDisplay.To = Vector2.new(topLeft.X - 3, topLeft.Y) 

                        boxOutline.Visible = true 
                        box.Visible = true
                        TextLabel.Visible = true
                        StudLabel.Visible = true
                        Line.Visible = true
                        HealthDisplay.Visible = true
                    else
                        boxOutline.Visible = false
                        box.Visible = false
                        TextLabel.Visible = false
                        StudLabel.Visible = false
                        Line.Visible = false
                        HealthDisplay.Visible = false
                    end
                else
                    boxOutline.Visible = false
                    box.Visible = false
                    TextLabel.Visible = false
                    StudLabel.Visible = false
                    Line.Visible = false
                    HealthDisplay.Visible = false
                end
            else
                boxOutline.Visible = false
                box.Visible = false
                TextLabel.Visible = false
                StudLabel.Visible = false
                Line.Visible = false
                HealthDisplay.Visible = false
            end
        end

        local BoxRunning = RunService.RenderStepped:Connect(UpdatePosition)

        player.AncestryChanged:Connect(function()
            if not player:IsDescendantOf(Players) then 
                BoxRunning:Disconnect()
                boxOutline:Destroy()
                box:Destroy()
                TextLabel:Destroy()
                StudLabel:Destroy()
                Line:Destroy()
                HealthDisplay:Destroy()
            end
        end)
    end
end


for _, plr in Players:GetPlayers() do 
    if plr ~= lp and plr.Team ~= lp.Team then 
        CreateEsp(plr)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= lp and player.Team ~= lp then 
        CreateEsp(player)
    end
end)
