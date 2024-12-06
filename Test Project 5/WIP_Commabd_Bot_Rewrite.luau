--[[
    Neurals Command Bot!
    Version: 0 (Pre-Release)
    Status: Work In Progress
    Working On: Ask Command
    Credits:
        Neural - everything
]]--

-- // enviroment setup \\ -- 
if getgenv().enabled then
    error("Already Executed!")
else
    getgenv().send_messages = true
    getgenv().global_allow = false

    local env = getgenv()
    local wait = task.wait
    local sfind = string.find
    local tfind = table.find
    local gsub = string.gsub
    local spawn = task.spawn
    local delay = task.delay
    local insert = table.insert
    local remove = table.remove
    local request = env.request or request or http_request
    local cloneref = cloneref or getgenv().cloneref or function(object) return object end
    local webhook = nil -- add ur own webhook here if u want to impliment logs / send_owner_message command
    local api_key = "" -- add ur own API key, for what language model u want the "ask" command to generate from

    if env and cloneref then
        -- // Servicies \\ -- 
        local Players = cloneref(game:GetService("Players"))
        local HttpService = cloneref(game:GetService("HttpService"))
        local TweenService = cloneref(game:GetService("TweenService"))
        local TextChatService = cloneref(game:GetService("TextChatService"))
        local TeleportService = cloneref(game:GetService("TeleportService"))
        local PathfindingService = cloneref(game:GetService("PathfindingService"))

        -- // variables \\ -- 
        env.enabled = false
        env.chat_sent = ""
        env.txtchannel = nil
        env.playersent = nil
        env.is_mimicing = false
        env.is_stalking = false
        env.is_spinning = false
        
        local recent_chat_sent = ""
        local prefix = "!"
        local cooldown = 1

        local player_frozen
        local player_stalking
        local player_mimicking

        local localplayer = Players.LocalPlayer
        local owner_player = localplayer.Name

        local send_msg = function(msg, textchannel)
            if not textchannel then textchannel = "RBXGeneral" end
            if sfind(recent_chat_sent, "#") then 
                TextChatService.TextChannels[textchannel]:SendAsync("Last Text Filtered! Please wait...")
                wait(2)
                TextChatService.TextChannels[textchannel]:SendAsync(msg)
            else
                TextChatService.TextChannels[textchannel]:SendAsync(msg)
            end
        end

        -- // tables \\ -- 
        local commands = {}
        local commands_sent = {}
        local check_chat_logs = {}
        local blacklisted_players = {}
        local whitelisted_players = {owner_player}
        local ran_send_owner_cmd = {}

        setmetatable(whitelisted_players, {
            __newindex = function(t,k,v)
                if tfind(blacklisted_players, k) then
                    return nil
                else
                    rawset(t, k, v)
                end
            end,
        })

        -- // settings functionality \\ --

        if not send_messages then
            SendAsync = function()
                return nil
            end
        end
    
        if global_allow then
            for a,b in Players:GetPlayers() do 
                table.insert(whitelisted_players, b)
            end
        end

        -- // command inf \\ -- 
        local start_time = tick()

        local cmd_info = {
            ["ask"] = "(ask <question>) Sends a request to the internet to answer your question!",
            ["blacklist"] = "(OWNER ONLY) (blacklist <player>) Makes the player chosen unable to access commands.",
            ["bring"] = "Bring me to your character!",
            ["chat"] = "Forces the bot to send a chat!",
            ["checkbypassers"] = "Checks chat logs to see if anyone may be bypassing! (unreliable)",
            ["checkwhitelist"] = "Displays all whitelisted players!",
            ["clearchat"] = "Clears chat!",
            ["cmds"] = "Displays a list of commands!",
            ["credits"] = "Displays the credits of the script!",
            ["dance"] = "(dance<number>) Allows you to make me dance randomly or your choice of dance!",
            ["disable"] = "(OWNER ONLY) BOOLVALUE: Disables bot",
            ["enable"] = "BOOLVALUE: Enables bot",
            ["fling"] = "Flings my character!",
            ["freeze"] = "BOOLVALUE: Freezes bot! to unfreeze type: unfreeze",
            ["goto"] = "(goto <player>) Sends me to player!",
            ["help"] = "(help <command>) Displays help about certain commands!",
            ["jump"] = "Forces bot to jump!",
            ["kill"] = "Kills the character!",
            ["listchannels"] = "Lists channels available for chat command!",
            ["mimic"] = "BOOLVALUE: (mimic <player>) Copies the chat of the player!",
            ["prefix"] = "(prefix <character>) Changes the prefix for running commands!",
            ["rejoin"] = "(OWNER ONLY) Rejoins the game!",
            ["roast"] = "(roast <player>) Sends a random roast about the player!",
            ["remind"] = "Reminds players of how to execute commands!",
            ["sit"] = "Forces bot to sit!",
            ["stalk"] = "BOOLVALUE: (stalk <player>) Follows the player where ever they go... ;)",
            ["status"] = "Tells you wether i am Enabled or Disabled!",
            ["spin"] = "BOOLVALUE: (spin<number>) Spins me right round, right round :D",
            ["unfreeze"] = "BOOLVALUE: Unfreezes bot! to freeze type: freeze",
            ["unmimic"] = "BOOLVALUE: Stops the mimic.",
            ["unstalk"] = "BOOLVALUE: Stops stalking the selected player!",
            ["unspin"] = "BOOLVALUE: Stops spinning.",
            ["whitelist"] = "(OWNER ONLY) (whitelist <player>) Allows owner to set access to commands!"
        }

        local default_cmds = {"dance", "jump", "sit", "kill", "remind"}

        local channels = {
            ["general"] = "RBXGeneral",
            ["current"] = txtchannel
        }

        local info_channels = {
            ["general"] = "The global channel, (everyone can see)",
            ["current"] = "The current channel, (private / global)"
        }

        

        -- // function setup \\ --
        local function return_char(plr)
            return plr.Character or plr.CharacterAdded:wait()
        end

        local function return_root(char)
            return char.HumanoidRootPart or char.PrimaryPart
        end

        local function return_humanoid(char)
            return char.Humanoid or char:FindFirstChildOfClass("Humanoid")
        end

        local function lp_char()
            return return_char(localplayer)
        end

        local function lp_root()
            local char = return_char(localplayer)
            return return_root(char)
        end

        local function lp_hum()
            local char = return_char(localplayer)
            return return_humanoid(char)
        end

        local function addcmd(name, command)
            commands[name] = command
        end

        local function ret_gsb(cmd, pattern)
            return gsub(chat_sent, cmd, pattern)
        end

        local function create_tween(start, endpoint, speed)
            pcall(function()
                if not player_frozen then 
                    local tween_CFrame = {CFrame = endpoint}
                    local tween_info = TweenInfo.new(speed)

                    local tween = TweenService:Create(start, tween_info, tween_CFrame)
                    tween:Play()
                end
            end)
        end

        local function create_pathfind(ending, humanoid)
            if not player_frozen then
                local try_path, fuckederror = pcall(function()
                    local Path = PathfindingService:CreatePath({
                        AgentRadius = 50,
                        AgentHeight = 50,
                        AgentCanJump = true,
                    })
                    local lp_root = lp_root()

                    local PutBehindPlr = ending - Vector3.new(0, 0, -3)
                    
                    local success, err = pcall(function()
                        Path:ComputeAsync(lp_root.Position, PutBehindPlr)
                    end)

                    if success and Path.Status == Enum.PathStatus.Success then 
                        local Waypoints = Path:GetWaypoints()
            
                        for _, waypoint in ipairs(Waypoints) do 
                            humanoid:MoveTo(waypoint.Position)
                        end
                    else
                        print("error occured...", err)
                    end
                end)

                if try_path then
                    print("Success!")
                else
                    error("ZERO'D GRONK: ".. fuckederror)
                end
            end
        end

        local function string_to_player(string)
            for _, player in pairs(Players:GetPlayers()) do 
                if player ~= localplayer then
                    if sfind(player.Name, string) or sfind(player.DisplayName, string) then
                        return player
                    end
                end
            end
        end

        --------------------------------------------------------------------------------------

        addcmd("enable", function()
            if not env.enabled then 
                enabled = true
                send_msg("Successfully enabled commands!")
            else
                send_msg("Already Enabled!")
            end
        end)

        addcmd("disable", function()
            if player_sent == owner_player then 
                enabled = false
                send_msg("Successfully disabled commands!")
            end
        end)

        addcmd("sit" , function()
            local lp_hum = lp_hum()

            lp_hum.Sit = true
        end)

        addcmd("jump", function()
            local lp_hum = lp_hum()

            lp_hum.Jump = true
        end)

        addcmd("freeze", function()
            local lp_root = lp_root()
            local lp_hum = lp_hum()

            lp_hum.WalkSpeed = 0
            lp_root.Anchored = true
            send_msg("You froze me! I'm unable to move :(")
        end)

        addcmd("unfreeze", function()
            local lp_root = lp_root()
            local lp_hum = lp_hum()

            lp_hum.WalkSpeed = 16
            lp_root.Anchored = false
            send_msg("I'm free! And able to move :D")
        end)

        addcmd("dance", function()
            local better = ret_gsb(prefix.."dance", "")
            if rawlen(better) <= 0 then send_msg("/e dance")
            else
                send_msg("/e dance" .. tostring(better))
            end
        end)

        addcmd("cmds", function()
            local long_list = ""
            local longer_list = ""
        
            for cmd_name, _ in pairs(cmd_info) do
                if string.len(long_list) < 150 then 
                    long_list = long_list .. cmd_name .. ",".. "\n"
                else
                    longer_list = longer_list .. cmd_name .. ",".. "\n"
                end
            end
        
            send_msg("Here's a list of commands:\n" .. long_list)
            send_msg("\n"..longer_list)
        end)

        addcmd("help", function()
            for cmd, n in commands do
                if cmd ~= "help" and sfind(chat_sent,  cmd) then
                    local need_help = cmd_info[cmd]

                    send_msg(need_help)
                end
            end
        end)

        addcmd("rejoin", function()
            if player_sent == owner_player then 
                TeleportService:Teleport(game.PlaceId)
            end
        end)

        addcmd("whitelist", function()
            if player_sent == owner_player then
                local cleared_name = gsub(chat_sent, prefix.."whitelist ", "")
                local cleared_player = string_to_player(cleared_name)

                insert(whitelisted_players, tostring(cleared_player))
                send_msg("Successfully whitelisted: " .. tostring(cleared_player))
            end
        end)

        addcmd("blacklist", function()
            if player_sent == owner_player then
                local cleared_name = gsub(chat_sent, prefix.."blacklist ", "")
                local cleared_player = string_to_player(cleared_name)
                
                pcall(function()
                    insert(blacklisted_players, tostring(cleared_name))
                    remove(whitelisted_players, tostring(cleared_name))
                end)

                send_msg("Successfully blacklisted: " .. tostring(cleared_name))
            end
        end)


        addcmd("kill", function()
            local old_root = lp_root()
            local lp_hum = lp_hum()

            local oldpos = old_root.CFrame

            if lp_hum then
                lp_hum.Health = 0
                
                localplayer.CharacterAdded:Connect(function()
                    wait(1)
                    local lp_root = lp_root()

                    create_tween(lp_root, oldpos, 3)
                end)
            end
        end)

        addcmd("credits", function()
            send_msg("All credits go to: n.eural / newline_neural!")
        end)

        addcmd("remind", function()
            if not sfind(recent_chat_sent, "Access") then 
                send_msg("Access a command by typing "..prefix.. " then the command.")
            end
        end)

        addcmd("clearchat", function()
            send_msg(". \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n .")
        end)


        addcmd("stalk", function()
            player_stalking = gsub(chat_sent,prefix.."stalk ", "")

            for _, player in pairs(Players:GetPlayers()) do 
                if player ~= localplayer then
                    if player_stalking ~= nil and sfind(player.Name, player_stalking) or sfind(player.DisplayName, player_stalking) then
                        send_msg("Currently Stalking: ".. tostring(player))
                        is_stalking = true

                        while is_stalking do
                            wait()
                            pcall(function()
                                local lp_hum = lp_hum()
                                local their_root = return_root(return_char(player))

                                create_pathfind(their_root.Position, lp_hum)
                                print("done pathfinding!")
                            end)
                        end
                    end
                end
            end
        end)


        addcmd("unstalk", function()
            if is_stalking then
                is_stalking = false
                player_stalking = nil
            end
        end)

        addcmd("mimic", function()
            player_mimicking = gsub(chat_sent, prefix.."mimic ", "")
            local cleared_player = string_to_player(player_mimicking)

            if cleared_player then
                is_mimicing = true

                player_mimicking = tostring(cleared_player)

                send_msg("Beginning to mimic: " .. player_mimicking)
            end
        end)

        addcmd("unmimic", function()
            if is_mimicing and player_mimicking then
                player_mimicking = nil
                is_mimicing = false
                send_msg("Successfully stopped mimicing!")
            end
        end)

        addcmd("prefix", function()
            prefix = gsub(chat_sent, prefix.."prefix ", "")
        end)

        addcmd("spin", function()
            local spin_amount = ret_gsb(prefix.."spin", "") or gsub(chat_sent, prefix.."spin", "")
            local tonumb = tonumber(spin_amount)

            while is_spinning do
                local lp_root = lp_root()
                local old_root_X, old_root_Z = lp_root.Orientation.X, lp_root.Orientation.Z

                spawn(function()
                    lp_root.Orientation = lp_root.Orientation + Vector3.new(old_root_X, tonumb, old_root_Z)
                    wait()
                end)
            end
        end)

        addcmd("unspin", function()
            if is_spinning then
                is_spinning = false
            end
        end)

        addcmd("checkbypassers", function()
            local supported = {
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", 
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", 
                "`", "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "]", "{", "}", "\\", "|", ";", ":", "'", "\"", ",", "<", ".", ">", "/", "?", " ", "",
            }

            local caught = {}

            for log, plr in pairs(check_chat_logs) do
                local chat = log
                local player = plr
                
                local has_unsupported = false
                for i = 1, #chat do
                    local char = chat:sub(i, i)

                    if not tfind(supported, char) then
                        has_unsupported = true
                        break
                    elseif tfind(supported, char) then
                        if char[i-1] == "<" or char[i-1] == ">" then
                            send_msg("Player: (" .. tostring(player) .. ") is bypassing using < and > method!. (:_:)")
                            insert(caught)
                        end 
                    end
                end
                
                if has_unsupported and not tfind(caught, player) then
                    send_msg("Player: (" .. tostring(player) .. ") is bypassing using unsupported characters!. (T_T)")
                    insert(caught, player)
                end
            end
        end)

        addcmd("checkwhitelist", function()
            for i, player in whitelisted_players do 
                send_msg("Player: " .. player .. " is currently whitelisted!")
            end
        end)

        addcmd("chat", function()
            local message_to_send = gsub(chat_sent, prefix.."chat ", "")
            for channel, true_value in channels do
                if sfind(message_to_send, channel) then
                    local new_message = gsub(message_to_send, tostring(channel), "")

                    send_msg(new_message, true_value)
                end
            end
        end)

        addcmd("listchannels", function()
            for channel_name, true_name in info_channels do 
                send_msg(channel_name..": "..true_name)
            end
        end)

        addcmd("fling", function()
            local lproot = lp_root()
            local old_pos = lproot.Position

            lproot.AssemblyAngularVelocity = Vector3.new(900, 900, 900)
            lproot.AssemblyLinearVelocity = Vector3.new(900, 900, 900)

            localplayer.CharacterAdded:Connect(function()
                wait(1)
                local current_root = lp_root()
                
                create_tween(current_root, old_pos, 3)
            end)
        end)

        addcmd("bring", function()
            local their_root = return_root(return_char(player_sent))
            local lp_root = lp_root()

            create_tween(lp_root, their_root.Position, 3)
        end)

        addcmd("goto", function()
            local chosenplr = gsub(chat_sent, prefix.."goto ", "")
            local cleared_player = string_to_player(chosenplr)

            if cleared_player then 
                local their_root = return_root(return_char(cleared_player))
                local lp_root = lp_root()
    
                create_tween(lp_root, their_root.Position, 3)
                send_msg("Going to: " .. tostring(cleared_player))
            end
        end)

        addcmd("status", function()
            if enabled then
                send_msg("I am currently: (ENABLED)")
            else
                send_msg("I am currently: (DISABLED)")
            end
        end)

        addcmd("roast", function()
            local roasts = {"Is so stinky, even asmongold wouldn't bear with them", "truly must've been dropped as a child", "clearly has no friends LOL, what a bozo.", "is a cutie patootie :3"}
            local plr_to_roast = gsub(chat_sent, prefix.."roast ", "")
            local roast = roasts[math.random(1, rawlen(roasts))]
            
            send_msg(plr_to_roast.. " " .. roast)
        end)

        addcmd("ask", function()
            local question = gsub(chat_sent, prefix.."ask ", "")
            local api_url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"

            local url = api_url .. "?key=" .. api_key
            local headers = {
                ["Content-Type"] = "application/json"
            }
            local payload = {
                contents = {
                    {
                        parts = {
                            { text = question }
                        }
                    }
                }
            }
            
            local jsonData = HttpService:JSONEncode(payload)
        
            local success, response = pcall(function()
                return request({
                    ["Url"] = url,
                    ["Method"] = "POST",
                    ["Headers"] = headers,
                    ["Body"] = jsonData
                })
            end)
        
            if success then
                local result = HttpService:JSONDecode(response.Body)
                print("API Response:", result, unpack(result))
            else
                warn("Failed to call Gemini API:", response)
            end
        end)

        ------------------------------------------------------------------------

        local end_time = tick()

        spawn(function()
            if rawlen(commands) == rawlen(cmd_info) then
                send_msg("(REWRITE) Commands loaded in: " .. tostring(math.round(end_time - start_time)) .. " Seconds!")
            else
                warn("Commands failed to load...")
            end
        end)

        wait(0.5)
        send_msg("Please type: " .. prefix.. "enable to begin")

        -- // chat function logic \\ --
        
        TextChatService.MessageReceived:Connect(function(txtchatmsg)
            chat_sent = txtchatmsg.Text
            txtchannel = txtchatmsg.TextChannel
            player_sent = tostring(txtchatmsg.TextSource)
            check_chat_logs[chat_sent] = player_sent
        
            if player_sent == tostring(localplayer) then
                env.recent_chat_sent = chat_sent
            end
        
            for cmd_name, cmd in pairs(commands) do
                local true_cmd = prefix..cmd_name

                if enabled and sfind(chat_sent, true_cmd) and tfind(whitelisted_players, player_sent) then
                    spawn(function()
                        print("Running command:", cmd_name)
                        
                        xpcall(function() cmd() end, function(err)
                            send_msg("Oops, an error occurred. Check developer console for error log!")
                            warn(err)
                        end)

                        insert(commands_sent, cmd_name)

                        wait(cooldown)
                    end)
                elseif tfind(blacklisted_players, player_sent) then
                    send_msg("You are blocked from running commands.")
                elseif not enabled and sfind(chat_sent, true_cmd) and true_cmd == prefix.."enable" and tfind(whitelisted_players, player_sent) then
                   commands["enable"]()
                   wait(cooldown)
                elseif not enabled and sfind(chat_sent, true_cmd) and true_cmd == prefix.."status" then
                    commands["status"]()
                    wait(cooldown)
                end
            end

            if is_mimicing and player_sent == player_mimicking then
                send_msg(chat_sent, txtchannel)
            end

            if enabled and rawlen(commands_sent) <= 0 then
                delay(30, function()
                    local rndm_command = default_cmds[math.random(1, rawlen(default_cmds))]
                    commands[rndm_command]()
                end)
            end
        end)
    end    
end
