--[[
    neurals command bot!
    version: 0 (pre-release)
]]--

-- // enviroment setup \\ -- 
if getgenv().enabled then
    error("Already Executed!")
else
    getgenv().SendMessages = true
    getgenv().global_allow = false

    if not SendMessages then
        SendAsync = function()
            return nil
        end
    end

    local env = getgenv()
    local wait = task.wait
    local sfind = string.find
    local tfind = table.find
    local gsub = string.gsub
    local spawn = task.spawn
    local delay = task.delay
    local insert = table.insert
    local remove = table.remove
    local cloneref = cloneref or getgenv().cloneref or function(object) return object end

    if env and cloneref then
        -- // Servicies \\ -- 
        local Players = cloneref(game:GetService("Players"))
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

        local send_msg = function(msg)
            if sfind(recent_chat_sent, "#") then 
                TextChatService.TextChannels.RBXGeneral:SendAsync("Last Text Filtered! Please wait...")
                wait(2)
                TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
            else
                TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
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
           __call = function()
                for player, v in whitelisted_players do 
                    send_msg("Player: " .. player .. " is currently whitelisted!")
                end
           end 
        })

        -- // command inf \\ -- 
        local start_time = tick()

        local cmd_info = {
            ["blacklist"] = "(OWNER ONLY) (blacklist <player>) Makes the player chosen unable to access commands.",
            ["checkbypassers"] = "Checks chat logs to see if anyone may be bypassing! (unreliable)",
            ["checkwhitelist"] = "Displays all whitelisted players!",
            ["clearchat"] = "Clears chat!",
            ["cmds"] = "Displays a list of commands!",
            ["credits"] = "Displays the credits of the script!",
            ["dance"] = "(dance<number>) Allows you to make me dance randomly or your choice of dance!",
            ["disable"] = "(OWNER ONLY) BOOLVALUE: Disables bot",
            ["enable"] = "BOOLVALUE: Enables bot",
            ["freeze"] = "BOOLVALUE: Freezes bot! to unfreeze type: unfreeze",
            ["help"] = "(help <command>) Displays help about certain commands!",
            ["jump"] = "Forces bot to jump!",
            ["kill"] = "Kills the character!",
            ["mimic"] = "BOOLVALUE: (mimic <player>) Copies the chat of the player!",
            ["prefix"] = "(prefix <character>) Changes the prefix for running commands!",
            ["rejoin"] = "(OWNER ONLY) Rejoins the game!",
            ["remind"] = "Reminds players of how to execute commands!",
            ["sit"] = "Forces bot to sit!",
            ["stalk"] = "BOOLVALUE: (stalk <player>) Follows the player where ever they go... ;)",
            ["spin"] = "BOOLVALUE: (spin<number>) Spins me right round, right round :D",
            ["unfreeze"] = "BOOLVALUE: Unfreezes bot! to freeze type: freeze",
            ["unmimic"] = "BOOLVALUE: Stops the mimic.",
            ["unstalk"] = "BOOLVALUE: Stops stalking the selected player!",
            ["unspin"] = "BOOLVALUE: Stops spinning.",
            ["whitelist"] = "(OWNER ONLY) (whitelist <player>) Allows owner to set access to commands!"
        }

        local default_cmds = {"dance", "jump", "sit", "kill", "remind"}
        

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
                    long_list = long_list .. cmd_name .. "\n"
                else
                    longer_list = longer_list .. cmd_name .. "\n"
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

                for _, player in pairs(Players:GetPlayers()) do 
                    if player ~= localplayer then
                        if sfind(player.Name, cleared_name) or sfind(player.DisplayName, cleared_name) then
                            insert(whitelisted_players, tostring(player))
                            send_msg("Successfully whitelisted: " .. tostring(player))
                        end
                    end
                end
            end
        end)

        addcmd("blacklist", function()
            if player_sent == owner_player then
                local cleared_name = gsub(chat_sent, prefix.."blacklist ", "")

                for _, player in pairs(Players:GetPlayers()) do 
                    if player ~= localplayer then
                        if sfind(player.Name, cleared_name) or sfind(player.DisplayName, cleared_name) then
                            pcall(function()
                                insert(blacklisted_players, tostring(player))
                                remove(whitelisted_players, tostring(player))
                            end)

                            send_msg("Successfully blacklisted: " .. tostring(player))
                        end
                    end
                end
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

            for _, player in pairs(Players:GetPlayers()) do 
                if player ~= localplayer then
                    if sfind(player.Name, player_mimicking) or sfind(player.DisplayName, player_mimicking) then
                        is_mimicing = true

                        player_mimicking = tostring(player)

                        send_msg("Beginning to mimic: " .. player_mimicking)
                    end
                end
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
                    if not sfind(supported, char) then
                        has_unsupported = true
                        break
                    end
                end
                
                if has_unsupported and not sfind(caught, player) then
                    send_msg("Player: (" .. tostring(player) .. ") is bypassing. (T_T)")
                    insert(caught, player)
                end
            end
        end)

        addcmd("checkwhitelist", function()
            whitelisted_players()
        end)

        ------------------------------------------------------------------------

        local end_time = tick()

        spawn(function()
            if rawlen(commands) == rawlen(cmd_info) then
                send_msg("Commands loaded in: " .. tostring(math.round(end_time - start_time)) .. " Seconds!")
            else
                warn("Commands failed to load...")
            end
        end)

        wait(0.5)
        send_msg("Please type: " .. prefix.. "enable to begin")

        for _, ppl in pairs(whitelisted_players) do 
            warn(ppl)
        end

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

                if enabled and sfind(chat_sent, true_cmd) and sfind(whitelisted_players, player_sent) then
                    spawn(function()
                        print("Running command:", cmd_name)
                        
                        xpcall(function() cmd() end, function(err)
                            send_msg("Oops, an error occurred. Check developer console for error log!")
                            warn(err)
                        end)

                        insert(commands_sent, cmd_name)

                        wait(cooldown)
                    end)
                elseif sfind(blacklisted_players, player_sent) then
                    send_msg("You are blocked from running commands.")
                elseif not enabled and sfind(chat_sent, true_cmd) and sfind(whitelisted_players, player_sent) then
                   commands["enable"]()
                end
            end

            if is_mimicing and player_sent == player_mimicking then
                send_msg(chat_sent)
            end

            if enabled and rawlen(commands_sent) <= 0 then
                delay(5, function()
                    local rndm_command = default_cmds[math.random(1, rawlen(default_cmds))]
                    commands[rndm_command]()
                end)
            end
        end)
    end    
end
