local TextChatService = game:GetService("TextChatService")
local TeleportService = game:GetService("TeleportService")
local PathfindingService = game:GetService("PathfindingService")

getgenv().Enabled = false
getgenv().tweening = false
getgenv().pathfinding = false
getgenv().IsRandomWalking = false

local BlacklistedPlayers = {"johnny_jsl1", "RobloxBaller077", "Star_knight94"}
local HasRanSendCommand = {}

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local IsFrozen = false
local IsSpinning = false
local Index = 0
local Pattern = "!"
local IsDisabled = false
local IsMimicking
local PlayerMimicking
local WhitelistedPlayer = "jsdhjkawjkfwajk" or lp.Name
local wbhook = "https://discord.com/api/webhooks/1265844535100051477/DTRqdmoSXjzkjHMvCqRJgkXhnr1hyYpNkNg3wudaKCTYfMdUUP54FhOXTohDbdb3TCxD"
local CoolDown



function IsValid(Object, target)
	return Object:IsDescendantOf(target or game)
end

function GetChar(player)
	return player.Character
end

function GetRoot(char)
	return char:FindFirstChild("HumanoidRootPart")
end

function GetHumanoid(char)
	return char:FindFirstChildOfClass("Humanoid")
end

function CallPathfinding(positionStarting, positionEnding, lpHumanoid, ValueToDecideIfWait)
    if IsFrozen then 
        return
    end

    local Path = PathfindingService:CreatePath({
        AgentRadius = 50,
        AgentHeight = 50,
        AgentCanJump = true,
    })

    local PutBehindPlr = positionEnding - Vector3.new(0, 0, -3)

        local success, err = pcall(function()
            Path:ComputeAsync(positionStarting, PutBehindPlr)
        end)

        if success and Path.Status == Enum.PathStatus.Success then 
            local Waypoints = Path:GetWaypoints()

            for _, waypoint in ipairs(Waypoints) do 
                lpHumanoid:MoveTo(waypoint.Position)

                if ValueToDecideIfWait then 
                    lpHumanoid.MoveToFinished:Wait(5)
                end
            end
    elseif err then
        print("error occured...", err)
    end
end

function GetOldCFrame(part)
    if part then 
        return part.CFrame
    end
end

function CheckIfNotLP()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v ~= lp then 
            return v
        end
    end
end


