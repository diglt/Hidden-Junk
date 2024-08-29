local rp = game.Players.LocalPlayer.Character.HumanoidRootPart
local ch = game.Players.LocalPlayer.Character
local mh = ch.Humanoid.Health
local lp = game.Players.LocalPlayer
local hn

getgenv().Set = false
getgenv().E = false

function killonce()
    while E == true do 
    for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= ch.Name then 
     hn = v.Name
     local ghim = v 
    local him = v.Character
    local hh = him:FindFirstChild("Humanoid")
    local hbp = him:FindFirstChild("HumanoidRootPart")
    if him ~= nil and hh.Health > 0 and ghim:FindFirstChild("ForceField") == nil then

        Set = true
        while Set == true do 
    rp.CFrame = hbp.CFrame

    local args = {
        [1] = workspace:WaitForChild(hn)}
    game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("Attack"):InvokeServer(unpack(args))
    print("Attack!!!")
    task.wait(0.25)
    print(math.floor(hh.Health))
    if hh.Health <= 0 then 
        Set = false


        if mh <= 50  then 
            print("U Low Health.")
            rp.CFrame = CFrame.new(0,190,0)
            break
        else
        print("Dead...")
        rp.CFrame = hbp.CFrame
        print("Giving you a chance to leave, rejoin to save your loot...")
        task.wait(8)
        break
                            end
                        end
                    end
                end
            end
        end
    end
end

E = true 
killonce()
