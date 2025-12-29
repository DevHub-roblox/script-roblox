Main:AddSection("Noel Event 2025")
local demnguoc = Main:AddParagraph({
    Title = "Time Gift Christmas",
    Content = "Loading..."
})

local function GetRemainingTime()
    local now = os.time()
    local secInHour = now % 3600
    local remaining = 3600 - secInHour
    
    return remaining
end

local function loaddemnguoc()
    local remaining = GetRemainingTime()
    
    if remaining <= 0 then
        demnguoc:SetDesc("Time's up!")
        return
    end
    
    local hours = math.floor(remaining / 3600)
    local minutes = math.floor((remaining % 3600) / 60)
    local seconds = remaining % 60
    demnguoc:SetDesc(string.format("%02d:%02d:%02d", hours, minutes, seconds))
end

spawn(function()
    while true do
        loaddemnguoc()
        wait(1)
    end
end)
local CheckingCandy = Main:AddParagraph({
    Title = "Your Candy",
    Content = "Loading..."
})

spawn(function()
    while wait(.2) do
        pcall(function()
            CheckingCandy:SetDesc("Candy : " .. GetM("Candy"))
        end)
    end
end)


Main:AddToggle({
    Name = "Tween To Candy Island If Has Gift",
    Default = false,
    Callback = function(Value)
        _G.AutoTPWhendemnguocEnd = Value
    end
})

local TP_A = CFrame.new(522.877502, 13.0103874, -3328.92188, 0.821133435, -1.57235664e-08, -0.570736289, 5.81726205e-08, 1, 5.61448772e-08, 0.570736289, -7.93036605e-08, 0.821133435)
local TP_B = CFrame.new(-5401.81152, 11.7712994, 1451.52686, 0.962166369, -9.89436622e-09, 0.272462577, 2.16670593e-08, 1, -4.01998328e-08, -0.272462577, 4.45823893e-08, 0.962166369)
local TP_C = CFrame.new(-1094.11023, 64.4058685, -14520.6562, -0.0557437688, 9.07715645e-08, 0.998445094, 5.15963849e-09, 1, -9.06248587e-08, -0.998445094, 9.98447922e-11, -0.0557437688)

local didTP = false

spawn(function()
    while task.wait(1) do
        if _G.AutoTPWhendemnguocEnd then
            local now = os.time()
            local remaining = 3600 - (now % 3600)

            if remaining <= 0 and not didTP then
                didTP = true

                if World1 then
                    _TweenPos(TP_A)
                elseif World2 then
                    _TweenPos(TP_B)
                elseif World3 then
                    _TweenPos(TP_C)
                end

            elseif remaining > 0 then
                didTP = false
            end
        end
    end
end)

Main:AddToggle({
    Name = "Auto Random Fruit Candy",
    Default = false,
    Callback = function(Value)
        _G.Random_AutoEvent = Value
    end
})

spawn(function()
    while wait(1) do
        pcall(function()
            if _G.Random_AutoEvent then 
                replicated.Remotes.CommF_:InvokeServer("Cousin","F2PXmasWeek2Gacha25") 
            end 
        end)
    end
end)
Main:AddToggle({
    Name = "Auto Farm Candy",
    Default = GetSetting("AutoFarmCandy", false),
    Callback = function(Value)
        _G.AutoFarmCandy = Value
        _G.SaveData["AutoFarmCandy"] = Value
        SaveSettings()
    end
})

local idk = Vector3.new(-16267.8, 25.4, 1373.2)
local tpsub = false

local function gay()
    if not plr or not plr:FindFirstChild("Data") then return false end
    local data = plr.Data
    local island = data:FindFirstChild("SpawnPoint") or data:FindFirstChild("CurrentIsland")
    if not island then return false end
    local name = tostring(island.Value):lower()
    return string.find(name, "submerged") or string.find(name, "underwater")
end

plr.CharacterAdded:Connect(function(char)
    Root = char:WaitForChild("HumanoidRootPart", 10)
    task.delay(2, function()
        tpsub = gay()
    end)
end)

