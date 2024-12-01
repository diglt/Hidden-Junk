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
        local TextService = cloneref(game:GetService("TextService"))
        local TweenService = cloneref(game:GetService("TweenService"))
        local TextChatService = cloneref(game:GetService("TextChatService"))
        local TeleportService = cloneref(game:GetService("TeleportService"))
        local PathfindingService = cloneref(game:GetService("PathfindingService"))

        -- // variables \\ -- 
        local enabled = env.enabled or false
        local chat_sent = env.chat_sent or ""
        local txtchannel = env.txtchannel or nil
        local player_sent = env.playersent or nil
        
        local recent_chat_sent = ""
        local prefix = "!"
        local cooldown = 1

        local localplayer = Players.LocalPlayer
        local owner_player = tostring(localplayer)

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
        local blacklisted_players = {}
        local whitelisted_players = {owner_player}
        local ran_send_owner_cmd = {}

        -- // command inf \\ -- 
        local start_time = tick()

        local cmd_info = {
            ["enable"] = "BOOLVALUE: enables bot",
            ["disable"] = "(OWNER ONLY) BOOLVALUE: disables bot",
            ["sit"] = nil,
            ["jump"] = nil,
            ["freeze"] = nil,
            ["unfreeze"] = nil,
            ["dance"] = nil,
            ["cmds"] = nil,
            ["help"] = nil
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
            return return_root(return_char(localplayer))
        end

        local function lp_hum()
            return return_humanoid(return_char(localplayer))
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

        addcmd("enable", function()
            env.enabled = true
            send_msg("Successfully enabled commands!")
        end)

        addcmd("disable", function()
            if player_sent == owner_player then 
                env.enabled = false
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

            lp_hum.Walkspeed = 0
            lp_root.Anchored = true
            send_msg("You froze me! I'm unable to move :(")
        end)

        addcmd("unfreeze", function()
            local lp_root = lp_root()
            local lp_hum = lp_hum()

            lp_hum.Walkspeed = 16
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
        
            for cmd_name, _ in pairs(commands) do
                long_list = long_list .. cmd_name .. "\n"
            end
        
            send_msg("Here's a list of commands:\n" .. long_list)
        end)

        addcmd("help", function()
            for cmd, n in commands do
                if string.match(chat_sent, cmd) then
                    local need_help = cmd_info[cmd]

                    send_msg(need_help)
                end
            end
        end)

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

        -- // main function logic \\ --
        
        TextChatService.MessageReceived:Connect(function(txtchatmsg)
            chat_sent = txtchatmsg.Text
            txtchannel = txtchatmsg.TextChannel
            player_sent = tostring(txtchatmsg.TextSource)
        
            if player_sent == tostring(localplayer) then
                recent_chat_sent = chat_sent
                print(recent_chat_sent)
            end
        
            for cmd_name, cmd in pairs(commands) do
                print(cmd_name, cmd)
                if enabled and string.match(chat_sent, prefix .. cmd_name) and table.find(whitelisted_players, player_sent) then
                    print("Running command:", cmd_name)
                    xpcall(function() cmd() end, function(err)
                        send_msg("Oops, an error occurred. Sorry!")
                        warn(err)
                    end)
                elseif enabled and string.match(chat_sent, prefix .. cmd_name) then
                    warn("Command found yet, table check failed!")
                elseif enabled and table.find(whitelisted_players, player_sent) then
                    warn("Command not found yet, table check success!")
                elseif table.find(blacklisted_players, player_sent) then
                    send_msg("You are blocked from running commands.")
                elseif not enabled and string.match(chat_sent, "^" .. prefix .. "enable$") then
                    spawn(commands["enable"])
                end

                wait(cooldown)
            end
        end)
    end    
end
