-- ts file was generated at discord.gg/25ms


local vu1 = game:GetService("Players")
local vu2 = game:GetService("HttpService")
local vu3 = game:GetService("TweenService")
local vu4 = game:GetService("RunService")
local vu5 = game:GetService("ReplicatedStorage")
if game.GameId ~= 7671049560 then
    warn("Script only runs on Game ID: 7671049560. Current Game ID: " .. tostring(game.GameId))
    return
end
local vu6 = vu5:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProximityService"):WaitForChild("RF"):WaitForChild("Purchase")
local vu7 = nil
local v8, v9 = pcall(function()
    vu7 = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
end)
if not (v8 and vu7) then
    warn("Error loading UI Library (MacLib): " .. tostring(v9))
    return
end
local vu15 = {
    FileName = "HTHubTheForgeConfig_" .. vu1.LocalPlayer.Name .. ".json",
    DefaultConfig = {
        SelectedRockType = nil,
        AutoMineEnabled = false,
        SelectedEnemyType = nil,
        SelectedDistance = 6,
        AutoFarmEnemyEnabled = false,
        SelectedMineDistance = 6,
        SelectedPotionName = {},
        AutoBuyAndUsePotionEnabled = false,
        SelectedItemName = nil,
        AutoSellItemEnabled = false,
        AntiAFKEnabled = true,
        ESPRockEnabled = false,
        ESPEnemyEnabled = false,
        ESPPlayerEnabled = false,
        MineTweenSpeed = 35,
        EnemyTweenSpeed = 35
    },
    CurrentConfig = {},
    SaveConfig = function()
        local v11, v12 = pcall(function()
            local v10 = vu2
            writefile(vu15.FileName, v10:JSONEncode(vu15.CurrentConfig))
        end)
        if not v11 then
            warn("Failed to save config:", v12)
        end
    end,
    LoadConfig = function()
        local v13, v14 = pcall(function()
            if isfile and isfile(vu15.FileName) then
                return readfile(vu15.FileName)
            else
                return nil
            end
        end)
        if v13 and v14 then
            vu15.CurrentConfig = vu2:JSONDecode(v14)
        else
            vu15.CurrentConfig = table.clone(vu15.DefaultConfig)
            vu15.SaveConfig()
        end
    end
}
vu15.LoadConfig()
local vu16 = vu1.LocalPlayer.Name
local v17 = vu7
local vu18 = vu7.Window(v17, {
    Title = "HT HUB | The Forge",
    Subtitle = "Hello, " .. vu16,
    Size = UDim2.fromOffset(720, 500),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.LeftAlt,
    AcrylicBlur = true
})
local function vu22(p19, p20, p21)
    if vu18 and vu18.Notify then
        vu18:Notify({
            Title = p19 or vu18.Settings.Title,
            Description = p20 or "",
            Lifetime = p21 or 4
        })
    else
        print("[Notify]", tostring(p19), tostring(p20))
    end
end
local v23 = vu7
vu7.SetFolder(v23, "HTHubTheForge")
local v24 = vu18
local v25 = vu18.TabGroup(v24)
local v26 = {
    Farm = v25:Tab({
        Name = "Farm",
        Image = "rbxassetid://10734923549"
    }),
    Shop = v25:Tab({
        Name = "Shop",
        Image = "rbxassetid://10734952273"
    }),
    Teleport = v25:Tab({
        Name = "Teleport",
        Image = "rbxassetid://10747381992"
    }),
    Settings = v25:Tab({
        Name = "Settings",
        Image = "rbxassetid://10734950309"
    })
}
local vu27 = vu15.CurrentConfig.AutoMineEnabled
if type(vu27) ~= "boolean" then
    vu27 = vu15.DefaultConfig.AutoMineEnabled
end
local v28 = vu15.CurrentConfig.SelectedRockType
local vu29 = type(v28) == "string" and {
    v28
} or (type(v28) ~= "table" and {} or v28)
local vu30 = tonumber(vu15.CurrentConfig.SelectedMineDistance) or vu15.DefaultConfig.SelectedMineDistance
if vu30 < 1 or 10 < vu30 then
    vu30 = vu15.DefaultConfig.SelectedMineDistance
end
local v31 = tonumber(vu15.CurrentConfig.MineTweenSpeed) or vu15.DefaultConfig.MineTweenSpeed
local vu32 = math.clamp(v31, 1, 50)
local vu33 = {}
local vu34 = nil
local vu35 = {}
local vu36 = 10
local vu37 = false
local vu38 = nil
local vu39 = nil
local v40 = vu15.CurrentConfig.SelectedEnemyType
local vu41 = type(v40) ~= "table" and {} or v40
local vu42 = tonumber(vu15.CurrentConfig.SelectedDistance) or vu15.DefaultConfig.SelectedDistance
if vu42 < 1 or 10 < vu42 then
    vu42 = vu15.DefaultConfig.SelectedDistance
end
local v43 = tonumber(vu15.CurrentConfig.EnemyTweenSpeed) or vu15.DefaultConfig.EnemyTweenSpeed
local vu44 = math.clamp(v43, 1, 50)
local vu45 = vu15.CurrentConfig.AutoFarmEnemyEnabled
if type(vu45) ~= "boolean" then
    vu45 = vu15.DefaultConfig.AutoFarmEnemyEnabled
end
local vu46 = vu15.CurrentConfig.AntiAFKEnabled
if type(vu46) ~= "boolean" then
    vu46 = vu15.DefaultConfig.AntiAFKEnabled
end
local vu47 = {}
local vu48 = nil
local vu49 = vu15.CurrentConfig.ESPRockEnabled
if type(vu49) ~= "boolean" then
    vu49 = vu15.DefaultConfig.ESPRockEnabled
end
local vu50 = vu15.CurrentConfig.ESPEnemyEnabled
if type(vu50) ~= "boolean" then
    vu50 = vu15.DefaultConfig.ESPEnemyEnabled
end
local vu51 = vu15.CurrentConfig.ESPPlayerEnabled
if type(vu51) ~= "boolean" then
    vu51 = vu15.DefaultConfig.ESPPlayerEnabled
end
local vu52 = {}
local vu53 = {}
local vu54 = {}
local vu55 = 300
local vu56 = false
local vu57 = nil
local vu58 = {}
local v59 = vu15.CurrentConfig.SelectedPotionName
local vu60 = type(v59) == "string" and {
    v59
} or (type(v59) ~= "table" and {} or v59)
local vu61 = vu15.CurrentConfig.AutoBuyAndUsePotionEnabled
if type(vu61) ~= "boolean" then
    vu61 = vu15.DefaultConfig.AutoBuyAndUsePotionEnabled
end
local vu62 = false
local vu63 = {}
local v64 = vu15.CurrentConfig.SelectedItemName
local vu65 = type(v64) == "string" and {
    v64
} or (type(v64) ~= "table" and {} or v64)
local vu66 = vu15.CurrentConfig.AutoSellItemEnabled
if type(vu66) ~= "boolean" then
    vu66 = vu15.DefaultConfig.AutoSellItemEnabled
end
local vu67 = nil
local vu68 = false
local vu69 = {}
local vu70 = nil
local vu71 = {}
local vu72 = nil
local v73 = {
    Farm = v26.Farm:Section({
        Side = "Left"
    }),
    Enemy = v26.Farm:Section({
        Side = "Right"
    }),
    ShopPotion = v26.Shop:Section({
        Side = "Left"
    }),
    SellItem = v26.Shop:Section({
        Side = "Right"
    }),
    TeleportNPC = v26.Teleport:Section({
        Side = "Left"
    }),
    TeleportShop = v26.Teleport:Section({
        Side = "Right"
    }),
    SettingsInfo = v26.Settings:Section({
        Side = "Left"
    }),
    SettingsPlayer = v26.Settings:Section({
        Side = "Right"
    }),
    SettingsMisc = v26.Settings:Section({
        Side = "Right"
    })
}
v73.Farm:Header({
    Name = "Mine"
})
local function vu82()
    vu33 = {}
    local v74 = {}
    local v75 = vu5:FindFirstChild("Assets")
    if not v75 then
        return vu33
    end
    local v76 = v75:FindFirstChild("Rocks")
    if not v76 then
        return vu33
    end
    local v77, v78, v79 = ipairs(v76:GetDescendants())
    while true do
        local v80
        v79, v80 = v77(v78, v79)
        if v79 == nil then
            break
        end
        if v80:IsA("Model") then
            local v81 = v80.Name
            if typeof(v81) == "string" and (v81 ~= "" and not (v81:match("^%d+$") or v74[v81])) then
                v74[v81] = true
                table.insert(vu33, v81)
            end
        end
    end
    table.sort(vu33)
    return vu33
end
local function vu91(p83)
    local v84 = {}
    if not p83 or p83 == "" then
        return v84
    end
    local v85 = workspace:FindFirstChild("Rocks")
    if not v85 then
        return v84
    end
    local v86, v87, v88 = ipairs(v85:GetDescendants())
    while true do
        local v89
        v88, v89 = v86(v87, v88)
        if v88 == nil then
            break
        end
        if v89:IsA("BasePart") then
            local v90 = v89:FindFirstAncestorWhichIsA("Model")
            if v90 and v90.Name == p83 then
                table.insert(v84, v89)
            end
        end
    end
    return v84
