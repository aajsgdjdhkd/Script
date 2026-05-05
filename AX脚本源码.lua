-- by ql hack Team
-- Work out
-- 吃水不忘挖井人
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")

local Flags = {
    Toggle = false,
    Games = {"Squid Game", "Ink Game", "Doors", "Parkour Artist"},
    Combat = {"Aimlock", "Auto Shoot", "No Recoil", "Bullet Size", "Range"},
    Miscs = {"Noclip", "Fly", "Speed", "ESP"},
    Players = {"Teleport", "Spectate", "Hitbox", "Kill"},
    Settings = {"Theme", "Keybinds", "Configuration", "Notifications"}
}

local Themes = {
    Default = {
        Background = Color3.fromRGB(20, 20, 25),
        Main = Color3.fromRGB(35, 35, 45),
        Accent = Color3.fromRGB(70, 130, 200),
        Outline = Color3.fromRGB(50, 50, 60),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Christmas = {
        Background = Color3.fromRGB(20, 30, 20),
        Main = Color3.fromRGB(40, 40, 40),
        Accent = Color3.fromRGB(200, 70, 70),
        Outline = Color3.fromRGB(60, 50, 50),
        Text = Color3.fromRGB(255, 255, 255)
    },
    Matrix = {
        Background = Color3.fromRGB(0, 20, 0),
        Main = Color3.fromRGB(0, 30, 0),
        Accent = Color3.fromRGB(0, 255, 0),
        Outline = Color3.fromRGB(0, 50, 0),
        Text = Color3.fromRGB(0, 255, 0)
    }
}

local CurrentTheme = "Default"
local MenuOpen = false
local MenuFrame = nil
local Tabs = {}
local CurrentTab = "Games"

local Toggles = {
    ["Red Light, Green Light"] = {value = false, game = "Squid Game"},
    ["Auto Stop"] = {value = false, game = "Squid Game"},
    ["Disable Injury"] = {value = false, game = "Squid Game"},
    ["Finish RLGL"] = {value = false, game = "Squid Game"},
    ["Dalgona"] = {value = false, game = "Squid Game"},
    ["Anti Crack"] = {value = false, game = "Squid Game"},
    ["Get Lighter"] = {value = false, game = "Squid Game"},
    ["Auto Dalgona"] = {value = false, game = "Squid Game"},
    ["Auto Dalgona V2"] = {value = false, game = "Squid Game"},
    ["Lights Out"] = {value = false, game = "Squid Game"},
    ["Safe Zone"] = {value = false, game = "Squid Game"},
    ["Tug of War"] = {value = false, game = "Squid Game"},
    ["Rope Pull Mode"] = {value = false, game = "Squid Game"},
    ["Normal"] = {value = false, game = "Squid Game"},
    ["没找到素材"] = {value = false, game = "Squid Game"},
    ["Pull Rope"] = {value = false, game = "Squid Game"},
    ["Hide N' Seek"] = {value = false, game = "Squid Game"},
    ["Show Exit Doors (Yellow)"] = {value = false, game = "Squid Game"},
    ["Show Doors (Green | Cir/Tri/Sqr)"] = {value = false, game = "Squid Game"},
    ["Show Dropped Keys (Purple)"] = {value = false, game = "Squid Game"},
    ["Show Staircases (Brown)"] = {value = false, game = "Squid Game"},
    ["Show Spikes (Black)"] = {value = false, game = "Squid Game"},
    ["Pickup Keys"] = {value = false, game = "Squid Game"},
    ["Auto Escape"] = {value = false, game = "Squid Game"},
    ["Auto Dodge"] = {value = false, game = "Squid Game"},
    ["Infinite Stamina"] = {value = false, game = "Squid Game"},
    ["Fast Sprint"] = {value = false, game = "Squid Game"},
    ["Spikes Kill"] = {value = false, game = "Squid Game"},
    ["Disable Spikes"] = {value = false, game = "Squid Game"},
    ["Teleport to Hider"] = {value = false, game = "Squid Game"},
    ["Teleport to Seeker"] = {value = false, game = "Squid Game"},
    ["Select Exit Door"] = {value = false, game = "Squid Game"},
    ["Teleport to Exit Door"] = {value = false, game = "Squid Game"},
    ["Rebel"] = {value = false, game = "Squid Game"},
    ["Auto Shoot Guards"] = {value = false, game = "Squid Game"},
    ["Wall Check"] = {value = false, game = "Squid Game"},
    ["Guards Hitbox + ESP"] = {value = false, game = "Squid Game"},
    ["Fly"] = {value = false, game = "All"},
    ["Noclip"] = {value = false, game = "All"},
    ["ESP"] = {value = false, game = "All"},
    ["Aimlock"] = {value = false, game = "All"},
    ["Auto QTE"] = {value = false, game = "Ink Game"},
    ["Auto Skip Dialogue"] = {value = false, game = "Ink Game"},
    ["Pickup Bandages"] = {value = false, game = "Ink Game"},
    ["Reveal Safe & Fake Glass"] = {value = false, game = "Doors"},
    ["Anti Break Glass"] = {value = false, game = "Doors"},
    ["Fullbright"] = {value = false, game = "All"},
    ["Low GFX"] = {value = false, game = "All"},
    ["Instant Interact"] = {value = false, game = "All"},
    ["Anti AFK"] = {value = false, game = "All"},
    ["No Recoil"] = {value = false, game = "Squid Game"},
    ["Teleport to Target"] = {value = false, game = "All"},
    ["Spectate"] = {value = false, game = "All"},
    ["Select Player"] = {value = false, game = "All", targetName = nil},
    ["Select Target Player"] = {value = false, game = "All", targetName = nil},
}

local Options = {
    ["Hitbox Size"] = {value = 5, min = 1, max = 20, game = "Squid Game"},
    ["Hitbox Transparency"] = {value = 0.5, min = 0, max = 1, game = "Squid Game"},
    ["Walk Speed"] = {value = 16, min = 0, max = 200, game = "All"},
    ["FOV Changer"] = {value = 70, min = 1, max = 120, game = "All"},
    ["Range"] = {value = 100, min = 10, max = 500, game = "All"},
    ["Bullet Size"] = {value = 1, min = 0.5, max = 10, game = "Squid Game"},
}

local function UpdateTheme()
    if not MenuFrame then return end
    local theme = Themes[CurrentTheme]
    if not theme then theme = Themes.Default end
    MenuFrame.BackgroundColor3 = theme.Background
    for _, tabBtn in pairs(Tabs) do
        if tabBtn then
            tabBtn.BackgroundColor3 = theme.Main
            tabBtn.TextColor3 = theme.Text
        end
    end
end

local function CreateUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AX_Menu"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = CoreGui
    
    MenuFrame = Instance.new("Frame")
    MenuFrame.Name = "MainFrame"
    MenuFrame.Size = UDim2.new(0, 500, 0, 400)
    MenuFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MenuFrame.BackgroundColor3 = Themes[CurrentTheme].Background
    MenuFrame.BackgroundTransparency = 0
    MenuFrame.BorderSizePixel = 0
    MenuFrame.Visible = false
    MenuFrame.Parent = screenGui
    
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 30)
    titleBar.BackgroundColor3 = Themes[CurrentTheme].Main
    titleBar.BorderSizePixel = 0
    titleBar.Parent = MenuFrame
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(0.5, 0, 1, 0)
    title.Position = UDim2.new(0, 5, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "AX-SCRIPTS | ql破解版"
    title.TextColor3 = Themes[CurrentTheme].Text
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.TextSize = 14
    title.Parent = titleBar
    
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 1, 0)
    closeBtn.Position = UDim2.new(1, -30, 0, 0)
    closeBtn.BackgroundColor3 = Themes[CurrentTheme].Accent
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Themes[CurrentTheme].Text
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Parent = titleBar
    closeBtn.MouseButton1Click:Connect(function()
        MenuOpen = false
        MenuFrame.Visible = false
    end)
    
    local tabBar = Instance.new("Frame")
    tabBar.Size = UDim2.new(1, 0, 0, 40)
    tabBar.Position = UDim2.new(0, 0, 0, 30)
    tabBar.BackgroundColor3 = Themes[CurrentTheme].Main
    tabBar.BorderSizePixel = 0
    tabBar.Parent = MenuFrame
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 1, -70)
    contentFrame.Position = UDim2.new(0, 0, 0, 70)
    contentFrame.BackgroundColor3 = Themes[CurrentTheme].Background
    contentFrame.BorderSizePixel = 0
    contentFrame.Parent = MenuFrame
    local tabNames = {"Games", "Combat", "Miscs", "Players", "Settings"}
    local tabPositions = {10, 110, 210, 310, 410}
    
    for i, name in ipairs(tabNames) do
        local tabBtn = Instance.new("TextButton")
        tabBtn.Size = UDim2.new(0, 90, 1, 0)
        tabBtn.Position = UDim2.new(0, tabPositions[i], 0, 0)
        tabBtn.BackgroundColor3 = Themes[CurrentTheme].Main
        tabBtn.Text = name
        tabBtn.TextColor3 = Themes[CurrentTheme].Text
        tabBtn.Font = Enum.Font.GothamSemibold
        tabBtn.TextSize = 14
        tabBtn.BorderSizePixel = 0
        tabBtn.Parent = tabBar
        Tabs[name] = tabBtn
        
        tabBtn.MouseButton1Click:Connect(function()
            CurrentTab = name
            for _, btn in pairs(Tabs) do
                if btn then
                    btn.BackgroundColor3 = Themes[CurrentTheme].Main
                end
            end
            tabBtn.BackgroundColor3 = Themes[CurrentTheme].Accent
            UpdateContent(contentFrame, name)
        end)
        
        if name == "Games" then
            tabBtn.BackgroundColor3 = Themes[CurrentTheme].Accent
        end
    end
    
    local function CreateToggle(parent, yOffset, text, toggleKey)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 200, 0, 30)
        frame.Position = UDim2.new(0, 10, 0, yOffset)
        frame.BackgroundTransparency = 1
        frame.Parent = parent
        
        local toggle = Instance.new("TextButton")
        toggle.Size = UDim2.new(0, 20, 0, 20)
        toggle.Position = UDim2.new(0, 0, 0, 5)
        toggle.BackgroundColor3 = Toggles[toggleKey] and Toggles[toggleKey].value and Color3.fromRGB(70, 130, 200) or Color3.fromRGB(100, 100, 100)
        toggle.BorderSizePixel = 0
        toggle.Text = ""
        toggle.Parent = frame
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0, 170, 0, 30)
        label.Position = UDim2.new(0, 25, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.TextColor3 = Themes[CurrentTheme].Text
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.Parent = frame
        
        toggle.MouseButton1Click:Connect(function()
            if Toggles[toggleKey] then
                Toggles[toggleKey].value = not Toggles[toggleKey].value
                toggle.BackgroundColor3 = Toggles[toggleKey].value and Color3.fromRGB(70, 130, 200) or Color3.fromRGB(100, 100, 100)
            end
        end)
    end
    
    local function CreateSlider(parent, yOffset, text, optionKey)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 220, 0, 50)
        frame.Position = UDim2.new(0, 10, 0, yOffset)
        frame.BackgroundTransparency = 1
        frame.Parent = parent
        
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 0, 20)
        label.Position = UDim2.new(0, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text .. ": " .. tostring(Options[optionKey].value)
        label.TextColor3 = Themes[CurrentTheme].Text
        label.Font = Enum.Font.Gotham
        label.TextSize = 13
        label.Parent = frame
        
        local slider = Instance.new("Frame")
        slider.Size = UDim2.new(1, 0, 0, 4)
        slider.Position = UDim2.new(0, 0, 0, 25)
        slider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
        slider.BorderSizePixel = 0
        slider.Parent = frame
        
        local fill = Instance.new("Frame")
        fill.Size = UDim2.new((Options[optionKey].value - Options[optionKey].min) / (Options[optionKey].max - Options[optionKey].min), 0, 1, 0)
        fill.BackgroundColor3 = Themes[CurrentTheme].Accent
        fill.BorderSizePixel = 0
        fill.Parent = slider
        
        local dragging = false
        slider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                local x = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                local val = Options[optionKey].min + x * (Options[optionKey].max - Options[optionKey].min)
                Options[optionKey].value = math.floor(val * 10) / 10
                fill.Size = UDim2.new(x, 0, 1, 0)
                label.Text = text .. ": " .. tostring(Options[optionKey].value)
            end
        end)
        
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                local x = math.clamp((input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
                local val = Options[optionKey].min + x * (Options[optionKey].max - Options[optionKey].min)
                Options[optionKey].value = math.floor(val * 10) / 10
                fill.Size = UDim2.new(x, 0, 1, 0)
                label.Text = text .. ": " .. tostring(Options[optionKey].value)
            end
        end)
    end
    
    local function UpdateContent(frame, tab)
        for _, child in ipairs(frame:GetChildren()) do
            child:Destroy()
        end
        
        if tab == "Games" then
            local yOffset = 10
            for name, toggle in pairs(Toggles) do
                if toggle.game == "Squid Game" then
                    CreateToggle(frame, yOffset, name, name)
                    yOffset = yOffset + 35
                    if yOffset > 350 then
                        yOffset = 10
                    end
                end
            end
        elseif tab == "Combat" then
            local yOffset = 10
            CreateToggle(frame, yOffset, "Aimlock", "Aimlock")
            yOffset = yOffset + 35
            CreateSlider(frame, yOffset, "Range", "Range")
            yOffset = yOffset + 55
            CreateSlider(frame, yOffset, "Bullet Size", "Bullet Size")
        elseif tab == "Miscs" then
            local yOffset = 10
            CreateToggle(frame, yOffset, "Noclip", "Noclip")
            yOffset = yOffset + 35
            CreateToggle(frame, yOffset, "Fly", "Fly")
            yOffset = yOffset + 35
            CreateSlider(frame, yOffset, "Walk Speed", "Walk Speed")
        elseif tab == "Players" then
            local yOffset = 10
            CreateToggle(frame, yOffset, "ESP", "ESP")
            yOffset = yOffset + 35
            CreateToggle(frame, yOffset, "Highlight Players", "Highlight Players")
        elseif tab == "Settings" then
            local yOffset = 10
            local themeDropdown = Instance.new("Frame")
            themeDropdown.Size = UDim2.new(0, 200, 0, 30)
            themeDropdown.Position = UDim2.new(0, 10, 0, yOffset)
            themeDropdown.BackgroundColor3 = Themes[CurrentTheme].Main
            themeDropdown.BorderSizePixel = 0
            themeDropdown.Parent = frame
            
            local themeLabel = Instance.new("TextButton")
            themeLabel.Size = UDim2.new(1, -30, 1, 0)
            themeLabel.Position = UDim2.new(0, 0, 0, 0)
            themeLabel.BackgroundTransparency = 1
            themeLabel.Text = "Theme: " .. CurrentTheme
            themeLabel.TextColor3 = Themes[CurrentTheme].Text
            themeLabel.TextXAlignment = Enum.TextXAlignment.Left
            themeLabel.Font = Enum.Font.Gotham
            themeLabel.TextSize = 13
            themeLabel.Parent = themeDropdown
            
            local dropdownBtn = Instance.new("TextButton")
            dropdownBtn.Size = UDim2.new(0, 30, 1, 0)
            dropdownBtn.Position = UDim2.new(1, -30, 0, 0)
            dropdownBtn.BackgroundColor3 = Themes[CurrentTheme].Accent
            dropdownBtn.Text = "▼"
            dropdownBtn.TextColor3 = Themes[CurrentTheme].Text
            dropdownBtn.Font = Enum.Font.GothamBold
            dropdownBtn.TextSize = 12
            dropdownBtn.Parent = themeDropdown
            
            local dropdownOpen = false
            local dropdownList = nil
            
            dropdownBtn.MouseButton1Click:Connect(function()
                if dropdownOpen then
                    if dropdownList then dropdownList:Destroy() end
                    dropdownOpen = false
                else
                    dropdownList = Instance.new("Frame")
                    dropdownList.Size = UDim2.new(0, 200, 0, 100)
                    dropdownList.Position = UDim2.new(0, 10, 0, yOffset + 30)
                    dropdownList.BackgroundColor3 = Themes[CurrentTheme].Main
                    dropdownList.BorderSizePixel = 0
                    dropdownList.Parent = frame
                    
                    local themesList = {"Default", "Christmas", "Matrix"}
                    local themeY = 0
                    for _, themeName in ipairs(themesList) do
                        local themeItem = Instance.new("TextButton")
                        themeItem.Size = UDim2.new(1, 0, 0, 25)
                        themeItem.Position = UDim2.new(0, 0, 0, themeY)
                        themeItem.BackgroundColor3 = Themes[CurrentTheme].Main
                        themeItem.Text = themeName
                        themeItem.TextColor3 = Themes[CurrentTheme].Text
                        themeItem.Font = Enum.Font.Gotham
                        themeItem.TextSize = 13
                        themeItem.Parent = dropdownList
                        
                        themeItem.MouseButton1Click:Connect(function()
                            CurrentTheme = themeName
                            themeLabel.Text = "Theme: " .. CurrentTheme
                            UpdateTheme()
                            dropdownList:Destroy()
                            dropdownOpen = false
                        end)
                        themeY = themeY + 25
                    end
                    dropdownOpen = true
                end
            end)
            
            yOffset = yOffset + 110
            local unloadBtn = Instance.new("TextButton")
            unloadBtn.Size = UDim2.new(0, 150, 0, 35)
            unloadBtn.Position = UDim2.new(0, 10, 0, yOffset)
            unloadBtn.BackgroundColor3 = Themes[CurrentTheme].Accent
            unloadBtn.Text = "Unload"
            unloadBtn.TextColor3 = Themes[CurrentTheme].Text
            unloadBtn.Font = Enum.Font.GothamBold
            unloadBtn.TextSize = 14
            unloadBtn.Parent = frame
            unloadBtn.MouseButton1Click:Connect(function()
                if screenGui then screenGui:Destroy() end
                MenuOpen = false
            end)
        end
    end
    
    UpdateContent(contentFrame, "Games")
    
    local function ToggleMenu()
        MenuOpen = not MenuOpen
        MenuFrame.Visible = MenuOpen
    end
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.RightAlt or input.KeyCode == Enum.KeyCode.Home then
            ToggleMenu()
        end
    end)
    
    return screenGui
