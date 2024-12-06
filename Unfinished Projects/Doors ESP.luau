--[[
  Status: (Maybe return? idk i hate working with esp / aimbot. Too much vectors and math.)
  Credits:
    Neural - Everything
]]--

local cloneref = getgenv().cloneref or function(object) return object end

local camera = cloneref(workspace.CurrentCamera)
local runservice = cloneref(game:GetService("RunService"))
local objects_tbl = {}
local lines_tbl = {}
local square_tbl = {}
local titles_tbl = {}
local names = {}

function continue_scanning()
    function find_objects()
        for _, obj in pairs(workspace:GetDescendants()) do 
            if string.find(obj.Name, "Obtain") and obj:IsA("Model") then
                local hitboxPart = obj:FindFirstChild("Hitbox")
                if hitboxPart then
                    objects_tbl[obj.Name] = hitboxPart

                    if not lines_tbl[obj.Name] then 
                        local line = Drawing.new("Line")
                        line.Thickness = 1
                        line.Visible = true
                        line.Color = Color3.new(0, 1, 0)
                        lines_tbl[obj.Name] = line

                        local square = Drawing.new("Square")
                        square.Visible = true
                        square.Transparency = 1
                        square.Color = Color3.new(0, 1, 0)
                        square.Thickness = 1
                        square.Size = Vector2.new(50, 50) -- Fixed size
                        square.Filled = false
                        square_tbl[obj.Name] = square

                        local studs = Drawing.new("Text")
                        studs.Visible = true
                        studs.Transparency = 1
                        studs.Color3 = Color3.new(0, 1, 0)
                        studs.Outline = true
                        studs.OutlineColor = Color3.new(1, 1, 1)
                        studs.Center = false
                        studs.Size = 18
                        titles_tbl[obj.Name] = studs

                        local name = Drawing.new("Text")
                        name.Visible = true
                        name.Transparency = 1
                        name.Color3 = Color3.new(0, 1, 0)
                        name.Outline = true
                        name.OutlineColor = Color3.new(1, 1, 1)
                        name.Center = false
                        name.Text = string.gsub(obj.Name, "Obtain", "")
                        name.Size = 18
                        names[obj.Name] = name
                    end
                end

            elseif obj.Name == "GoldPile" and obj:IsA("Model") then
                local hitboxPart = obj.PrimaryPart

                if hitboxPart then
                    objects_tbl[obj.Name] = hitboxPart

                    if not lines_tbl[obj.Name] then 
                        local line = Drawing.new("Line")
                        line.Thickness = 1
                        line.Visible = true
                        line.Color = Color3.fromRGB(255, 213, 0)
                        lines_tbl[obj.Name] = line

                        local square = Drawing.new("Square")
                        square.Visible = true
                        square.Transparency = 1
                        square.Color = Color3.fromRGB(255, 213, 0)
                        square.Thickness = 1
                        square.Size = Vector2.new(50, 50) -- Fixed size
                        square.Filled = false
                        square_tbl[obj.Name] = square
                    end
                end
            end
        end
    end

    function update_line()
        find_objects()

        for index, object in pairs(objects_tbl) do 
            local hitboxPos, onScreen = camera:WorldToViewportPoint(object.Position)
            local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
            local line = lines_tbl[index]

            if line then 
                line.From = screenCenter
                line.To = Vector2.new(hitboxPos.X, hitboxPos.Y)

                line.Visible = onScreen

            end

            if square_tbl[index] then
                local square = square_tbl[index]

                square.Position = Vector2.new(hitboxPos.X - square.Size.X / 2, hitboxPos.Y - square.Size.Y / 2)
                square.Visible = true
            end

            if square_tbl[index] and titles_tbl[index] and names[index] then
                local square = square_tbl[index]
                local studs = titles_tbl[index]
                local name = names[index]

                name.Position = Vector2.new(square.Position.X + 5, square.Position.Y)
                studs.Position = Vector2.new(square.Position.X + 5, square.Position.Y + 20)

                local distance = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - object.Position).Magnitude)
                studs.Text = "[" .. tostring(distance) .. " ]"
            end
        end
    end
    runservice.RenderStepped:Connect(update_line)
end

continue_scanning()