end
local function vu110(p92)
    if not p92 or # p92 == 0 then
        return false
    end
    local v93 = vu1.LocalPlayer.Character
    if not v93 then
        return false
    end
    if not v93:FindFirstChild("HumanoidRootPart") then
        return false
    end
    local v94, v95, v96 = ipairs(p92)
    local v97 = false
    while true do
        local v98
        v96, v98 = v94(v95, v96)
        if v96 == nil then
            break
        end
        if v98 == "All" then
            v97 = true
            break
        end
    end
    if v97 then
        p92 = vu33
    end
    local v99 = tick()
    local v100, v101, v102 = ipairs(p92)
    while true do
        local v103
        v102, v103 = v100(v101, v102)
        if v102 == nil then
            break
        end
        local v104 = vu91(v103)
        local v105, v106, v107 = ipairs(v104)
        while true do
            local v108
            v107, v108 = v105(v106, v107)
            if v107 == nil then
                break
            end
            if v108 and v108.Parent then
                local v109 = vu35[v108]
                if not v109 or vu36 <= v99 - v109 then
                    return true
                end
            end
        end
    end
    return false
end
local function vu121()
    local v111 = vu1.LocalPlayer
    if not v111 then
        return false
    end
    local v112 = v111:FindFirstChild("PlayerGui")
    if not v112 then
        return false
    end
    local v113 = v112:FindFirstChild("Notifications")
    if not v113 then
        return false
    end
    local v114 = v113:FindFirstChild("Screen")
    if not v114 then
        return false
    end
    local v115 = v114:FindFirstChild("NotificationsFrame")
    if not v115 then
        return false
    end
    local v116, v117, v118 = ipairs(v115:GetChildren())
    while true do
        local v119
        v118, v119 = v116(v117, v118)
        if v118 == nil then
            break
        end
        if v119:IsA("Frame") and v119.Name == "TextFrame" then
            local v120 = v119:FindFirstChild("TextLabel", true)
            if v120 and v120:IsA("TextLabel") and (v120.Text or ""):lower():find("someone else is already mining this rock.", 1, true) then
                return true
            end
        end
    end
    return false
end
local function vu130()
    local v122 = vu1.LocalPlayer.Character
    if not v122 then
        return false
    end
    local vu123 = v122:FindFirstChild("HumanoidRootPart")
    if not vu123 then
        return false
    end
    if vu38 then
        vu38:Disconnect()
        vu38 = nil
    end
    local v124 = vu123.Position
    local v125 = Vector3.new(v124.X, vu55, v124.Z)
    vu123.CFrame = CFrame.new(v125)
    vu37 = true
    local vu126 = vu123:FindFirstChild("BodyVelocity")
    if not vu126 then
        vu126 = Instance.new("BodyVelocity")
        vu126.MaxForce = Vector3.new(4000, 4000, 4000)
        vu126.Parent = vu123
    end
    local vu127 = v122
    vu38 = vu4.Heartbeat:Connect(function()
        if vu27 and (vu37 and (vu1.LocalPlayer.Character == vu127 and (vu123 and (vu123.Parent and not vu62)))) then
            local v128 = vu123.Position
            local v129 = Vector3.new(v128.X, vu55, v128.Z)
            vu123.CFrame = CFrame.new(v129, v129 + vu123.CFrame.LookVector * Vector3.new(1, 0, 1))
            if vu126 then
                vu126.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if vu38 then
                vu38:Disconnect()
                vu38 = nil
            end
            vu37 = false
        end
    end)
    return true
end
local function vu137()
    if currentTween then
        pcall(function()
            currentTween:Cancel()
        end)
        currentTween = nil
    end
    if vu39 then
        pcall(function()
            vu39:Cancel()
        end)
        vu39 = nil
    end
    local v131 = vu1.LocalPlayer.Character
    local v132
    if v131 then
        v132 = v131:FindFirstChild("HumanoidRootPart")
    else
        v132 = v131
    end
    if v131 then
        v131 = v131:FindFirstChildOfClass("Humanoid")
    end
    if v132 then
        local v133, v134, v135 = ipairs(v132:GetChildren())
        while true do
            local v136
            v135, v136 = v133(v134, v135)
            if v135 == nil then
                break
            end
            if v136:IsA("BodyVelocity") or (v136:IsA("BodyPosition") or v136:IsA("BodyGyro")) then
                v136:Destroy()
            end
        end
        v132.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    if v131 then
        v131:ChangeState(Enum.HumanoidStateType.Freefall)
    end
    vu37 = false
    vu56 = false
end
local function vu147(p138)
    local v139 = vu1.LocalPlayer.Character
    if not v139 then
        return false
    end
    local v140 = v139:FindFirstChild("HumanoidRootPart")
    if not (v140 and (p138 and p138.Parent)) then
        return false
    end
    local v141 = p138.Position
    local v142 = Vector3.new(v141.X, vu55, v141.Z)
    local v143 = v140.Position
    local v144 = (Vector3.new(v143.X, 0, v143.Z) - Vector3.new(v142.X, 0, v142.Z)).Magnitude / vu32
    local v145 = CFrame.new(v142, p138.Position)
    if vu39 then
        pcall(function()
            vu39:Cancel()
        end)
        vu39 = nil
    end
    local v146 = vu3:Create(v140, TweenInfo.new(v144, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = v145
    })
    vu39 = v146
    v146:Play()
    v146.Completed:Wait()
    vu39 = nil
    return true
end
local function vu171(pu148, p149)
    if not pu148 or (not p149 or p149 == "") then
        return
    end
    local vu150 = pu148:FindFirstAncestorWhichIsA("Model")
    if not vu150 or vu150.Name ~= p149 then
        return
    end
    local vu151 = {
        "Pickaxe"
    }
    local vu152 = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
    local v153 = vu1.LocalPlayer.Character
    if not v153 then
        return
    end
    local vu154 = v153:FindFirstChild("HumanoidRootPart")
    if not vu154 then
        return
    end
    local vu155 = v153
    if vu38 then
        vu38:Disconnect()
        vu38 = nil
    end
    local v156 = - (vu30 or 3)
    local v157 = pu148.Position + Vector3.new(0, v156, 0)
    local v158 = pu148.Position + Vector3.new(0, 5, 0)
    vu154.CFrame = CFrame.new(v157, v158)
    vu37 = false
    local v159 = workspace.CurrentCamera
    local vu160
    if v159 then
        vu160 = v159.CameraSubject
    else
        vu160 = v159
    end
    if v159 and (pu148 and pu148.Parent) then
        v159.CameraSubject = pu148
    end
    local v161 = vu154.AssemblyAngularVelocity
    vu154.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    local vu162 = vu154:FindFirstChild("BodyVelocity")
    if not vu162 then
        vu162 = Instance.new("BodyVelocity")
        vu162.MaxForce = Vector3.new(4000, 4000, 4000)
        vu162.Velocity = Vector3.new(0, 0, 0)
        vu162.Parent = vu154
    end
    local vu163 = nil
    vu163 = vu4.Heartbeat:Connect(function()
        if vu27 and (vu150 and (vu150.Parent and (vu1.LocalPlayer.Character == vu155 and (vu154 and (vu154.Parent and not vu62))))) then
            local v164 = pu148
            if v164 and v164.Parent then
                local v165 = - (vu30 or 3)
                local v166 = v164.Position + Vector3.new(0, v165, 0)
                local v167 = v164.Position + Vector3.new(0, 5, 0)
                vu154.CFrame = CFrame.new(v166, v167)
                if vu162 then
                    vu162.Velocity = Vector3.new(0, 0, 0)
                end
            end
        else
            if vu163 then
                vu163:Disconnect()
            end
            local v168 = workspace.CurrentCamera
            if v168 and vu160 then
                v168.CameraSubject = vu160
            end
        end
    end)
    local v169 = vu163
    while vu27 and (vu1.LocalPlayer.Character == vu155 and (vu154 and (vu154.Parent and (not vu62 and (vu150 and vu150.Parent))))) do
        if vu121() then
            if pu148 and pu148.Parent then
                vu35[pu148] = tick()
            end
            break
        end
        pcall(function()
            vu152:InvokeServer(unpack(vu151))
        end)
        task.wait(0.15)
    end
    if v169 then
        v169:Disconnect()
    end
    if vu162 and vu162.Parent then
        vu162:Destroy()
    end
    if vu154 and vu154.Parent then
        vu154.AssemblyAngularVelocity = v161
    end
    local v170 = workspace.CurrentCamera
    if v170 and vu160 then
        v170.CameraSubject = vu160
    end
    if vu27 then
        vu130()
    end
end
local v172 = vu82()
local v173, v174, v175 = ipairs(v172)
local v176 = vu7
local vu177 = vu91
local vu178 = vu130
local vu179 = vu18
local vu180 = v172
local v181 = {
    "All"
}
while true do
    local v182
    v175, v182 = v173(v174, v175)
    if v175 == nil then
        break
    end
    table.insert(v181, v182)
end
local vu193 = v73.Farm:Dropdown({
    Name = "Select Rock",
    Multi = true,
    Required = false,
    Options = v181,
    Default = vu29,
    Callback = function(p183)
        if typeof(p183) == "table" then
            vu29 = {}
            local v184, v185, v186 = pairs(p183)
            local v187 = false
            while true do
                local v188
                v186, v188 = v184(v185, v186)
                if v186 == nil then
                    break
                end
                if v188 then
                    if v186 == "All" then
                        v187 = true
                    else
                        table.insert(vu29, v186)
                    end
                end
            end
            if v187 then
                vu29 = {}
                local v189, v190, v191 = ipairs(vu180)
                while true do
                    local v192
                    v191, v192 = v189(v190, v191)
                    if v191 == nil then
                        break
                    end
                    table.insert(vu29, v192)
                end
                if vu34 and vu34.UpdateSelection then
                    vu34:UpdateSelection(vu29)
                end
            end
        end
        if vu29 and # vu29 ~= 0 then
            vu15.CurrentConfig.SelectedRockType = vu29
        else
            vu29 = {}
            vu15.CurrentConfig.SelectedRockType = {}
        end
        vu15.SaveConfig()
    end
}, "SelectRockDropdown")
if vu29 and (vu193 and vu193.UpdateSelection) then
    local v194 = vu193
    vu193.UpdateSelection(v194, vu29)