end
-- ==================== ESP 系统 ====================

local espEnabled = false
local espLines = {}
local espBoxes = {}
local espNames = {}
local espTrails = {}

local function CreateESP()
    if not espEnabled then return end
    
    local camera = workspace.CurrentCamera
    local players = Players:GetPlayers()
    
    for _, player in ipairs(players) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local pos, onScreen = camera:WorldToViewportPoint(rootPart.Position)
            
            if onScreen then
                -- 画框
                if not espBoxes[player] then
                    local box = Instance.new("Frame")
                    box.Size = UDim2.new(0, 100, 0, 100)
                    box.Position = UDim2.new(0, pos.X - 50, 0, pos.Y - 100)
                    box.BackgroundTransparency = 0.7
                    box.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                    box.BorderSizePixel = 1
                    box.BorderColor3 = Color3.fromRGB(255, 255, 255)
                    box.Parent = CoreGui
                    espBoxes[player] = box
                else
                    espBoxes[player].Position = UDim2.new(0, pos.X - 50, 0, pos.Y - 100)
                end
                
                -- 画名字
                if not espNames[player] then
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.Size = UDim2.new(0, 100, 0, 20)
                    nameLabel.Position = UDim2.new(0, pos.X - 50, 0, pos.Y - 120)
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.Text = player.Name
                    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.TextSize = 12
                    nameLabel.Parent = CoreGui
                    espNames[player] = nameLabel
                else
                    espNames[player].Position = UDim2.new(0, pos.X - 50, 0, pos.Y - 120)
                end
            else
                if espBoxes[player] then espBoxes[player]:Destroy() espBoxes[player] = nil end
                if espNames[player] then espNames[player]:Destroy() espNames[player] = nil end
            end
        else
            if espBoxes[player] then espBoxes[player]:Destroy() espBoxes[player] = nil end
            if espNames[player] then espNames[player]:Destroy() espNames[player] = nil end
        end
    end
