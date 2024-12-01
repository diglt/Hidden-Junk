local cloneref = getgenv().cloneref or function(object) return object end
local Players = cloneref(game:GetService("Players"))
local local_player = Players.LocalPlayer
local hotbar = local_player.PlayerGui.BackpackGui.Backpack.Hotbar
local tools = {}

for index, hotbar_tool in hotbar:GetDescendants() do
    if hotbar_tool:IsA("TextLabel") and hotbar_tool.Name == "ToolName" then
        table.insert(tools, hotbar_tool.Text)
    end 
end

for index, tool in tools do 
    local true_tool = local_player.Backpack:FindFirstChild(tool)

    true_tool.Parent = local_player.Character
end
