
-- // Enviroment and locals \\ --

-- Tables --
getgenv().Settings = {
    ["PART_TO_KILL"] = nil, -- string
    ["COLOUR_OF_FOV"] = nil, -- color3
    ["COLOUR_OF_FOV2"] = nil, -- color3
    ["FOV_RADIUS"] = nil, -- number
    ["FOV_VISIBLE"] = nil,  -- bool
    ["CHOSE_WALL_CHECK"] = nil, --bool
    ["CHOSE_TEAM_CHECK"] = nil, --bool
    ["ENABLE_AIMBOT"] = nil, --bool
}

getgenv().DebugSettings = {
    ["HAS_RAN_LINK"] = false,
}

PotentialBodyParts = {}


-- // Functions | Logic \\ --

function SearchThrough()
    for _, player in game:GetService("Players"):GetChildren() do 
        for _, part in player.Character:GetChildren() do 
            if part:IsA("Part") or part:IsA("BasePart") then
                table.insert(PotentialBodyParts, tostring(part.Name))
            end
        end
        break
    end
    table.sort(PotentialBodyParts, function(a, b)
        return a:lower() < b:lower()
    end)
end
SearchThrough()


-- // library \\ --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Neural Network",
    LoadingTitle = "present day, present time!",
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
   Content = "add all here.",
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


-- // In Library Functions \\ --


function ClarifyLoadstringGibberish(Value)
    if Value == true then 
        local PassedChecks = 0
        local FailedChecks = 0 

        print("BEGINNING TESTS!")

        local Success, Failure = pcall(function()

            for Checkie, CheckValue in getgenv().Settings do 
                if CheckValue ~= nil and Checkie ~= "ENABLE_AIMBOT" and Checkie ~= "FOV_VISIBLE" then 
                    print("CHECK FOR: " .. tostring(Checkie) .. " WAS SUCCESSFUL WITH: (" .. tostring(CheckValue) .. ")")
                    PassedChecks += 1
                else
                    FailedChecks += 1
                    print("Failed check: " .. Checkie .. "with value: (" .. CheckValue .. ")")
                end
            end  
        end)

        if PassedChecks >= 5 and Success then 
            if getgenv().DebugSettings["HAS_RAN_LINK"] == false then 
                getgenv().Settings["ENABLE_AIMBOT"] = true
                getgenv().DebugSettings["HAS_RAN_LINK"] = true

                loadstring(game:HttpGet("https://pastebin.com/raw/TKwn8cB1"))()
            elseif getgenv().DebugSettings["HAS_RAN_LINK"] and getgenv().Settings["ENABLE_AIMBOT"] == false then
                getgenv().Settings["ENABLE_AIMBOT"] = true
                getgenv().Settings["FOV_VISIBLE"] = true
            end
        end

    else
        if getgenv().DebugSettings["HAS_RAN_LINK"] then
            getgenv().Settings["FOV_VISIBLE"] = false
            getgenv().Settings["ENABLE_AIMBOT"] = false
            
            warn("SHOULD HAVE DISABLED BY NOW")
        end
    end
end


-- // Main Tabs \\ --
 local Tab = Window:CreateTab("Aimbot Functions",4483362458)
 local ESPTab = Window:CreateTab("ESP Functions",4483362458)
 local Tab1 = Window:CreateTab("Other",4483362458) 
 local Section = Tab1:CreateSection("Other Features")

 local Button = Tab1:CreateButton({
    Name = "Destroy Gui",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Paragraph = Tab1:CreateParagraph({Title = "Credits:", Content = "Neural / digit - Script Creator \nSirius - Rayfield UI Library"})


local Section = Tab:CreateSection("Main")

local Dropdown = Tab:CreateDropdown({
    Name = "Choose Bodypart",
    Options = PotentialBodyParts,
    CurrentOption = {"Head"},
    MultipleOptions = false,
    Callback = function(CurrentOption)
        getgenv().Settings["PART_TO_KILL"] = table.unpack(CurrentOption)
    end,
 })

local Input = Tab:CreateInput({
    Name = "Input your FOV size",
    PlaceholderText = "0",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        getgenv().Settings["FOV_RADIUS"] = tonumber(Text)
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Toggle Team-Check",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Settings["CHOSE_TEAM_CHECK"] = Value 
    end,
 })

local Toggle = Tab:CreateToggle({
    Name = "Toggle Wall-Check",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().Settings["CHOSE_WALL_CHECK"] = Value 
    end,
 })

local Section = Tab:CreateSection("Colours")

local ColorPicker = Tab:CreateColorPicker({
    Name = "Choose Inner FOV Colour",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        getgenv().Settings["COLOUR_OF_FOV"] = Value
    end
})

local ColorPicker = Tab:CreateColorPicker({
    Name = "Choose Outer FOV Colour",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        getgenv().Settings["COLOUR_OF_FOV2"] = Value
    end
})

local Section = Tab:CreateSection("Aimbot")

local Toggle = Tab:CreateToggle({
    Name = "Toggle Aimbot",
    CurrentValue = false,
    Callback = function(Value)
        ClarifyLoadstringGibberish(Value)
    end
})

local Paragraph = Tab:CreateParagraph({Title = "Requirements:", Content = "You are required to: Choose a body part, Radius size, Inner / Outer Colour."})

local Section = ESPTab:CreateSection("Main")

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Healthbars",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Stud Distance",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Player Usernames",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Tracers",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Bullet Tracers",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local Section = ESPTab:CreateSection("Colours")

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle Rainbow ESP",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})

local ColorPicker = ESPTab:CreateColorPicker({
    Name = "Choose Inner ESP Box Colour",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        return
    end
})

local ColorPicker = ESPTab:CreateColorPicker({
    Name = "Choose Outer ESP Box Colour",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        return
    end
})

local Section = ESPTab:CreateSection("ESP")

local Toggle = ESPTab:CreateToggle({
    Name = "Toggle ESP",
    CurrentValue = false,
    Callback = function(Value)
        return
    end
})