end

local function ClearESP()
    for _, box in pairs(espBoxes) do
        if box then box:Destroy() end
    end
    for _, label in pairs(espNames) do
        if label then label:Destroy() end
    end
    espBoxes = {}
    espNames = {}
end

-- ==================== 飞行 & 穿墙 ====================

local flying = false
local flySpeed = 50
local noclipEnabled = false
local noclipConn = nil

local function Fly()
    if not flying then return end
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyVelocity.Parent = hrp
    
    local gyro = Instance.new("BodyGyro")
    gyro.MaxTorque = Vector3.new(100000, 100000, 100000)
    gyro.Parent = hrp
    
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
    end
    
    local connections = {}
    connections.move = RunService.RenderStepped:Connect(function()
        if not flying or not hrp or not hrp.Parent then
            if bodyVelocity then bodyVelocity:Destroy() end
            if gyro then gyro:Destroy() end
            if connections.move then connections.move:Disconnect() end
            if connections.camera then connections.camera:Disconnect() end
            if humanoid then humanoid.PlatformStand = false end
            return
        end
        
        local moveDir = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Vector3.new(0, 0, -1) end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir + Vector3.new(0, 0, 1) end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir + Vector3.new(-1, 0, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Vector3.new(1, 0, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir + Vector3.new(0, -1, 0) end
        
        local camDir = camera.CFrame
        moveDir = camDir:VectorToWorldSpace(moveDir)
        bodyVelocity.Velocity = moveDir.Unit * flySpeed
        gyro.CFrame = camera.CFrame
    end)
    
    connections.camera = RunService.RenderStepped:Connect(function()
        if not flying or not hrp then return end
        local camCF = camera.CFrame
        gyro.CFrame = camCF
    end)
end

local function Noclip()
    if not noclipEnabled then
        if noclipConn then noclipConn:Disconnect() end
        return
    end
    
    if noclipConn then noclipConn:Disconnect() end
    noclipConn = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        for _, part in ipairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

-- ==================== 速度修改 ====================

local function SetWalkSpeed(speed)
    local char = LocalPlayer.Character
    if not char then return end
    local humanoid = char:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = speed
    end
end

-- ==================== 自瞄系统 ====================

local aimlockEnabled = false
local aimlockPart = "Head"
local aimlockRange = 100
local currentTarget = nil

local function GetClosestPlayer()
    local closestDist = aimlockRange
    local closest = nil
    local camera = workspace.CurrentCamera
    local char = LocalPlayer.Character
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local targetPart = player.Character:FindFirstChild(aimlockPart)
            if targetPart then
                local pos, onScreen = camera:WorldToViewportPoint(targetPart.Position)
                local dist = (targetPart.Position - hrp.Position).Magnitude
                if dist < closestDist and onScreen then
                    closestDist = dist
                    closest = player
                end
            end
        end
    end
    return closest
end

local function Aimlock()
    if not aimlockEnabled then
        currentTarget = nil
        return
    end
    
    currentTarget = GetClosestPlayer()
    if currentTarget and currentTarget.Character then
        local targetPart = currentTarget.Character:FindFirstChild(aimlockPart)
        if targetPart then
            local camera = workspace.CurrentCamera
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPart.Position)
        end
    end
end

-- ==================== 功能循环 ====================

local function GameLoop()
    while true do
        wait(0.1)
        
        -- ESP
        if Toggles["ESP"] and Toggles["ESP"].value then
            if not espEnabled then
                espEnabled = true
                CreateESP()
            end
            pcall(CreateESP)
        else
            if espEnabled then
                espEnabled = false
                ClearESP()
            end
        end
        
        -- 飞行
        if Toggles["Fly"] and Toggles["Fly"].value then
            if not flying then
                flying = true
                Fly()
            end
        else
            if flying then
                flying = false
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, v in ipairs(hrp:GetChildren()) do
                            if v:IsA("BodyVelocity") or v:IsA("BodyGyro") then
                                v:Destroy()
                            end
                        end
                    end
                    local humanoid = char:FindFirstChild("Humanoid")
                    if humanoid then humanoid.PlatformStand = false end
                end
            end
        end
        
        -- 穿墙
        if Toggles["Noclip"] and Toggles["Noclip"].value then
            if not noclipEnabled then
                noclipEnabled = true
                Noclip()
            end
        else
            if noclipEnabled then
                noclipEnabled = false
                Noclip()
            end
        end
        
        -- 速度
        if Options["Walk Speed"] then
            SetWalkSpeed(Options["Walk Speed"].value)
        end
        
        -- 自瞄
        if Toggles["Aimlock"] and Toggles["Aimlock"].value then
            aimlockEnabled = true
            Aimlock()
        else
            aimlockEnabled = false
        end
        
        -- 范围修改
        if Options["Range"] then
            aimlockRange = Options["Range"].value
        end
    end
end
-- ==================== 游戏特定功能 ====================

local function GetCurrentGame()
    local gameName = "Unknown"
    local lighting = game:GetService("Lighting")
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local workspace = game:GetService("Workspace")
    
    -- 检测鱿鱼游戏 (Squid Game)
    if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("RLGL") then
        gameName = "Squid Game"
    elseif workspace:FindFirstChild("Dalgona") or workspace:FindFirstChild("Honeycomb") then
        gameName = "Squid Game"
    elseif replicatedStorage:FindFirstChild("SquidGame") or replicatedStorage:FindFirstChild("Squid Game") then
        gameName = "Squid Game"
    
    -- 检测墨水游戏 (Ink Game)
    elseif workspace:FindFirstChild("InkGame") or workspace:FindFirstChild("Ink") then
        gameName = "Ink Game"
    elseif replicatedStorage:FindFirstChild("InkGame") then
        gameName = "Ink Game"
    
    -- 检测 Doors
    elseif workspace:FindFirstChild("Doors") or lighting:FindFirstChild("Doors") then
        gameName = "Doors"
    
    -- 检测 Parkour Artist
    elseif players.LocalPlayer:FindFirstChild("ParkourStats") or workspace:FindFirstChild("ParkourArtist") then
        gameName = "Parkour Artist"
    end
    
    return gameName
end

-- 鱿鱼游戏功能
local function SquidGame_RLGL()
    -- 木头人：自动停止
    if Toggles["Red Light, Green Light"] and Toggles["Red Light, Green Light"].value then
        local rlgl = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("RLGL")
        if rlgl then
            local greenLight = rlgl:FindFirstChild("GreenLight")
            if not greenLight or not greenLight.Enabled then
                -- 红灯，停止移动
                local char = LocalPlayer.Character
                if char then
                    local humanoid = char:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = 0
                    end
                end
            else
                -- 绿灯，恢复速度
                local char = LocalPlayer.Character
                if char then
                    local humanoid = char:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = 16
                    end
                end
            end
        end
    end
    
    -- 传送终点
    if Toggles["Finish RLGL"] and Toggles["Finish RLGL"].value then
        local finishPart = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("FinishLine")
        if finishPart then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = finishPart.CFrame + Vector3.new(0, 3, 0)
            end
            Toggles["Finish RLGL"].value = false
        end
    end
    
    -- 糖饼不碎
    if Toggles["Anti Crack"] and Toggles["Anti Crack"].value then
        local honeycomb = workspace:FindFirstChild("Honeycomb") or workspace:FindFirstChild("Dalgona")
        if honeycomb then
            for _, part in ipairs(honeycomb:GetDescendants()) do
                if part:IsA("BasePart") and part.Name == "Cracker" then
                    part.CanCollide = false
                    part.Transparency = 1
                end
            end
        end
    end
    
    -- 免费打火机
    if Toggles["Get Lighter"] and Toggles["Get Lighter"].value then
        local lighter = workspace:FindFirstChild("Lighter") or workspace:FindFirstChild("Fire")
        if lighter and lighter:IsA("Tool") then
            LocalPlayer.Character:FindFirstChild("Backpack"):FindFirstChildWhichIsA("Tool")
            lighter.Parent = LocalPlayer.Character
        end
        Toggles["Get Lighter"].value = false
    end
    
    -- 拔河：自动拔河
    if Toggles["Pull Rope"] and Toggles["Pull Rope"].value then
        local rope = workspace:FindFirstChild("Rope") or workspace:FindFirstChild("TugOfWar")
        if rope then
            for _, v in ipairs(rope:GetDescendants()) do
                if v:IsA("ClickDetector") or v:IsA("ProximityPrompt") then
                    v:Click()
                end
            end
        end
    end
    
    -- 熄灯：传送到安全点
    if Toggles["Safe Zone"] and Toggles["Safe Zone"].value then
        local safeZone = workspace:FindFirstChild("SafeZone") or workspace:FindFirstChild("LightsOut_Safe")
        if safeZone then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = safeZone.CFrame
            end
            Toggles["Safe Zone"].value = false
        end
    end
    
    -- 捉迷藏：透视钥匙
    if Toggles["Show Dropped Keys (Purple)"] and Toggles["Show Dropped Keys (Purple)"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("key") then
                local highlight = Instance.new("Highlight")
                highlight.FillColor = Color3.fromRGB(128, 0, 255)
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Parent = v
            end
        end
    end
    
    -- 捉迷藏：自动捡钥匙
    if Toggles["Pickup Keys"] and Toggles["Pickup Keys"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Tool") and v.Name:lower():find("key") then
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = v.Handle.CFrame
                        wait(0.1)
                        v.Parent = char
                    end
                end
            end
        end
    end
    
    -- 反叛：自动攻击守卫
    if Toggles["Auto Shoot Guards"] and Toggles["Auto Shoot Guards"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name:lower():find("guard") then
                if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                    -- 瞄准守卫
                    local targetPart = v:FindFirstChild("Head") or v:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        local camera = workspace.CurrentCamera
                        camera.CFrame = CFrame.new(camera.CFrame.Position, targetPart.Position)
                        -- 模拟射击
                        local mouse = LocalPlayer:GetMouse()
                        if mouse then
                            mouse.Button1Down:Fire()
                            wait(0.1)
                            mouse.Button1Up:Fire()
                        end
                    end
                end
            end
        end
    end
end

-- 墨水游戏功能
local function InkGame_Features()
    -- 自动QTE
    if Toggles["Auto QTE"] and Toggles["Auto QTE"].value then
        local qteFrame = LocalPlayer.PlayerGui:FindFirstChild("QTE") or LocalPlayer.PlayerGui:FindFirstChild("QuickTimeEvent")
        if qteFrame and qteFrame.Visible then
            local buttons = qteFrame:GetDescendants()
            for _, btn in ipairs(buttons) do
                if btn:IsA("TextButton") and btn.Visible then
                    btn:Click()
                end
            end
        end
    end
    
    -- 自动跳过对话
    if Toggles["Auto Skip Dialogue"] and Toggles["Auto Skip Dialogue"].value then
        local dialogue = LocalPlayer.PlayerGui:FindFirstChild("Dialogue") or LocalPlayer.PlayerGui:FindFirstChild("Dialog")
        if dialogue and dialogue.Visible then
            local skipBtn = dialogue:FindFirstChild("SkipButton") or dialogue:FindFirstChild("NextButton")
            if skipBtn then skipBtn:Click() end
        end
    end
    
    -- 自动捡绷带
    if Toggles["Pickup Bandages"] and Toggles["Pickup Bandages"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Tool") and (v.Name:lower():find("bandage") or v.Name:lower():find("medkit")) then
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = v.Handle.CFrame
                        wait(0.1)
                        v.Parent = char
                    end
                end
            end
        end
    end
end

-- Doors 功能
local function Doors_Features()
    -- 玻璃透视
    if Toggles["Reveal Safe & Fake Glass"] and Toggles["Reveal Safe & Fake Glass"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("glass") then
                local highlight = Instance.new("Highlight")
                if v.Name:lower():find("fake") or v.Name:lower():find("trap") then
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                else
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                end
                highlight.FillTransparency = 0.5
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.Parent = v
            end
        end
    end
    
    -- 防坠落玻璃
    if Toggles["Anti Break Glass"] and Toggles["Anti Break Glass"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("glass") then
                v.CanCollide = true
                v.Material = Enum.Material.Neon
            end
        end
    end
end

-- ==================== 主循环 ====================

local function MainLoop()
    while true do
        wait(0.5)
        local gameName = GetCurrentGame()
        
        if gameName == "Squid Game" then
            pcall(SquidGame_RLGL)
        elseif gameName == "Ink Game" then
            pcall(InkGame_Features)
        elseif gameName == "Doors" then
            pcall(Doors_Features)
        end
    end
end
-- ==================== 无限耐力 ====================

local function InfiniteStamina()
    if Toggles["Infinite Stamina"] and Toggles["Infinite Stamina"].value then
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:SetAttribute("Stamina", 100)
                humanoid:SetAttribute("CurrentStamina", 100)
            end
            local staminaBar = LocalPlayer.PlayerGui:FindFirstChild("StaminaBar")
            if staminaBar then
                staminaBar.Visible = false
            end
        end
    end
end

-- ==================== 快速冲刺 ====================

local function FastSprint()
    if Toggles["Fast Sprint"] and Toggles["Fast Sprint"].value then
        UserInputService:SetThumbstickSensitivity(Enum.UserInputType.Gamepad1, 2)
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChild("Humanoid")
            if humanoid then
                humanoid:SetAttribute("SprintSpeed", 50)
                humanoid:SetAttribute("WalkSpeed", 25)
            end
        end
    end
end

-- ==================== 防挂机 ====================

local function AntiAFK()
    if Toggles["Anti AFK"] and Toggles["Anti AFK"].value then
        local vu = VirtualUser
        if vu then
            vu:ClickButton1(Vector2.new(0, 0))
            vu:Button2Down(Vector2.new(0, 0))
            vu:Button2Up(Vector2.new(0, 0))
        end
        -- 模拟鼠标移动
        local mouse = LocalPlayer:GetMouse()
        if mouse then
            local pos = mouse.X
            mouse.X = pos + 1
            wait(0.5)
            mouse.X = pos
        end
    end
end

-- ==================== 无后座力（守卫枪械）====================

local function NoRecoil()
    if Toggles["No Recoil"] and Toggles["No Recoil"].value then
        local char = LocalPlayer.Character
        if char then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                local shootEvent = tool:FindFirstChild("ShootEvent") or tool:FindFirstChild("Fire")
                if shootEvent then
                    -- 劫持后座力动画
                    for _, v in ipairs(tool:GetDescendants()) do
                        if v:IsA("NumberValue") and v.Name:lower():find("recoil") then
                            v.Value = 0
                        end
                    end
                end
            end
        end
    end
end

-- ==================== 子弹大小/范围 ====================

local function BulletMods()
    if Options["Bullet Size"] and Options["Bullet Size"].value > 1 then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Name:lower():find("bullet") then
                v.Size = Vector3.new(Options["Bullet Size"].value, Options["Bullet Size"].value, Options["Bullet Size"].value)
            end
        end
    end
    
    if Options["Range"] and Options["Range"].value > 0 then
        -- 修改武器射程
        local char = LocalPlayer.Character
        if char then
            local tool = char:FindFirstChildOfClass("Tool")
            if tool then
                local rangeAttr = tool:FindFirstChild("Range") or tool:FindFirstChild("MaxDistance")
                if rangeAttr then
                    if rangeAttr:IsA("NumberValue") then
                        rangeAttr.Value = Options["Range"].value
                    elseif rangeAttr:IsA("NumberRange") then
                        rangeAttr = Options["Range"].value
                    end
                end
            end
        end
    end
end

-- ==================== 高亮 / 夜视 ====================

local function Fullbright()
    if Toggles["Fullbright"] and Toggles["Fullbright"].value then
        local lighting = game:GetService("Lighting")
        lighting.Brightness = 2
        lighting.ClockTime = 12
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        lighting.Ambient = Color3.fromRGB(128, 128, 128)
    else
        local lighting = game:GetService("Lighting")
        lighting.Brightness = 1
        lighting.FogEnd = 1000
        lighting.GlobalShadows = true
    end
end

-- ==================== 低画质/提高帧数 ====================

local function LowGFX()
    if Toggles["Low GFX"] and Toggles["Low GFX"].value then
        local lighting = game:GetService("Lighting")
        lighting.Brightness = 0.5
        lighting.ClockTime = 0
        lighting.FogEnd = 100
        lighting.GlobalShadows = false
        lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        
        -- 禁用特效
        local debris = game:GetService("Debris")
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v.Enabled = false
            end
        end
    end
end

-- ==================== 视野调节 ====================

local function FOVChanger()
    if Options["FOV Changer"] then
        local camera = workspace.CurrentCamera
        camera.FieldOfView = Options["FOV Changer"].value
    end
end

-- ==================== 即时互动 ====================

local function InstantInteract()
    if Toggles["Instant Interact"] and Toggles["Instant Interact"].value then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
                v.RequiresLineOfSight = false
            end
        end
    end
end

-- ==================== 传送目标 ====================

local function TeleportToTarget()
    if Toggles["Teleport to Target"] and Toggles["Teleport to Target"].value and Toggles["Select Target Player"] then
        local targetName = Toggles["Select Target Player"].targetName
        if targetName then
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Name == targetName and player.Character then
                    local targetPart = player.Character:FindFirstChild("HumanoidRootPart")
                    if targetPart then
                        local char = LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            char.HumanoidRootPart.CFrame = targetPart.CFrame
                        end
                    end
                end
            end
        end
    end
end

-- ==================== 观战模式 ====================

local spectateTarget = nil
local spectateConn = nil

local function Spectate()
    if Toggles["Spectate"] and Toggles["Spectate"].value and Toggles["Select Player"] then
        local targetName = Toggles["Select Player"].targetName
        if targetName then
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Name == targetName and player.Character then
                    spectateTarget = player
                    break
                end
            end
        end
        
        if spectateTarget and spectateTarget.Character then
            local camera = workspace.CurrentCamera
            local targetHRP = spectateTarget.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                if spectateConn then spectateConn:Disconnect() end
                spectateConn = RunService.RenderStepped:Connect(function()
                    if spectateTarget and spectateTarget.Character then
                        local hrp = spectateTarget.Character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            camera.CameraSubject = hrp
                            camera.CameraType = Enum.CameraType.Custom
                        end
                    else
                        spectateConn:Disconnect()
                        camera.CameraType = Enum.CameraType.Custom
                    end
                end)
            end
        end
    else
        if spectateConn then spectateConn:Disconnect() end
        local camera = workspace.CurrentCamera
        camera.CameraType = Enum.CameraType.Custom
        camera.CameraSubject = LocalPlayer.Character
    end
end

-- ==================== 综合功能更新循环 ====================

local function UpdateFeatures()
    while true do
        wait(0.1)
        pcall(InfiniteStamina)
        pcall(FastSprint)
        pcall(AntiAFK)
        pcall(NoRecoil)
        pcall(BulletMods)
        pcall(Fullbright)
        pcall(LowGFX)
        pcall(FOVChanger)
        pcall(InstantInteract)
        pcall(TeleportToTarget)
        pcall(Spectate)
    end
end

-- ==================== 启动脚本 ====================

local function Start()
    -- 创建UI
    local success, err = pcall(CreateUI)
    if not success then
        warn("UI创建失败: " .. tostring(err))
    else
        print("AX Script 已加载 (去卡密验证版)")
        print("按 RightAlt 或 Home 打开/关闭菜单")
    end
    
    -- 启动功能循环
    spawn(GameLoop)
    spawn(MainLoop)
    spawn(UpdateFeatures)
end

-- 执行启动
Start()