-- // enviroment setup \\ -- 
if getgenv().enabled then
    error("Already Executed!")
else
    local env = getgenv()
    local wait = task.wait
    local spawn = task.spawn
    local cloneref = cloneref or getgenv().cloneref or function(object) return object end

    if env and wait and cloneref then
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

        local player_stalking
        local player_mimicking

        local localplayer = Players.LocalPlayer
        local owner_player = localplayer.Name

        local send_msg = function(msg)
            if string.find(recent_chat_sent, "#") then 
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
        local blacklisted_players = {}
        local whitelisted_players = {owner_player}
        local ran_send_owner_cmd = {}

        -- // command inf \\ -- 
        local start_time = tick()

        local cmd_info = {
            ["blacklist"] = "(OWNER ONLY) (blacklist <player>) Makes the player chosen unable to access commands.",
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

        local function is_not_null(testing_item, target)
            if not target then target = workspace end

            if testing_item.IsDescendantOf(target) then
                return true
            end
        end

        local function addcmd(name, command)
            commands[name] = command
        end

        local function ret_gsb(cmd, pattern)
            return string.gsub(chat_sent, cmd, pattern)
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

        addcmd("dance", function(choose_emote)
            if not choose_emote then send_msg("/e dance")
            else
                send_msg("/e dance" .. tostring(choose_emote))
            end
        end)

        addcmd("cmds", function()
            local long_list = ""
        
            for cmd_name, _ in pairs(cmd_info) do
                long_list = long_list .. cmd_name .. "\n"
            end
        
            send_msg("Here's a list of commands:\n" .. long_list)
        end)

        addcmd("help", function()
            for cmd, n in commands do
                if cmd ~= "help" and string.find(chat_sent,  cmd) then
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
                local cleared_name = string.gsub(chat_sent, prefix.."whitelist ", "")

                for _, player in pairs(Players:GetPlayers()) do 
                    if player ~= localplayer then
                        if string.find(player.Name, cleared_name) or string.find(player.DisplayName, cleared_name) then
                            table.insert(whitelisted_players, tostring(player))
                            send_msg("Successfully whitelisted: " .. tostring(player))
                        end
                    end
                end
            end
        end)

        addcmd("blacklist", function()
            if player_sent == owner_player then
                local cleared_name = string.gsub(chat_sent, prefix.."blacklist ", "")

                for _, player in pairs(Players:GetPlayers()) do 
                    if player ~= localplayer then
                        if string.find(player.Name, cleared_name) or string.find(player.DisplayName, cleared_name) then
                            table.insert(blacklisted_players, tostring(player))
                            send_msg("Successfully blacklisted: " .. tostring(player))
                        end
                    end
                end
            end
        end)

        addcmd("kill", function()
            local lp_hum = lp_hum()

            if is_not_null(lp_hum, workspace) then
                lp_hum.Health = 0
            end
        end)

        addcmd("credits", function()
            send_msg("All credits go to: n.eural / newline_neural!")
        end)

        addcmd("remind", function()
            send_msg("Access a command by typing "..prefix.. " then the command.")
        end)

        addcmd("clearchat", function()
            send_msg(". \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n .")
        end)

        addcmd("stalk", function()
            return
        end)

        addcmd("unstalk", function()
            return
        end)

        addcmd("mimic", function()
            player_mimicking = string.gsub(chat_sent, prefix.."mimic ", "")

            for _, player in pairs(Players:GetPlayers()) do 
                if player ~= localplayer then
                    if string.find(player.Name, player_mimicking) or string.find(player.DisplayName, player_mimicking) then
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
            prefix = string.gsub(chat_sent, prefix.."prefix", "")
        end)

        addcmd("spin", function()
            local spin_amount = tonumber(ret_gsb("spin", ""))

            while is_spinning do
                local lp_root = lp_root()

                lp_root.Position = Vector3.new(lp_root.Position + spin_amount, lp_root.Position.Y, lp_root.Position.Z)
            end
        end)

        addcmd("unspin", function()
            if is_spinning then
                is_spinning = false
            end
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
        
            if player_sent == tostring(localplayer) then
                env.recent_chat_sent = chat_sent
            end
        
            for cmd_name, cmd in pairs(commands) do
                local true_cmd = prefix..cmd_name

                if enabled and string.find(chat_sent, true_cmd) and table.find(whitelisted_players, player_sent) then
                    print("Running command:", cmd_name)
                    
                    xpcall(function() cmd() end, function(err)
                        send_msg("Oops, an error occurred. Check developer console for error log!")
                        warn(err)
                    end)

                    table.insert(commands_sent, cmd_name)

                    wait(cooldown)
                elseif table.find(blacklisted_players, player_sent) then
                    send_msg("You are blocked from running commands.")
                elseif not enabled and string.find(chat_sent, true_cmd) and table.find(whitelisted_players, player_sent) then
                   commands["enable"]()
                end
            end

            if is_mimicing and player_sent == player_mimicking then
                send_msg(chat_sent)
            end
        end)
    end    
end
