-- Instances

local ScreenGui = Instance.new("ScreenGui")
local TextBox = Instance.new("TextBox")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")

-- Properties

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

TextBox.Parent = ScreenGui
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0115151517, 0, 0.5072698, 0)
TextBox.Size = UDim2.new(0, 348, 0, 95)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Input text to bypass"
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(1,1,1)
TextBox.TextScaled = true
TextBox.TextSize = 14
TextBox.TextWrapped = true

UICorner.Parent = TextBox

TextLabel.Parent = ScreenGui
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0345454551, 0, 0.660743117, 0)
TextLabel.Size = UDim2.new(0, 261, 0, 31)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Credits to pretty boy n.eural"
TextLabel.TextColor3 = Color3.new(0.666667, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true

UICorner_2.Parent = TextLabel

--[[
	Neural Chat Bypasser!
	made by, man himself, n.eural :)
]]


-- Instances
local SpecialCharacters = {
	["A"] = "Α",
	["B"] = "Β",
	["C"] = "Ċ",
	["D"] = "Đ",
	["E"] = "Ē",
	["F"] = "Ƒ",
	["G"] = "Ġ",
	["H"] = "Ĥ",
	["I"] = "Ι",
	["J"] = "Ĵ",
	["K"] = "Ķ",
	["L"] = "Ĺ",
	["M"] = "Μ",
	["N"] = "Ν",
	["O"] = "Ο",
	["P"] = "Ρ",
	["Q"] = "Q",
	["R"] = "Ř",
	["S"] = "Ś",
	["T"] = "Τ",
	["U"] = "Ũ",
	["V"] = "V",
	["W"] = "Ŵ",
	["X"] = "X",
	["Y"] = "Υ",
	["Z"] = "Ζ",
}

TextBox.FocusLost:Connect(function()
	local finaltext = "?" .. TextBox.Text
	local ft2 = string.split(finaltext, "?")
	local PlayerWords = string.upper(ft2[2])

	local bypassedWord = ""
	local result = {}

	for i = 1, #PlayerWords do 
		result[i] = PlayerWords:sub(i,i)
	end

	for i,v in next, result do 
		if SpecialCharacters[v] then 
			bypassedWord = bypassedWord .. SpecialCharacters[v]
		else
			bypassedWord = bypassedWord .. v
		end
	end


	local TextChatService = game:GetService("TextChatService")

	TextChatService.TextChannels.RBXGeneral:SendAsync(bypassedWord)
end)