end
v73.Farm:Button({
    Name = "Refresh Rock List",
    Callback = function()
        vu180 = vu82()
        local v195, v196, v197 = ipairs(vu180)
        local v198 = {
            "All"
        }
        while true do
            local v199
            v197, v199 = v195(v196, v197)
            if v197 == nil then
                break
            end
            table.insert(v198, v199)
        end
        if vu193 then
            if vu193.ClearOptions then
                vu193:ClearOptions()
            end
            if vu193.InsertOptions then
                vu193:InsertOptions(v198)
            end
            if vu29 and vu193.UpdateSelection then
                vu193:UpdateSelection(vu29)
            end
        end
    end
}, "RefreshRockListButton")
local v206 = v73.Farm:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = {
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10"
    },
    Default = tostring(vu30),
    Callback = function(p200)
        local v201
        if typeof(p200) ~= "table" then
            v201 = p200
        else
            local v202, v203
            v202, v203, v201 = pairs(p200)
            while true do
                local v204
                v201, v204 = v202(v203, v201)
                if v201 == nil then
                    v201 = p200
                    break
                end
                if v204 then
                    break
                end
            end
        end
        local v205 = tonumber(v201)
        if v205 and (1 <= v205 and v205 <= 10) then
            vu30 = v205
            vu15.CurrentConfig.SelectedMineDistance = vu30
            vu15.SaveConfig()
        end
    end
}, "SelectMineDistanceDropdown")
if vu30 and (v206 and v206.UpdateSelection) then
    v206:UpdateSelection(tostring(vu30))