TextChatService.MessageReceived:Connect(function(textChatMessage)
	local Text = textChatMessage.Text
	local TextChannel = textChatMessage.TextChannel
	local PlayerCalling  = tostring(textChatMessage.TextSource)
	local CommandList = {"!enable", "!bring", "!chat <message>", "!credits", "!disable", "!kill", "!dance", "!freeze", "!unfreeze", "!jump", "!sit", "!stalk <player>", "!unstalk", "!unspin", "!cmds"}
    local CommandList2 = {"!howDoesItWork", "!remind", "!randomwalk", "!unrandomwalk", "!publicChat <chat>", "!goto <player>", "!mimic <player>", "!unmimic", "!sendOwnerMsg <message>", "!help <command>", "!fling",}

    local ExplanationTable = {
        ["bring"] = "Brings me to your position!",
        ["stalk"] = "Follows <player>, just type stalk then the players username.",
        ["spin"] = "Spins <speed>",
        ["howDoesItWork"] = "Explains how this script functions.",
        ["chat"] = "Sends the message input straight after the command! Example, chat Hello",
        ["publicChat"] = "Allows for the chat function to be used, in DM's, without showcasing who sent the chat!",
        ["mimic"] = "Copies the chat of the player inputted, example: mimic MyUsername",
        ["fling"] = "Flings me!",
        ["kill"] = "Forces me to reset, why would you do such a thing?",
        ["credits"] = "Gives credits to my creator!",
        ["status"] = "Tells you wether i am ENABLED, or DISABLED!",
        ["freeze"] = "Causes me to be unable to move.",
        ["sendOwnerMsg"] = "Sends a message to a certain channel, that the creator of this script, can read!",
        ["goto"] = "Goes to the inputted players position! Example: goto MyUserName",
        ["remind"] = "Reminds server that ANYONE can access this bot!",
        ["blacklist"] = "If whoevers username was put after this message, cannot run any commands!"
     }

    table.sort(CommandList)
    table.sort(CommandList2)

    if CoolDown then 
        return
    end


	if Text == "!enable" and Enabled == false and IsDisabled == false then
		TextChannel:SendAsync("Globally Enabled! Any player can access...")
		getgenv().Enabled = true
    elseif Text == "!enable" and Enabled == false and IsDisabled then 
        TextChannel:SendAsync("Currently disabled, cannot be enabled.")
        if PlayerCalling == WhitelistedPlayer then 
            getgenv().Enabled = true
        end
    end

	if Text == "!disable" and PlayerCalling == WhitelistedPlayer then 
		TextChannel:SendAsync("Disabled by: (" .. PlayerCalling .. ")")
		task.wait(1)
        IsDisabled = true
        Index = 0
        getgenv().Enabled = false

	elseif Text == "!disable" and PlayerCalling ~= WhitelistedPlayer then
		TextChannel:SendAsync("You (" .. PlayerCalling .. ") Cannot access this command. Only (" .. WhitelistedPlayer .. ") May run this command.")
	end

    if Text == "!status" then 
        if Enabled then 
            TextChannel:SendAsync("I am currently (ENABLED)")
        else
            TextChannel:SendAsync("I am currently (DISABLED)")
        end
    end


	if Enabled and not table.find(BlacklistedPlayers, PlayerCalling) then 

        if string.find(Text, "!help") and not string.find(Text, "!remind") then 
            local CommandToExplain = string.gsub(Text, "!help ", "")
            print(CommandToExplain)

            local CmdInTable = ExplanationTable[CommandToExplain]
            print(CmdInTable)
            TextChannel:SendAsync(CmdInTable)
        end



        local Command = Pattern .. "blacklist"

        if string.find(Text, Command) and PlayerCalling == WhitelistedPlayer and not string.find(Text, "!remind") then
            local PlayerToBlacklist = string.gsub(Text, Command .. " ", "")
            table.insert(BlacklistedPlayers, PlayerToBlacklist)
    
            TextChannel:SendAsync("Player Blacklisted: " .. PlayerToBlacklist)
        end


        if string.find(Text, "!unblacklist") and PlayerCalling == WhitelistedPlayer and not string.find(Text, "!remind") then 
            local UnBlacklistedPlr = string.gsub(Text, "!unblacklist ", "")

            table.remove(BlacklistedPlayers, UnBlacklistedPlr)
            TextChannel:SendAsync("Player: " .. UnBlacklistedPlr .. " Has been Un-Blacklisted")
        end


        if IsMimicking and PlayerCalling == PlayerMimicking then 
            TextChannel:SendAsync(Text)
        end

		if Text == "!cmds" then 
			local StringOfCommands = ""
            local StringOfCommands2 = ""

			for i  = 1, #CommandList do 
				local CurrentCommand = CommandList[i]

				StringOfCommands = StringOfCommands .. CurrentCommand .. ", "
			end
			TextChannel:SendAsync("Here is a list of all the commands! " .. StringOfCommands)
            task.wait(1.25)

            for i2 = 1, #CommandList2 do 
                local CurrentCommand2 = CommandList2[i2]

                StringOfCommands2 = StringOfCommands2 .. CurrentCommand2 .. ", "
            end
            TextChannel:SendAsync(StringOfCommands2)
		end

		if Text == "!rejoin" and PlayerCalling == WhitelistedPlayer then
			TextChannel:SendAsync("Rejoining Server!, most likely Update / Bug Fix!")
			task.wait(1)
			TeleportService:Teleport(game.PlaceId, lp, game.JobId)
        elseif Text == "!rejoin" and PlayerCalling ~= WhitelistedPlayer then
            TextChannel:SendAsync("You (" .. PlayerCalling .. ") Cannot access this command. Only (" .. WhitelistedPlayer .. ") May run this command.")
		end

		if Text == "!sit" then 
			local char = GetChar(lp)
			local humanoid = GetHumanoid(char)

			humanoid.Sit = true
		end

		if Text == "!jump" then
			local char = GetChar(lp)
			local humanoid = GetHumanoid(char)

			humanoid.Jump = true
		end

		if Text == "!freeze" then 
			IsFrozen = true

			TextChannel:SendAsync("Currently Frozen! Brrrr...")
			local char = GetChar(lp)
			local hum = GetHumanoid(char)

			hum.JumpPower = 0
			hum.Walkspeed = 0

			for i,v in pairs(char:GetChildren()) do 
				if v:IsA("Part") or v:IsA("BasePart") then 
					v.Anchored = true
				end
			end
            return IsFrozen
		end

		if Text == "!unfreeze" then 
			IsFrozen = false
			TextChannel:SendAsync("I've been thawed! :D")
			local char = GetChar(lp)
			local hum = GetHumanoid(char)

			hum.JumpPower = 50
			hum.Walkspeed = 16

			for i,v in pairs(char:GetChildren()) do 
				if v:IsA("Part") or v:IsA("BasePart") then 
					v.Anchored = false
				end
			end
            return IsFrozen
		end

		if string.match(Text, "!chat") and not string.match(Text, "!cmds") then 
			local TheSendingMessage = string.gsub(Text, ".chat", "")

			TextChannel:SendAsync(TheSendingMessage)
		end

        if string.match(Text, "!publicChat") and not string.match(Text, "!remind") then 
            local SendinMessage = string.gsub(Text, ".publicChat", "")
            local PublicChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

            PublicChannel:SendAsync(SendinMessage)
        end


		if Text == "!bring" and IsFrozen == false then 
			local plr = Players:FindFirstChild(PlayerCalling)
			local Char = GetChar(plr)
			local Root = GetRoot(Char)

			local lpChar = GetChar(lp)
			local lpRoot = GetRoot(lpChar)

			if lpRoot and Root then
				local TweenCFrame = {
					CFrame = Root.CFrame
				}

				local Tween = TweenService:Create(lpRoot, TweenInfo.new(1), TweenCFrame)
				TextChannel:SendAsync("Being brought to... " .. PlayerCalling)
				Tween:Play()
            elseif Text == ".bring" and IsFrozen == true then
                TextChannel:SendAsync("I'm currently frozen. Type !unfreeze to release me!")
			end
		end


        if Text == "!fling" then 
            TextChannel:SendAsync("Currently going into orbit :O")

            local char = GetChar(lp)
            local root = GetRoot(char)
            local oldCF = GetOldCFrame(root)
            local hum = GetHumanoid(char)

            root.AssemblyAngularVelocity = Vector3.new(900, 900, 900)
            root.AssemblyLinearVelocity = Vector3.new(900, 900, 900)

            task.wait(2)
            hum.Health = 0 
        end

        if Text == "!dance" then
            TextChannel:SendAsync("Currently dancing B)")
            TextChannel:SendAsync("/e dance")
        end

        if Text == "!credits" then 
            TextChannel:SendAsync("This is a work in progress script. I was made by n.eural / impact :)")
        end


        if string.match(Text, "!spin") and not string.match(Text, ".cmds") then 
            local spinRotation = string.gsub(Text, ".spin", "")
            local ToNumber = tonumber(spinRotation)
            IsSpinning = true

            while IsSpinning do
                local Char = GetChar(lp)
                local Root = GetRoot(Char)
                local oldRootX, oldrootZ = Root.Orientation.X, Root.Orientation.Z

                if Root then 
                    Root.Orientation = Root.Orientation + Vector3.new(oldRootX, ToNumber, oldrootZ)
                    task.wait()
                else
                    IsSpinning = false
                end
            end
        end


        if string.match(Text, "!unspin") and not string.match(Text, ".cmds") then
            IsSpinning = false

            return IsSpinning
        end

        if Text == "!troll" then 
            TextChannel:SendAsync('"bro idk how to use math.random()" - professional / folixx what a great scripter right?')
        end

        if Text == "!kill" then 
            local Root = GetRoot(GetChar(lp))
            local hum = GetHumanoid(GetChar(lp))
            local oldCF = GetOldCFrame(Root)

            hum.Health = 0

            lp.CharacterAdded:Connect(function(character)
                task.wait(1)
                local root = GetRoot(character)
                local TweenCFrame = {
                    CFrame = oldCF
                }

                local Tween = TweenService:Create(root, TweenInfo.new(1), TweenCFrame)
                Tween:Play()
            end)
        end


        if string.find(Text, "!stalk") and not string.find(Text, "!cmds") then
            local Person 
            local FromPlrService
            Person = string.gsub(Text, "!stalk ", "")
            getgenv().pathfinding = true

            if Person ~= "random" then 
                FromPlrService = Players:FindFirstChild(Person) 

                TextChannel:SendAsync("Currently Stalking: " .. tostring(FromPlrService))

                while pathfinding do
                    local char = GetChar(lp)
                    local root = GetRoot(char)
                    local hum = GetHumanoid(char)
    
                    local theirchar = GetChar(FromPlrService)
                    local theirroot = GetRoot(theirchar)
    
                    if root and theirroot and IsFrozen == false then
                        CallPathfinding(root.Position, theirroot.Position, hum, false) 
                    elseif IsFrozen then
                        task.wait(1)
                        getgenv().pathfinding = false
                        TextChannel:SendAsync("Current frozen and unable to move, thaw me using !unfreeze")
                    end
                end


           elseif Person == "random" then
                FromPlrService = CheckIfNotLP()

                TextChannel:SendAsync("Currently Stalking: " .. tostring(FromPlrService))

                while pathfinding do
                    local char = GetChar(lp)
                    local root = GetRoot(char)
                    local hum = GetHumanoid(char)
    
                    local theirchar = GetChar(FromPlrService)
                    local theirroot = GetRoot(theirchar)
    
                    if root and theirroot and IsFrozen == false then
                        CallPathfinding(root.Position, theirroot.Position, hum, false) 
                    elseif IsFrozen then
                        task.wait(1)
                        getgenv().pathfinding = false
                        TextChannel:SendAsync("Current frozen and unable to move, thaw me using !unfreeze")
                    end
                end
            end
        end


        if Text == "!unstalk" then 
            getgenv().pathfinding = false
            TextChannel:SendAsync("Successfully called off the stalk.")
            return pathfinding
        end

        if Text == "!howDoesItWork" then 
            TextChannel:SendAsync("This is a client, running an emulator, which is connected to an executor. The executor ran a script which allows ME to see and identify commands in chat, which i appropriately index and run! :)")
        end

        if Text == "!remind" then 
            TextChannel:SendAsync("EVERY PLAYER IN THIS SERVER CAN ACCESS COMMANDS! TYPE !cmds TO SEE")
        end

        if Text == "!bang" then 
            TextChannel:SendAsync("You have been blacklisted from running commands.")

            table.insert(BlacklistedPlayers, tostring(PlayerCalling))
        end

        if Text == "!randomwalk" then 
            getgenv().IsRandomWalking = true

            while IsRandomWalking do
                local char = GetChar(lp)
                local Root = GetRoot(char)
                local Human = GetHumanoid(char)

                local pos1 = Root.Position
                local pos2 = Vector3.new(math.random(-15, 15), 0 ,math.random(-15, 15))


                CallPathfinding(pos1, pos2, Human, true)
                task.wait() 
            end
        end

        if Text == "!unrandomwalk" then 
            getgenv().IsRandomWalking = false
            TextChannel:SendAsync("Stopped randomly walking...")
        end

        if string.find(Text, "!goto") and not string.find(Text, "!remind") and IsFrozen == false then 
            local Stringdplr = string.gsub(Text, "!goto ", "")

            local plr = Players:FindFirstChild(Stringdplr)
			local Char = GetChar(plr)
			local Root = GetRoot(Char)

			local lpChar = GetChar(lp)
			local lpRoot = GetRoot(lpChar)

			if lpRoot and Root then
				local TweenCFrame = {
					CFrame = Root.CFrame
				}

				local Tween = TweenService:Create(lpRoot, TweenInfo.new(1), TweenCFrame)
				TextChannel:SendAsync("Going towards: " .. Stringdplr)
				Tween:Play()

            elseif string.find(Text, "!goto") and not string.find(Text, "!remind") and IsFrozen == true then
                TextChannel:SendAsync("I'm currently frozen. Type !unfreeze to release me!")
			end
        end

        if string.find(Text, "!mimic") and not string.find(Text, "!remind") then
            IsMimicking = true

            PlayerMimicking = string.gsub(Text, "!mimic ", "")
            TextChannel:SendAsync("Mimic enabled on: " .. PlayerMimicking)
        end

        if Text == "!unmimic" then 
            IsMimicking = false

            TextChannel:SendAsync("Mimic has been disabled.")
        end

        if string.find(Text, "!sendOwnerMsg") and not string.find(Text, "!remind") and not table.find(HasRanSendCommand, PlayerCalling) then 
            local message = string.gsub(Text, "!sendOwnerMsg ", "")
            local WebData = {
                ["content"] = "You got a new message! (**" .. message .. "**) From Player: **" .. tostring(PlayerCalling) .. "**"
            }
            
            local HTTPServ = game:GetService("HttpService")
            
            local Encoded = HTTPServ:JSONEncode(WebData)
            
            
            local Headerz = {
                ["content-type"] = "application/json"
            }
            
            local Request = request({
                Url = wbhook,
                Body = Encoded,
                Method = "POST",
                Headers = Headerz
            })

            if Request.Success then 
                TextChannel:SendAsync("Successfully sent request!")

                table.insert(HasRanSendCommand, PlayerCalling)
            end

        elseif string.find(Text, "!sendOwnerMsg") and not string.find(Text, "!remind") and table.find(HasRanSendCommand, PlayerCalling)  then
            print("Player found inside called table, cannot run again :(")
        end




    elseif Enabled and table.find(BlacklistedPlayers, PlayerCalling) then
        if string.find(Text, CommandList) or string.find(Text, CommandList2) then 
            TextChannel:SendAsync("You (" .. PlayerCalling .. ") are blacklisted from running any commands.")
        end
	end

    repeat
        task.wait(1)
        CoolDown = false
    until CoolDown == false
end)


while task.wait(8) do
	if Enabled == false and Index ~= 2 then 
		game.TextChatService.TextChannels.RBXGeneral:SendAsync("Hello There! To get started type (!enable) a list of commands can be seen by typing (!cmds)")
		Index = Index + 1
	end
end