spawn(function()
    while task.wait() do
        if _G.AutoFarmCandy then
            pcall(function()
                local lvl = plr.Data.Level.Value
                if lvl >= 2600 and not tpsub then
                    if not gay() then
                        tpsub = true
                        repeat task.wait()
                            _TweenPos(CFrame.new(idk))
                        until not _G.AutoFarmCandy or (Root.Position - idk).Magnitude <= 80
                        pcall(function()
                            game:GetService("ReplicatedStorage")
                                .Modules.Net["RF/SubmarineWorkerSpeak"]
                                :InvokeServer("TravelToSubmergedIsland")
                        end)
                        task.wait(1)
                    else
                        tpsub = true
                    end
                end

                local farmPos = QuestNeta()[4]
                if farmPos then
                    _TweenPos(farmPos)
                end

                for _,v in pairs(workspace.Enemies:GetChildren()) do
                    if not _G.AutoFarmCandy then break end
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position - Root.Position).Magnitude <= 350 then
                                repeat task.wait()
                                    Kill.Mob(v, _G.AutoFarmCandy)
                                until not _G.AutoFarmCandy or not v.Parent or v.Humanoid.Health <= 0
                            end
                        end
                    end
                end
            end)
        end
    end
end)

local CandyItems = {
    "2x EXP (15 mins.)",
    "Stats Refund",
    "Race Reroll",
    "200 Fragments",
    "500 Fragments",
    "Elf Hat",
    "Santa Hat",
    "Sleigh"
}

Main:AddDropdown({
    Name = "Select Candy Item",
    Default = GetSetting("CandyItem", CandyItems[1]),
    Options = CandyItems,
    Callback = function(Value)
        _G.CandyItem = Value
        _G.SaveData["CandyItem"] = Value
        SaveSettings()
    end
})

Main:AddToggle({
    Name = "Buy Items",
    Default = GetSetting("BuyCandyItem", false),
    Callback = function(Value)
        _G.BuyCandyItem = Value
        _G.SaveData["BuyCandyItem"] = Value
        SaveSettings()
    end
})

spawn(function()
    while task.wait(0.5) do
        if _G.BuyCandyItem and _G.CandyItem then
            pcall(function()
                game:GetService("ReplicatedStorage")
                    .Remotes.CommF_
                    :InvokeServer("Candies", "Buy", _G.CandyItem)
            end)
        end
    end
end)
Main:AddSection("Dungeon Event")
if World2 or World3 then
    Main:AddToggle({
        Name = "Teleport To NPC Dungeon",
        Default = false,
        Callback = function(Value)
            _G.TpDung = Value
            if not _G.TpDung then return end
            spawn(function()
                while _G.TpDung do
                    wait(1)
                    pcall(function()
                        if World2 then
                            _TweenPos(CFrame.new(-6411.91748, 83.0275955, -4589.49512, 0.822660625, 6.88787267e-08, 0.568532765, -6.48893632e-08, 1, -2.72575367e-08, -0.568532765, -1.44680277e-08, 0.822660625))
                        elseif World3 then
                            _TweenPos(CFrame.new(-5020.69971, 315.040924, -2815.63843, -0.999763608, -3.2240417e-09, -0.0217427947, -3.92056965e-09, 1, 3.19922542e-08, 0.0217427947, 3.20699378e-08, -0.999763608))
                        end
                    end)
                end
            end)
        end
    })
    end
    if WorldD then
    Main:AddToggle({
    Name = "Auto Farm Mob Dungeon",
    Default = false,
    Callback = function(Value)
        _G.FD = Value
    end
})
spawn(function()
    while wait() do
        pcall(function()
            if _G.FD then
                for i, v in pairs(workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") or v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            repeat
                                wait()
                                Kill.Mob(v, _G.FD)
                            until not _G.FD or not v.Parent or v.Humanoid.Health <= 0
                        end
                    end
                end
            end
        end)
    end
end)
end