end
v73.Farm:Slider({
    Name = "Tween Speed (1-50)",
    Default = vu32,
    Minimum = 1,
    Maximum = 50,
    DisplayMethod = "Value",
    Precision = 1,
    Callback = function(p207)
        local v208 = tonumber(p207) or vu32
        local v209 = math.clamp(v208, 1, 50)
        vu32 = v209
        vu15.CurrentConfig.MineTweenSpeed = v209
        vu15.SaveConfig()
        if vu27 and not vu62 then
            if vu39 then
                pcall(function()
                    vu39:Cancel()
                end)
                vu39 = nil
            end
            vu37 = false
            vu178()
        end
    end
}, "MineTweenSpeedSlider")
v73.Farm:Toggle({
    Name = "Auto Mine",
    Default = vu27,
    Callback = function(p210)
        vu27 = p210
        vu15.CurrentConfig.AutoMineEnabled = p210
        vu15.SaveConfig()
        if p210 then
            if vu29 and # vu29 ~= 0 then
                vu178()
            else
                vu22("Mine", "Please select a rock type!", 4)
            end
        else
            vu37 = false
            if vu38 then
                vu38:Disconnect()
                vu38 = nil
            end
            vu137()
        end
    end
}, "AutoMineToggle")
task.spawn(function()
    while task.wait(0.3) do
        if vu27 and (vu29 and (# vu29 > 0 and not vu62)) then
            local v211 = vu1.LocalPlayer.Character
            local v212
            if v211 then
                v212 = v211:FindFirstChild("HumanoidRootPart")
            else
                v212 = v211
            end
            if v212 and not vu37 then
                vu178()
                task.wait(0.2)
            end
            if v211 and v212 then
                local v213 = math.huge
                local v214, v215, v216 = ipairs(vu29)
                local v217 = nil
                while true do
                    local v218
                    v216, v218 = v214(v215, v216)
                    if v216 == nil then
                        break
                    end
                    local v219 = vu177(v218)
                    local v220, v221, v222 = ipairs(v219)
                    while true do
                        local v223
                        v222, v223 = v220(v221, v222)
                        if v222 == nil then
                            break
                        end
                        if v223 and v223.Parent then
                            local v224 = vu35[v223]
                            local v225 = tick()
                            if (not v224 or v225 - v224 >= vu36) and v224 then
                                vu35[v223] = nil
                            end
                            if not v224 or vu36 <= v225 - v224 then
                                local v226 = v212.Position
                                local v227 = v223.Position
                                local v228 = (Vector3.new(v226.X, 0, v226.Z) - Vector3.new(v227.X, 0, v227.Z)).Magnitude
                                if v228 < v213 then
                                    v217 = v223
                                    v213 = v228
                                end
                            end
                        end
                    end
                end
                if v217 then
                    vu147(v217)
                    local v229 = v217:FindFirstAncestorWhichIsA("Model")
                    vu171(v217, v229 and v229.Name or nil)
                end
            end
        end
    end
end)
task.spawn(function()
    while task.wait(5) do
        local v230 = tick()
        local v231, v232, v233 = pairs(vu35)
        local v234 = {}
        while true do
            local v235
            v233, v235 = v231(v232, v233)
            if v233 == nil then
                break
            end
            if vu36 <= v230 - v235 or not (v233 and v233.Parent) then
                table.insert(v234, v233)
            end
        end
        local v236, v237, v238 = ipairs(v234)
        while true do
            local v239
            v238, v239 = v236(v237, v238)
            if v238 == nil then
                break
            end
            vu35[v239] = nil
        end
    end
end)
v73.Enemy:Header({
    Name = "Enemy"
})
local function vu242(p240)
    if p240 and p240 ~= "" then
        local v241 = p240:gsub("%d+$", "")
        if v241 == "" then
            return nil
        else
            return v241:gsub("%s+$", "")
        end
    else
        return nil
    end
end
local function vu251()
    vu47 = {}
    local v243 = {}
    local v244 = vu5:FindFirstChild("Assets")
    if not v244 then
        return vu47
    end
    local v245 = v244:FindFirstChild("Mobs")
    if not v245 then
        return vu47
    end
    local v246, v247, v248 = ipairs(v245:GetDescendants())
    while true do
        local v249
        v248, v249 = v246(v247, v248)
        if v248 == nil then
            break
        end
        if v249:IsA("Model") and v249.Name ~= "Model" then
            local v250 = vu242(v249.Name)
            if v250 and (v250 ~= "" and not v243[v250]) then
                v243[v250] = true
                table.insert(vu47, v250)
            end
        end
    end
    table.sort(vu47)
    return vu47
end
local function vu259()
    vu58 = {}
    local v252 = vu5:FindFirstChild("Assets")
    if not v252 then
        return vu58
    end
    local v253 = v252:FindFirstChild("Extras")
    if not v253 then
        return vu58
    end
    local v254 = v253:FindFirstChild("Potion")
    if not v254 then
        return vu58
    end
    local v255, v256, v257 = ipairs(v254:GetChildren())
    while true do
        local v258
        v257, v258 = v255(v256, v257)
        if v257 == nil then
            break
        end
        if v258:IsA("Model") then
            table.insert(vu58, v258.Name)
        end
    end
    table.sort(vu58)
    return vu58
end
local function vu267(p260)
    local v261 = {}
    if not p260 or p260 == "" then
        return v261
    end
    local v262 = workspace:FindFirstChild("Living")
    if not v262 then
        return v261
    end
    local v263, v264, v265 = ipairs(v262:GetChildren())
    while true do
        local v266
        v265, v266 = v263(v264, v265)
        if v265 == nil then
            break
        end
        if v266:IsA("Model") and vu242(v266.Name) == p260 then
            table.insert(v261, v266)
        end
    end
    return v261
end
local function vu270(p268)
    if not (p268 and p268.Parent) then
        return true
    end
    local v269 = p268:FindFirstChild("Status")
    return v269 and v269:FindFirstChild("Dead") and true or false
end
local function vu283(p271)
    local v272 = vu1.LocalPlayer.Character
    if not v272 then
        return nil
    end
    local v273 = v272:FindFirstChild("HumanoidRootPart")
    if not v273 then
        return nil
    end
    local v274 = vu267(p271)
    local v275 = math.huge
    local v276, v277, v278 = ipairs(v274)
    local v279 = nil
    while true do
        local v280
        v278, v280 = v276(v277, v278)
        if v278 == nil then
            break
        end
        if not vu270(v280) and (v280 and v280.Parent) then
            local v281 = v280:FindFirstChild("HumanoidRootPart") or (v280.PrimaryPart or v280:FindFirstChildWhichIsA("BasePart", true))
            if v281 then
                local v282 = (v273.Position - v281.Position).Magnitude
                if v282 < v275 then
                    v279 = v280
                    v275 = v282
                end
            end
        end
    end
    return v279
end
local function vu286(p284)
    if not (p284 and p284.Parent) then
        return true
    end
    local v285 = p284:FindFirstChild("Status")
    return v285 and v285:FindFirstChild("Dead") and true or false
end
local vu287 = nil
local function vu296()
    local v288 = vu1.LocalPlayer.Character
    if not v288 then
        return false
    end
    local vu289 = v288:FindFirstChild("HumanoidRootPart")
    if not vu289 then
        return false
    end
    if vu57 then
        vu57:Disconnect()
        vu57 = nil
    end
    local v290 = vu289.Position
    local v291 = Vector3.new(v290.X, vu55, v290.Z)
    vu289.CFrame = CFrame.new(v291)
    vu56 = true
    local vu292 = vu289:FindFirstChild("BodyVelocity")
    if not vu292 then
        vu292 = Instance.new("BodyVelocity")
        vu292.MaxForce = Vector3.new(4000, 4000, 4000)
        vu292.Parent = vu289
    end
    local vu293 = v288
    vu57 = vu4.Heartbeat:Connect(function()
        if vu45 and (vu56 and (vu1.LocalPlayer.Character == vu293 and (vu289 and (vu289.Parent and not vu62)))) then
            local v294 = vu289.Position
            local v295 = Vector3.new(v294.X, vu55, v294.Z)
            vu289.CFrame = CFrame.new(v295, v295 + vu289.CFrame.LookVector * Vector3.new(1, 0, 1))
            if vu292 then
                vu292.Velocity = Vector3.new(0, 0, 0)
            end
        else
            if vu57 then
                vu57:Disconnect()
                vu57 = nil
            end
            vu56 = false
        end
    end)
    return true
end
local function vu307(p297)
    local v298 = vu1.LocalPlayer.Character
    if not v298 then
        return false
    end
    local v299 = v298:FindFirstChild("HumanoidRootPart")
    if not (v299 and (p297 and p297.Parent)) then
        return false
    end
    local v300 = p297:FindFirstChild("HumanoidRootPart") or (p297.PrimaryPart or p297:FindFirstChildWhichIsA("BasePart", true))
    if not v300 then
        return false
    end
    if vu287 then
        pcall(function()
            vu287:Cancel()
        end)
    end
    local v301 = v300.Position
    local v302 = Vector3.new(v301.X, vu55, v301.Z)
    local v303 = v299.Position
    local v304 = (Vector3.new(v303.X, 0, v303.Z) - Vector3.new(v302.X, 0, v302.Z)).Magnitude / vu44
    local v305 = vu3
    local v306 = {
        CFrame = CFrame.new(v302, v300.Position)
    }
    vu287 = v305:Create(v299, TweenInfo.new(v304, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), v306)
    vu287:Play()
    return true
end
local function vu329(pu308, p309)
    if pu308 and (p309 and p309 ~= "") then
        if pu308 and pu308.Parent then
            local vu310 = {
                "Weapon"
            }
            local vu311 = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
            local v312 = vu1.LocalPlayer.Character
            if v312 then
                local vu313 = v312:FindFirstChild("HumanoidRootPart")
                if vu313 then
                    local vu314 = v312
                    if vu287 then
                        pcall(function()
                            vu287.Completed:Wait()
                        end)
                    end
                    if vu57 then
                        vu57:Disconnect()
                        vu57 = nil
                    end
                    local vu315 = pu308:FindFirstChild("HumanoidRootPart") or (pu308.PrimaryPart or pu308:FindFirstChildWhichIsA("BasePart", true))
                    if vu315 then
                        local v316 = vu315.Position + Vector3.new(0, - vu42, 0)
                        local v317 = vu315.Position + Vector3.new(0, 5, 0)
                        vu313.CFrame = CFrame.new(v316, v317)
                        vu56 = false
                        local v318 = workspace.CurrentCamera
                        local vu319 = v318.CameraSubject
                        local v320 = pu308:FindFirstChildOfClass("Humanoid")
                        if v320 then
                            v318.CameraSubject = v320
                        end
                        local v321 = vu313.AssemblyAngularVelocity
                        vu313.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                        local vu322 = vu313:FindFirstChild("BodyVelocity")
                        if not vu322 then
                            vu322 = Instance.new("BodyVelocity")
                            vu322.MaxForce = Vector3.new(4000, 4000, 4000)
                            vu322.Velocity = Vector3.new(0, 0, 0)
                            vu322.Parent = vu313
                        end
                        local vu323 = nil
                        vu323 = vu4.Heartbeat:Connect(function()
                            if vu45 and (pu308 and (pu308.Parent and (not vu286(pu308) and (vu1.LocalPlayer.Character == vu314 and (vu313 and (vu313.Parent and not vu62)))))) then
                                if vu315 and (vu313 and vu313.Parent) then
                                    local v324 = vu315.Position + Vector3.new(0, - vu42, 0)
                                    local v325 = vu315.Position + Vector3.new(0, 5, 0)
                                    vu313.CFrame = CFrame.new(v324, v325)
                                    if vu322 then
                                        vu322.Velocity = Vector3.new(0, 0, 0)
                                    end
                                end
                            else
                                if vu323 then
                                    vu323:Disconnect()
                                end
                                local v326 = workspace.CurrentCamera
                                if v326 and vu319 then
                                    v326.CameraSubject = vu319
                                end
                            end
                        end)
                        local v327 = vu323
                        while vu45 and (vu1.LocalPlayer.Character == vu314 and (vu313 and (vu313.Parent and (not vu62 and (not vu286(pu308) and (pu308 and pu308.Parent)))))) do
                            pcall(function()
                                vu311:InvokeServer(unpack(vu310))
                            end)
                            task.wait(0.15)
                        end
                        if vu287 then
                            pcall(function()
                                vu287:Cancel()
                            end)
                            vu287 = nil
                        end
                        if v327 then
                            v327:Disconnect()
                        end
                        if vu322 and vu322.Parent then
                            vu322:Destroy()
                        end
                        if vu313 and vu313.Parent then
                            vu313.AssemblyAngularVelocity = v321
                        end
                        local v328 = workspace.CurrentCamera
                        if v328 and vu319 then
                            v328.CameraSubject = vu319
                        end
                        if vu45 then
                            vu296()
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            return
        end
    else
        return
    end
end
local vu330 = vu251()
local v331, v332, v333 = ipairs(vu330)
local vu334 = vu296
local vu335 = vu242
local vu336 = vu287
local vu337 = vu286
local v338 = {
    "All"
}
while true do
    local v339
    v333, v339 = v331(v332, v333)
    if v333 == nil then
        break
    end
    table.insert(v338, v339)
end
local vu350 = v73.Enemy:Dropdown({
    Name = "Select Enemy",
    Multi = true,
    Required = false,
    Options = v338,
    Default = vu41,
    Callback = function(p340)
        if typeof(p340) == "table" then
            vu41 = {}
            local v341, v342, v343 = pairs(p340)
            local v344 = false
            while true do
                local v345
                v343, v345 = v341(v342, v343)
                if v343 == nil then
                    break
                end
                if v345 then
                    if v343 == "All" then
                        v344 = true
                    else
                        table.insert(vu41, v343)
                    end
                end
            end
            if v344 then
                vu41 = {}
                local v346, v347, v348 = ipairs(vu330)
                while true do
                    local v349
                    v348, v349 = v346(v347, v348)
                    if v348 == nil then
                        break
                    end
                    table.insert(vu41, v349)
                end
                if vu48 and vu48.UpdateSelection then
                    vu48:UpdateSelection(vu41)
                end
            end
        end
        if vu41 and # vu41 ~= 0 then
            vu15.CurrentConfig.SelectedEnemyType = vu41
        else
            vu41 = {}
            vu15.CurrentConfig.SelectedEnemyType = {}
        end
        vu15.SaveConfig()
    end
}, "SelectEnemyDropdown")
if vu41 and (vu350 and vu350.UpdateSelection) then
    local v351, v352, v353 = ipairs(vu330)
    while true do
        local v354
        v353, v354 = v351(v352, v353)
        if v353 == nil then
            break
        end
        if v354 == vu41 then
            vu350:UpdateSelection(vu41)
            break
        end
    end
end
v73.Enemy:Button({
    Name = "Refresh Enemy List",
    Callback = function()
        vu330 = vu251()
        local v355, v356, v357 = ipairs(vu330)
        local v358 = {
            "All"
        }
        while true do
            local v359
            v357, v359 = v355(v356, v357)
            if v357 == nil then
                break
            end
            table.insert(v358, v359)
        end
        if vu350 then
            if vu350.ClearOptions then
                vu350:ClearOptions()
            end
            if vu350.InsertOptions then
                vu350:InsertOptions(v358)
            end
            if vu41 and vu350.UpdateSelection then
                vu350:UpdateSelection(vu41)
            end
        end
    end
}, "RefreshEnemyListButton")
local v366 = v73.Enemy:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = {
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10"
    },
    Default = tostring(vu42),
    Callback = function(p360)
        local v361
        if typeof(p360) ~= "table" then
            v361 = p360
        else
            local v362, v363
            v362, v363, v361 = pairs(p360)
            while true do
                local v364
                v361, v364 = v362(v363, v361)
                if v361 == nil then
                    v361 = p360
                    break
                end
                if v364 then
                    break
                end
            end
        end
        local v365 = tonumber(v361)
        if v365 and (1 <= v365 and v365 <= 10) then
            vu42 = v365
            vu15.CurrentConfig.SelectedDistance = vu42
            vu15.SaveConfig()
        end
    end
}, "SelectDistanceDropdown")
if vu42 and (v366 and v366.UpdateSelection) then
    v366:UpdateSelection(tostring(vu42))
end
v73.Enemy:Slider({
    Name = "Tween Speed (1-50)",
    Default = vu44,
    Minimum = 1,
    Maximum = 50,
    DisplayMethod = "Value",
    Precision = 1,
    Callback = function(p367)
        local v368 = tonumber(p367) or vu44
        local v369 = math.clamp(v368, 1, 50)
        vu44 = v369
        vu15.CurrentConfig.EnemyTweenSpeed = v369
        vu15.SaveConfig()
        if vu45 and not vu62 then
            if vu336 then
                pcall(function()
                    vu336:Cancel()
                end)
                vu336 = nil
            end
            vu56 = false
            vu334()
        end
    end
}, "EnemyTweenSpeedSlider")
v73.Enemy:Toggle({
    Name = "Auto Farm Enemy",
    Default = vu45,
    Callback = function(p370)
        vu45 = p370
        vu15.CurrentConfig.AutoFarmEnemyEnabled = p370
        vu15.SaveConfig()
        if p370 then
            if vu41 then
                vu334()
            else
                vu22("Enemy", "Please select an enemy type!", 4)
            end
        else
            vu56 = false
            if vu57 then
                vu57:Disconnect()
                vu57 = nil
            end
            vu137()
        end
    end
}, "AutoFarmEnemyToggle")
task.spawn(function()
    while true do
        while true do
            local v371 = vu45 and vu41
            if v371 then
                if # vu41 <= 0 or vu62 then
                    v371 = false
                else
                    v371 = (not vu27 or (not vu29 or # vu29 == 0)) and true or not vu110(vu29)
                end
            end
            if v371 then
            end
            task.wait(0.3)
        end
        local v372 = vu1.LocalPlayer.Character
        local v373
        if v372 then
            v373 = v372:FindFirstChild("HumanoidRootPart")
        else
            v373 = v372
        end
        if v373 and not vu56 then
            vu334()
            task.wait(0.2)
        end
        if v372 and v373 then
            local v374 = math.huge
            local v375 = vu41
            local v376, v377, v378 = ipairs(vu41)
            local v379 = false
            local v380 = nil
            while true do
                local v381
                v378, v381 = v376(v377, v378)
                if v378 == nil then
                    break
                end
                if v381 == "All" then
                    v379 = true
                end
            end
            if v379 then
                v375 = vu330
            end
            local v382, v383, v384 = ipairs(v375)
            local v385
            v384, v385 = v382(v383, v384)
            if v384 ~= nil then
                local v386 = vu283(v385)
                if v386 and v373 then
                    local v387 = v386:FindFirstChild("HumanoidRootPart") or (v386.PrimaryPart or v386:FindFirstChildWhichIsA("BasePart", true))
                    if v387 then
                        local v388 = v373.Position
                        local v389 = v387.Position
                        local v390 = (Vector3.new(v388.X, 0, v388.Z) - Vector3.new(v389.X, 0, v389.Z)).Magnitude
                        if v390 < v374 then
                            v380 = v386
                            v374 = v390
                        end
                    end
                end
            end
            if v380 then
                if vu337(v380) then
                    task.wait(0.1)
                else
                    vu307(v380)
                    vu329(v380, vu335(v380.Name))
                end
            else
                task.wait(0.1)
            end
        end
    end
end)
v73.ShopPotion:Header({
    Name = "Shop Potion"
})
local vu391 = nil
local function vu401()
    local v392 = vu1.LocalPlayer.Character
    if not v392 then
        return false
    end
    local v393 = v392:FindFirstChild("HumanoidRootPart")
    if not v393 then
        return false
    end
    local v394 = game.PlaceId
    local v395
    if v394 == 76558904092080 then
        v395 = Vector3.new(- 153.73959721191406, 27.377073287963867, 116.34660339355469)
    elseif v394 == 129009554587176 then
        v395 = Vector3.new(- 96.84030151367188, 20.6254825592041, - 43.52947235107422)
    else
        v395 = Vector3.new(- 153.73959721191406, 27.377073287963867, 116.34660339355469)
    end
    local v396 = (v393.Position - v395).Magnitude
    local v397 = math.clamp(v396 / 5, 3, 12)
    local v398 = CFrame.new(v395, v395 + v393.CFrame.LookVector * Vector3.new(1, 0, 1))
    if vu391 then
        pcall(function()
            vu391:Cancel()
        end)
        vu391 = nil
    end
    local vu399 = vu3:Create(v393, TweenInfo.new(v397, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = v398
    })
    vu391 = vu399
    vu399:Play()
    local vu400 = false
    vu399.Completed:Connect(function()
        vu400 = true
    end)
    while not vu400 do
        if not vu61 then
            pcall(function()
                vu399:Cancel()
            end)
            vu391 = nil
            return false
        end
        task.wait(0.05)
    end
    vu391 = nil
    return true
end
local v402 = vu259()
local vu408 = v73.ShopPotion:Dropdown({
    Name = "Select Potion",
    Multi = true,
    Required = false,
    Options = v402,
    Default = vu60,
    Callback = function(p403)
        if typeof(p403) ~= "table" then
            vu60 = {}
        else
            vu60 = {}
            local v404, v405, v406 = pairs(p403)
            while true do
                local v407
                v406, v407 = v404(v405, v406)
                if v406 == nil then
                    break
                end
                if v407 then
                    table.insert(vu60, v406)
                end
            end
        end
        if vu60 and # vu60 ~= 0 then
            vu15.CurrentConfig.SelectedPotionName = vu60
        else
            vu60 = {}
            vu15.CurrentConfig.SelectedPotionName = {}
        end
        vu15.SaveConfig()
    end
}, "SelectPotionDropdown")
if vu60 and (# vu60 > 0 and (vu408 and vu408.UpdateSelection)) then
    vu408:UpdateSelection(vu60)
end
v73.ShopPotion:Button({
    Name = "Refresh Potion List",
    Callback = function()
        local v409 = vu259()
        if vu408 then
            if vu408.ClearOptions then
                vu408:ClearOptions()
            end
            if vu408.InsertOptions then
                vu408:InsertOptions(v409)
            end
            if vu60 and (# vu60 > 0 and vu408.UpdateSelection) then
                vu408:UpdateSelection(vu60)
            end
        end
        vu22("Shop Potion", "\239\191\189\195\163 c\225\186\173p nh\225\186\173t danh s\195\161ch potion.", 3)
    end
}, "RefreshPotionListButton")
v73.ShopPotion:Toggle({
    Name = "Auto Buy And Use",
    Default = vu61,
    Callback = function(p410)
        vu61 = p410
        vu15.CurrentConfig.AutoBuyAndUsePotionEnabled = p410
        vu15.SaveConfig()
        if p410 and (not vu60 or # vu60 == 0) then
            vu22("Shop Potion", "Ch\198\176a ch\225\187\141n potion!", 3)
        end
    end
}, "AutoBuyAndUsePotionToggle")
local function vu412(p411)
    if p411 and p411 ~= "" then
        return ({
            MovementSpeedPotion1 = "SpeedPotion1",
            LuckyPotion1 = "LuckPotion1"
        })[p411] or p411
    else
        return nil
    end
end
local function vu418(p413)
    local v414 = vu1.LocalPlayer
    if v414 then
        local v415 = v414:FindFirstChild("PlayerGui")
        if v415 then
            local v416 = v415:FindFirstChild("Hotbar")
            if v416 then
                local v417 = v416:FindFirstChild("Perks")
                if v417 then
                    return v417:FindFirstChild((vu412(p413))) and true or (v417:FindFirstChild(p413) and true or false)
                else
                    return false
                end
            else
                return false
            end
        else
            return false
        end
    else
        return false
    end
end
task.spawn(function()
    local vu419 = vu5:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
    while true do
        while true do
            task.wait(0.5)
            if vu61 and (vu60 and # vu60 ~= 0) then
                break
            end
            vu62 = false
            if vu38 then
                vu38:Disconnect()
                vu38 = nil
            end
            if vu57 then
                vu57:Disconnect()
                vu57 = nil
            end
            vu37 = false
            vu56 = false
        end
        vu62 = true
        if vu38 then
            vu38:Disconnect()
            vu38 = nil
        end
        if vu57 then
            vu57:Disconnect()
            vu57 = nil
        end
        vu37 = false
        vu56 = false
        local v420 = vu1.LocalPlayer
        local v421
        if v420 then
            v421 = v420:FindFirstChild("Backpack")
        else
            v421 = v420
        end
        local v422 = false
        if v420 then
            v420 = v420:FindFirstChild("PlayerGui")
        end
        if v420 then
            local v423 = v420:FindFirstChild("Main")
            if v423 then
                v423 = v423:FindFirstChild("Screen")
            end
            if v423 then
                v423 = v423:FindFirstChild("Hud")
            end
            if v423 then
                v423 = v423:FindFirstChild("Gold")
            end
            if v423 and v423:IsA("TextLabel") then
                local v424 = (v423.Text or ""):gsub("[^%d%.]", "")
                v422 = (tonumber(v424) or 0) >= 600 and true or v422
            end
        end
        if vu61 and v422 then
            local v425, v426, v427 = ipairs(vu60)
            while true do
                local vu428
                v427, vu428 = v425(v426, v427)
                if v427 == nil or not vu61 then
                    break
                end
                local v429
                if v421 then
                    v429 = v421:FindFirstChild(vu428)
                else
                    v429 = v421
                end
                if v429 then
                    pcall(function()
                        local v430 = {
                            vu428
                        }
                        vu419:InvokeServer(unpack(v430))
                    end)
                elseif not vu418(vu428) and (vu61 and (vu401() and vu61)) then
                    pcall(function()
                        local v431 = {
                            vu428,
                            3
                        }
                        vu6:InvokeServer(unpack(v431))
                    end)
                    task.wait(1)
                end
            end
        end
        vu62 = false
    end
end)
v73.SellItem:Header({
    Name = "Sell Item"
})
local function vu438()
    vu63 = {}
    local v432 = vu5:FindFirstChild("Assets")
    if not v432 then
        return vu63
    end
    local v433 = v432:FindFirstChild("Ores")
    if not v433 then
        return vu63
    end
    local v434, v435, v436 = ipairs(v433:GetChildren())
    while true do
        local v437
        v436, v437 = v434(v435, v436)
        if v436 == nil then
            break
        end
        if v437:IsA("Model") then
            table.insert(vu63, v437.Name)
        end
    end
    table.sort(vu63)
    return vu63
end
local function vu452(p439)
    local v440 = vu1.LocalPlayer
    if not v440 then
        return 0
    end
    local v441 = v440:FindFirstChild("PlayerGui")
    if not v441 then
        return 0
    end
    local v442 = v441:FindFirstChild("Menu")
    if not v442 then
        return 0
    end
    local v443 = v442:FindFirstChild("Frame")
    if not v443 then
        return 0
    end
    local v444 = v443:FindFirstChild("Frame")
    if not v444 then
        return 0
    end
    local v445 = v444:FindFirstChild("Menus")
    if not v445 then
        return 0
    end
    local v446 = v445:FindFirstChild("Stash")
    if not v446 then
        return 0
    end
    local v447 = v446:FindFirstChild("Background")
    if not v447 then
        return 0
    end
    local v448 = v447:FindFirstChild(p439)
    if not v448 then
        return 0
    end
    local v449 = v448:FindFirstChild("Main")
    if not v449 then
        return 0
    end
    local v450 = v449:FindFirstChild("Quantity")
    if not (v450 and v450:IsA("TextLabel")) then
        return 0
    end
    local v451 = (v450.Text or ""):gsub("[^%d]", "")
    return tonumber(v451) or 0
end
local function vu459()
    local v453, v454, v455 = ipairs(vu63)
    local v456 = {}
    while true do
        local v457
        v455, v457 = v453(v454, v455)
        if v455 == nil then
            break
        end
        local v458 = vu452(v457)
        if v458 > 0 then
            table.insert(v456, v457 .. " (" .. tostring(v458) .. ")")
        else
            table.insert(v456, v457)
        end
    end
    return v456
end
local vu460 = vu438()
local function v467()
    local v461, v462, v463 = ipairs(vu65 or {})
    local v464 = {}
    while true do
        local v465
        v463, v465 = v461(v462, v463)
        if v463 == nil then
            break
        end
        local v466 = vu452(v465)
        if v466 > 0 then
            table.insert(v464, v465 .. " (" .. tostring(v466) .. ")")
        else
            table.insert(v464, v465)
        end
    end
    return v464
end
local vu474 = v73.SellItem:Dropdown({
    Name = "Select Item",
    Multi = true,
    Required = false,
    Options = vu459(),
    Default = v467(),
    Callback = function(p468)
        if typeof(p468) ~= "table" then
            vu65 = {}
        else
            vu65 = {}
            local v469, v470, v471 = pairs(p468)
            while true do
                local v472
                v471, v472 = v469(v470, v471)
                if v471 == nil then
                    break
                end
                if v472 then
                    local v473 = v471:gsub("%s*%(%d+%)", "")
                    table.insert(vu65, v473)
                end
            end
        end
        vu15.CurrentConfig.SelectedItemName = vu65
        vu15.SaveConfig()
    end
}, "SelectItemDropdown")
if vu65 and (# vu65 > 0 and (vu474 and vu474.UpdateSelection)) then
    local v475 = v467()
    if # v475 > 0 then
        vu474:UpdateSelection(v475)
    end
end
v73.SellItem:Button({
    Name = "Refresh Item List",
    Callback = function()
        vu460 = vu438()
        if vu474 then
            local v476 = vu459()
            if vu474.ClearOptions then
                vu474:ClearOptions()
            end
            if vu474.InsertOptions then
                vu474:InsertOptions(v476)
            end
            if vu65 and # vu65 > 0 then
                local v477, v478, v479 = ipairs(vu65)
                local v480 = {}
                while true do
                    local v481
                    v479, v481 = v477(v478, v479)
                    if v479 == nil then
                        break
                    end
                    local v482, v483, v484 = ipairs(v476)
                    while true do
                        local v485
                        v484, v485 = v482(v483, v484)
                        if v484 == nil then
                            break
                        end
                        if v485:gsub("%s*%(%d+%)", "") == v481 then
                            table.insert(v480, v485)
                            break
                        end
                    end
                end
                if # v480 > 0 and vu474.UpdateSelection then
                    vu474:UpdateSelection(v480)
                end
            end
        end
    end
}, "RefreshItemListButton")
v73.SellItem:Toggle({
    Name = "Auto Sell Item",
    Default = vu66,
    Callback = function(p486)
        vu66 = p486
        vu15.CurrentConfig.AutoSellItemEnabled = p486
        vu15.SaveConfig()
        if p486 then
            if vu65 and # vu65 ~= 0 then
                vu67 = nil
                vu68 = false
            else
                vu22("Sell Item", "Please select an item!", 3)
            end
        else
            vu67 = nil
            vu68 = false
        end
    end
}, "AutoSellItemToggle")
task.spawn(function()
    local vu487 = vu5:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DialogueService"):WaitForChild("RF"):WaitForChild("RunCommand")
    local vu488 = vu5:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProximityService"):WaitForChild("RF"):WaitForChild("ForceDialogue")
    repeat
        repeat
            task.wait(1)
        until vu66 and (vu65 and # vu65 > 0)
        if not vu67 then
            local v489 = workspace:FindFirstChild("Proximity")
            local v490 = v489 and v489:FindFirstChild("Greedy Cey")
            if v490 then
                vu67 = v490
            end
        end
        if vu67 and not vu68 then
            pcall(function()
                local v491 = {
                    vu67,
                    "SellConfirmMisc"
                }
                vu488:InvokeServer(unpack(v491))
            end)
            vu68 = true
            task.wait(0.5)
        end
    until vu67 and vu68
    local v492, v493, v494 = ipairs(vu65)
    local vu495 = {}
    local v496 = false
    local v497 = vu452(v498)
    if v497 > 0 then
        vu495[v498] = v497
        v496 = true
    end
    local v498
    v494, v498 = v492(v493, v494)
    if v494 ~= nil then
    end
    if v496 then
        pcall(function()
            local v499 = {
                "SellConfirm",
                {
                    Basket = vu495
                }
            }
            vu487:InvokeServer(unpack(v499))
        end)
    end
	
end)
task.spawn(function()
    repeat
        repeat
            task.wait(3)
        until vu474
        local v500 = vu459()
        if vu474.ClearOptions then
            vu474:ClearOptions()
        end
        if vu474.InsertOptions then
            vu474:InsertOptions(v500)
        end
    until vu65 and # vu65 > 0
    local v501, v502, v503 = ipairs(vu65)
    local v504 = {}
    local v505
    v503, v505 = v501(v502, v503)
    local v506
    if v503 ~= nil then
        local v507, v508
        v507, v508, v506 = ipairs(v500)
    end
    if # v504 > 0 and vu474.UpdateSelection then
        vu474:UpdateSelection(v504)
    end
    while true do
        local v509
        v506, v509 = v507(v508, v506)
        if v506 == nil then
            break
        end
        if v509:gsub("%s*%(%d+%)", "") == v505 then
            table.insert(v504, v509)
        end
    end
    if true then
    else
    end
end)
v73.TeleportNPC:Header({
    Name = "Tween To NPC"
})
local function vu515()
    vu69 = {}
    local v510 = workspace:FindFirstChild("Proximity")
    if not v510 then
        return vu69
    end
    local v511, v512, v513 = ipairs(v510:GetChildren())
    while true do
        local v514
        v513, v514 = v511(v512, v513)
        if v513 == nil then
            break
        end
        if v514:IsA("Model") and not v514.Name:lower():find("potion") then
            table.insert(vu69, v514.Name)
        end
    end
    table.sort(vu69)
    return vu69
end
local function vu521()
    vu71 = {}
    local v516 = workspace:FindFirstChild("Shops")
    if not v516 then
        return vu71
    end
    local v517, v518, v519 = ipairs(v516:GetChildren())
    while true do
        local v520
        v519, v520 = v517(v518, v519)
        if v519 == nil then
            break
        end
        if v520:IsA("Model") then
            table.insert(vu71, v520.Name)
        end
    end
    table.sort(vu71)
    return vu71
end
local function vu535(p522, p523)
    local v524 = vu1.LocalPlayer.Character
    if not v524 then
        vu22("Teleport", "Character not found!", 3)
        return false
    end
    local v525 = v524:FindFirstChild("HumanoidRootPart")
    if not v525 then
        vu22("Teleport", "HumanoidRootPart not found!", 3)
        return false
    end
    local v526 = p523 and workspace:FindFirstChild("Proximity") or workspace:FindFirstChild("Shops")
    if not v526 then
        vu22("Teleport", "Kh\195\180ng t\195\172m th\225\186\165y folder!", 3)
        return false
    end
    local v527 = v526:FindFirstChild(p522)
    if not v527 then
        vu22("Teleport", "Kh\195\180ng t\195\172m th\225\186\165y " .. p522 .. "!", 3)
        return false
    end
    local v528 = v527:FindFirstChild("HumanoidRootPart") or (v527.PrimaryPart or v527:FindFirstChildWhichIsA("BasePart", true))
    if not v528 then
        vu22("Teleport", "Kh\195\180ng t\195\172m th\225\186\165y ph\225\186\167n t\225\187\173 c\225\187\167a " .. p522 .. "!", 3)
        return false
    end
    local v529 = v528.Position + Vector3.new(0, 3, 0)
    local v530 = (v525.Position - v529).Magnitude
    local v531 = math.clamp(v530 / 10, 1.5, 8)
    local v532 = vu3
    local v533 = {
        CFrame = CFrame.new(v529, v528.Position)
    }
    local v534 = v532:Create(v525, TweenInfo.new(v531, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), v533)
    v534:Play()
    v534.Completed:Wait()
    vu22("Teleport", "Tweened to " .. p522, 3)
    return true
end
local vu536 = vu515()
local vu542 = v73.TeleportNPC:Dropdown({
    Name = "Select NPC",
    Multi = false,
    Required = false,
    Options = vu536,
    Default = vu70,
    Callback = function(p537)
        local v538
        if typeof(p537) ~= "table" then
            v538 = p537
        else
            local v539, v540
            v539, v540, v538 = pairs(p537)
            while true do
                local v541
                v538, v541 = v539(v540, v538)
                if v538 == nil then
                    v538 = p537
                    break
                end
                if v541 then
                    break
                end
            end
        end
        if v538 and v538 ~= "" then
            vu70 = v538
        else
            vu70 = nil
        end
    end
}, "SelectNPCDropdown")
v73.TeleportNPC:Button({
    Name = "Refresh NPC List",
    Callback = function()
        local v543 = vu515()
        vu536 = v543
        if vu542 then
            if vu542.ClearOptions then
                vu542:ClearOptions()
            end
            if vu542.InsertOptions then
                vu542:InsertOptions(v543)
            end
            if vu70 and vu542.UpdateSelection then
                vu542:UpdateSelection(vu70)
            end
        end
        vu22("Teleport", "Updated NPC list.", 3)
    end
}, "RefreshNPCListButton")
v73.TeleportNPC:Button({
    Name = "Tween To NPC",
    Callback = function()
        if vu70 then
            vu535(vu70, true)
        else
            vu22("Teleport", "Please select an NPC!", 3)
        end
    end
}, "TweenToNPCButton")
v73.TeleportShop:Header({
    Name = "Tween To Shop"
})
local vu544 = vu521()
local vu550 = v73.TeleportShop:Dropdown({
    Name = "Select Shop",
    Multi = false,
    Required = false,
    Options = vu544,
    Default = vu72,
    Callback = function(p545)
        local v546
        if typeof(p545) ~= "table" then
            v546 = p545
        else
            local v547, v548
            v547, v548, v546 = pairs(p545)
            while true do
                local v549
                v546, v549 = v547(v548, v546)
                if v546 == nil then
                    v546 = p545
                    break
                end
                if v549 then
                    break
                end
            end
        end
        if v546 and v546 ~= "" then
            vu72 = v546
        else
            vu72 = nil
        end
    end
}, "SelectShopDropdown")
v73.TeleportShop:Button({
    Name = "Refresh Shop List",
    Callback = function()
        local v551 = vu521()
        vu544 = v551
        if vu550 then
            if vu550.ClearOptions then
                vu550:ClearOptions()
            end
            if vu550.InsertOptions then
                vu550:InsertOptions(v551)
            end
            if vu72 and vu550.UpdateSelection then
                vu550:UpdateSelection(vu72)
            end
        end
        vu22("Teleport", "Updated shop list.", 3)
    end
}, "RefreshShopListButton")
v73.TeleportShop:Button({
    Name = "Tween To Shop",
    Callback = function()
        if vu72 then
            vu535(vu72, false)
        else
            vu22("Teleport", "Please select a shop!", 3)
        end
    end
}, "TweenToShopButton")
v73.SettingsInfo:Header({
    Name = "Script Information"
})
v73.SettingsInfo:Label({
    Text = "The Forge Script\nPlayer: " .. vu16
})
v73.SettingsInfo:Button({
    Name = "Copy Player Name",
    Callback = function()
        if setclipboard then
            setclipboard(vu16)
            vu22("Notification", "Copied player name.", 3)
        else
            vu22("Notification", vu16, 3)
        end
    end
}, "CopyPlayerNameButton")
v73.SettingsInfo:SubLabel({
    Text = "Shortcut: Left Alt (or mobile icon) to hide/show UI"
})
local function vu558(p552, p553, p554)
    local v555 = p552:FindFirstChild("ESPBillboard")
    if not v555 then
        v555 = Instance.new("BillboardGui")
        v555.Name = "ESPBillboard"
        v555.Size = UDim2.new(0, 200, 0, 50)
        v555.StudsOffset = Vector3.new(0, 3, 0)
        v555.AlwaysOnTop = true
        v555.Adornee = p552
        v555.Parent = p552
        local v556 = Instance.new("TextLabel")
        v556.Name = "ESPLabel"
        v556.Size = UDim2.new(1, 0, 1, 0)
        v556.BackgroundTransparency = 1
        v556.TextColor3 = Color3.fromRGB(255, 255, 255)
        v556.TextStrokeTransparency = 0.5
        v556.TextSize = 14
        v556.Font = Enum.Font.GothamBold
        v556.Parent = v555
    end
    local v557 = v555:FindFirstChild("ESPLabel")
    if v557 then
        v557.Text = p553 .. "\n" .. string.format("%.1f", p554) .. " studs"
    end
    return v555
end
local function vu589()
    if not vu49 then
        return
    end
    if not vu29 or # vu29 == 0 then
        local v559, v560, v561 = pairs(vu52)
        while true do
            local v562
            v561, v562 = v559(v560, v561)
            if v561 == nil then
                break
            end
            if v562 and v562.Parent then
                v562:Destroy()
            end
        end
        vu52 = {}
        return
    end
    local v563 = vu1.LocalPlayer.Character
    if not v563 then
        return
    end
    local v564 = v563:FindFirstChild("HumanoidRootPart")
    if not v564 then
        return
    end
    local v565, v566, v567 = ipairs(vu29)
    local v568 = {}
    local v569 = false
    while true do
        local v570
        v567, v570 = v565(v566, v567)
        if v567 == nil then
            break
        end
        if v570 == "All" then
            v569 = true
            break
        end
        v568[v570] = true
    end
    local v571 = workspace:FindFirstChild("Rocks")
    if v571 then
        local v572, v573, v574 = ipairs(v571:GetDescendants())
        local v575 = {}
        while true do
            local v576
            v574, v576 = v572(v573, v574)
            if v574 == nil then
                break
            end
            if v576:IsA("BasePart") and v576.Parent then
                local v577 = v576:FindFirstAncestorWhichIsA("Model")
                if v577 and (v577.Name ~= "" and (v569 or v568[v577.Name])) then
                    v575[v576] = v577.Name
                end
            end
        end
        local v578, v579, v580 = pairs(vu52)
        while true do
            local v581
            v580, v581 = v578(v579, v580)
            if v580 == nil then
                break
            end
            if not (v575[v580] and v580.Parent) then
                if v581 and v581.Parent then
                    v581:Destroy()
                end
                vu52[v580] = nil
            end
        end
        local v582, v583, v584 = pairs(v575)
        while true do
            local v585
            v584, v585 = v582(v583, v584)
            if v584 == nil then
                break
            end
            local v586 = (v564.Position - v584.Position).Magnitude
            local v587 = vu52[v584]
            if v587 and v587.Parent then
                local v588 = v587:FindFirstChild("ESPLabel")
                if v588 then
                    v588.Text = v585 .. "\n" .. string.format("%.1f", v586) .. " studs"
                end
            else
                vu52[v584] = vu558(v584, v585, v586)
            end
        end
    end
end
local function vu623()
    if not vu50 then
        return
    end
    if not vu41 or # vu41 == 0 then
        local v590, v591, v592 = pairs(vu53)
        while true do
            local v593
            v592, v593 = v590(v591, v592)
            if v592 == nil then
                break
            end
            if v593 and v593.Parent then
                v593:Destroy()
            end
        end
        vu53 = {}
        return
    end
    local v594 = vu1.LocalPlayer.Character
    if not v594 then
        return
    end
    local v595 = v594:FindFirstChild("HumanoidRootPart")
    if not v595 then
        return
    end
    local v596, v597, v598 = ipairs(vu41)
    local v599 = {}
    local v600 = false
    while true do
        local v601
        v598, v601 = v596(v597, v598)
        if v598 == nil then
            break
        end
        if v601 == "All" then
            v600 = true
            break
        end
        v599[v601] = true
    end
    local v602 = workspace:FindFirstChild("Living")
    if v602 then
        local v603, v604, v605 = ipairs(v602:GetChildren())
        local v606 = {}
        while true do
            local v607
            v605, v607 = v603(v604, v605)
            if v605 == nil then
                break
            end
            if v607:IsA("Model") and (v607.Name ~= "Model" and not vu337(v607)) then
                local v608 = v607:FindFirstChild("HumanoidRootPart") or (v607.PrimaryPart or v607:FindFirstChildWhichIsA("BasePart", true))
                if v608 then
                    local v609 = vu335(v607.Name) or v607.Name
                    if v600 or v599[v609] then
                        v606[v607] = {
                            rootPart = v608,
                            name = v609
                        }
                    end
                end
            end
        end
        local v610, v611, v612 = pairs(vu53)
        while true do
            local v613
            v612, v613 = v610(v611, v612)
            if v612 == nil then
                break
            end
            if not v606[v612] or (not v612.Parent or vu337(v612)) then
                if v613 and v613.Parent then
                    v613:Destroy()
                end
                vu53[v612] = nil
            end
        end
        local v614, v615, v616 = pairs(v606)
        while true do
            local v617
            v616, v617 = v614(v615, v616)
            if v616 == nil then
                break
            end
            local v618 = v617.rootPart
            local v619 = v617.name
            local v620 = (v595.Position - v618.Position).Magnitude
            local v621 = vu53[v616]
            if v621 and v621.Parent then
                if v621.Adornee ~= v618 then
                    v621.Adornee = v618
                end
                local v622 = v621:FindFirstChild("ESPLabel")
                if v622 then
                    v622.Text = v619 .. "\n" .. string.format("%.1f", v620) .. " studs"
                end
            else
                vu53[v616] = vu558(v618, v619, v620)
            end
        end
    end
end
local function vu647()
    if vu51 then
        local v624 = vu1.LocalPlayer
        local v625 = v624.Character
        if v625 then
            local v626 = v625:FindFirstChild("HumanoidRootPart")
            if v626 then
                local v627 = vu1
                local v628, v629, v630 = ipairs(v627:GetPlayers())
                local v631 = {}
                while true do
                    local v632
                    v630, v632 = v628(v629, v630)
                    if v630 == nil then
                        break
                    end
                    if v632 ~= v624 then
                        local v633 = v632.Character
                        local v634 = not v633 or v633:FindFirstChild("HumanoidRootPart") or (v633.PrimaryPart or v633:FindFirstChildWhichIsA("BasePart", true))
                        if v634 and v633.Parent then
                            v631[v632] = v634
                        end
                    end
                end
                local v635, v636, v637 = pairs(vu54)
                while true do
                    local v638
                    v637, v638 = v635(v636, v637)
                    if v637 == nil then
                        break
                    end
                    if not (v631[v637] and (v637.Character and v631[v637].Parent)) then
                        if v638 and v638.Parent then
                            v638:Destroy()
                        end
                        vu54[v637] = nil
                    end
                end
                local v639, v640, v641 = pairs(v631)
                while true do
                    local v642
                    v641, v642 = v639(v640, v641)
                    if v641 == nil then
                        break
                    end
                    local v643 = (v626.Position - v642.Position).Magnitude
                    local v644 = vu54[v641]
                    if v644 and v644.Parent then
                        if v644.Adornee ~= v642 then
                            v644.Adornee = v642
                        end
                        local v645 = v644:FindFirstChild("ESPLabel")
                        if v645 then
                            local v646 = string.format("%.1f", v643) .. " studs"
                            v645.Text = v641.Name .. "\n" .. v646
                        end
                    else
                        vu54[v641] = vu558(v642, v641.Name, v643)
                    end
                end
            end
        else
            return
        end
    else
        return
    end
end
task.spawn(function()
    while task.wait(0.1) do
        if vu49 then
            vu589()
        else
            local v648, v649, v650 = pairs(vu52)
            while true do
                local v651
                v650, v651 = v648(v649, v650)
                if v650 == nil then
                    break
                end
                if v651 and v651.Parent then
                    v651:Destroy()
                end
            end
            vu52 = {}
        end
        if vu50 then
            vu623()
        else
            local v652, v653, v654 = pairs(vu53)
            while true do
                local v655
                v654, v655 = v652(v653, v654)
                if v654 == nil then
                    break
                end
                if v655 and v655.Parent then
                    v655:Destroy()
                end
            end
            vu53 = {}
        end
        if vu51 then
            vu647()
        else
            local v656, v657, v658 = pairs(vu54)
            while true do
                local v659
                v658, v659 = v656(v657, v658)
                if v658 == nil then
                    break
                end
                if v659 and v659.Parent then
                    v659:Destroy()
                end
            end
            vu54 = {}
        end
    end
end)
v73.SettingsMisc:Header({
    Name = "Misc"
})
v73.SettingsMisc:Toggle({
    Name = "Anti AFK",
    Default = vu46,
    Callback = function(p660)
        vu46 = p660
        vu15.CurrentConfig.AntiAFKEnabled = p660
        vu15.SaveConfig()
        vu22("Anti AFK", (p660 and "Enabled" or "Disabled") .. " Anti AFK", 3)
    end
}, "AntiAFKToggle")
v73.SettingsMisc:Toggle({
    Name = "ESP Rock",
    Default = vu49,
    Callback = function(p661)
        vu49 = p661
        vu15.CurrentConfig.ESPRockEnabled = p661
        vu15.SaveConfig()
        vu22("ESP Rock", (p661 and "Enabled" or "Disabled") .. " ESP Rock", 3)
        if not p661 then
            local v662, v663, v664 = pairs(vu52)
            while true do
                local v665
                v664, v665 = v662(v663, v664)
                if v664 == nil then
                    break
                end
                if v665 and v665.Parent then
                    v665:Destroy()
                end
            end
            vu52 = {}
        end
    end
}, "ESPRockToggle")
v73.SettingsMisc:Toggle({
    Name = "ESP Enemy",
    Default = vu50,
    Callback = function(p666)
        vu50 = p666
        vu15.CurrentConfig.ESPEnemyEnabled = p666
        vu15.SaveConfig()
        vu22("ESP Enemy", (p666 and "Enabled" or "Disabled") .. " ESP Enemy", 3)
        if not p666 then
            local v667, v668, v669 = pairs(vu53)
            while true do
                local v670
                v669, v670 = v667(v668, v669)
                if v669 == nil then
                    break
                end
                if v670 and v670.Parent then
                    v670:Destroy()
                end
            end
            vu53 = {}
        end
    end
}, "ESPEnemyToggle")
v73.SettingsPlayer:Header({
    Name = "Player"
})
v73.SettingsPlayer:Toggle({
    Name = "ESP Player",
    Default = vu51,
    Callback = function(p671)
        vu51 = p671
        vu15.CurrentConfig.ESPPlayerEnabled = p671
        vu15.SaveConfig()
        vu22("ESP Player", (p671 and "Enabled" or "Disabled") .. " ESP Player", 3)
        if not p671 then
            local v672, v673, v674 = pairs(vu54)
            while true do
                local v675
                v674, v675 = v672(v673, v674)
                if v674 == nil then
                    break
                end
                if v675 and v675.Parent then
                    v675:Destroy()
                end
            end
            vu54 = {}
        end
    end
}, "ESPPlayerToggle")
local _ = {
    UIBlurToggle = vu179:GlobalSetting({
        Name = "UI Blur",
        Default = vu179:GetAcrylicBlurState(),
        Callback = function(p676)
            vu179:SetAcrylicBlurState(p676)
            vu22(vu179.Settings.Title, (p676 and "Enabled" or "Disabled") .. " UI Blur", 4)
        end
    }),
    NotificationToggle = vu179:GlobalSetting({
        Name = "Notifications",
        Default = vu179:GetNotificationsState(),
        Callback = function(p677)
            vu179:SetNotificationsState(p677)
            vu22(vu179.Settings.Title, (p677 and "Enabled" or "Disabled") .. " Notifications", 4)
        end
    }),
    UserInfoToggle = vu179:GlobalSetting({
        Name = "Show User Info",
        Default = vu179:GetUserInfoState(),
        Callback = function(p678)
            vu179:SetUserInfoState(p678)
            vu22(vu179.Settings.Title, (p678 and "Showing" or "Redacted") .. " User Info", 4)
        end
    })
}
v26.Farm:Select()
vu179.onUnloaded(function()
    vu22("HT HUB | The Forge", "UI has been closed.", 3)
end)
v176:LoadAutoLoadConfig()
task.spawn(function()
    while task.wait(5) do
        pcall(vu15.SaveConfig)
    end
end)
task.spawn(function()
    local vu679 = game:GetService("VirtualUser")
    local _ = vu1.LocalPlayer
    while true do
        repeat
            task.wait(120)
        until vu46
        pcall(function()
            local v680 = workspace.CurrentCamera
            if v680 then
                vu679:Button2Down(Vector2.new(0, 0), v680.CFrame)
                task.wait(1)
                vu679:Button2Up(Vector2.new(0, 0), v680.CFrame)
            end
            print("Anti-AFK running at:", os.time())
        end)
    end
end)
task.spawn(function()
    local v684, v685 = pcall(function()
        if not getgenv().LoadedTheForgeMobileUI == true then
            getgenv().LoadedTheForgeMobileUI = true
            local v681 = Instance.new("ScreenGui")
            local vu682 = Instance.new("ImageButton")
            local v683 = Instance.new("UICorner")
            if syn and syn.protect_gui then
                syn.protect_gui(v681)
                v681.Parent = game:GetService("CoreGui")
            elseif gethui then
                v681.Parent = gethui()
            else
                v681.Parent = game:GetService("CoreGui")
            end
            v681.Name = "TheForge_MobileUIButton"
            v681.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            v681.ResetOnSpawn = false
            vu682.Parent = v681
            vu682.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
            vu682.BackgroundTransparency = 0.8
            vu682.Position = UDim2.new(0.9, 0, 0.1, 0)
            vu682.Size = UDim2.new(0, 50, 0, 50)
            vu682.Image = "rbxassetid://90319448802378"
            vu682.Draggable = true
            vu682.Transparency = 0.2
            v683.CornerRadius = UDim.new(0, 200)
            v683.Parent = vu682
            vu682.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(vu682, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.5,
                    Transparency = 0
                }):Play()
            end)
            vu682.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(vu682, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.8,
                    Transparency = 0.2
                }):Play()
            end)
            vu682.MouseButton1Click:Connect(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftAlt, false, game)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftAlt, false, game)
            end)
        end
    end)
    if not v684 then
        warn("Error creating mobile UI button (HT HUB | The Forge): " .. tostring(v685))
    end
end)
vu22("HT HUB | The Forge", "Script loaded successfully!\nPress Left Alt or mobile icon to hide/show UI", 5)
print("HTHubTheForge.lua loaded successfully!")
