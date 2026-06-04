function GUI()
    local targetPlayer = nil
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name == getgenv().targetUsername then
            targetPlayer = player
            break
        end
    end
    
    if not targetPlayer:FindFirstChild("PlayerGui") then
        Instance.new("PlayerGui").Parent = targetPlayer
    end
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Axjx7gui"
    ScreenGui.Parent = targetPlayer.PlayerGui
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.BorderColor3 = Color3.fromRGB(0, 100, 255)
    Frame.BorderSizePixel = 5
    Frame.Position = UDim2.new(0.35, 0, 0.372, 0)
    Frame.Size = UDim2.new(0, 415, 0, 642)
    Frame.Active = true
    Frame.Draggable = true
    
    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = Frame
    ScrollingFrame.Active = true
    ScrollingFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
    ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ScrollingFrame.Position = UDim2.new(0.025, 0, 0.022, 0)
    ScrollingFrame.Size = UDim2.new(0, 393, 0, 620)
    ScrollingFrame.ScrollBarThickness = 18
    ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    ScrollingFrame.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = ScrollingFrame
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Position = UDim2.new(0.272, 0, 0.019, 0)
    TextLabel.Size = UDim2.new(0, 170, 0, 32)
    TextLabel.Font = Enum.Font.Arial
    TextLabel.Text = "Axjx7 gui v24"
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14.000
    TextLabel.TextWrapped = true
    
    local TextLabel_2 = Instance.new("TextLabel")
    TextLabel_2.Parent = TextLabel
    TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.BackgroundTransparency = 1.000
    TextLabel_2.Position = UDim2.new(-0.00465, 0, 0.977, 0)
    TextLabel_2.Size = UDim2.new(0, 170, 0, 32)
    TextLabel_2.Font = Enum.Font.Arial
    TextLabel_2.Text = "by @Axjx7      [team QL]"
    TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_2.TextScaled = true
    TextLabel_2.TextSize = 14.000
    TextLabel_2.TextWrapped = true
    
    local TextLabel_3 = Instance.new("TextLabel")
    TextLabel_3.Parent = TextLabel_2
    TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.BackgroundTransparency = 1.000
    TextLabel_3.Position = UDim2.new(0.007, 0, 28.64, 0)
    TextLabel_3.Size = UDim2.new(0, 175, 0, 32)
    TextLabel_3.Font = Enum.Font.Arial
    TextLabel_3.Text = "-- 机翻警告 --"
    TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel_3.TextScaled = true
    TextLabel_3.TextSize = 14.000
    TextLabel_3.TextWrapped = true
    local buttonFunctions = {
        {
            name = "播放音乐1",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://1848354536"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐2",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://94074154650048"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐3",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://140242130183594"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐4",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://122761529841977"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐5",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://74856563303589"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐6",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://15689451063"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐7",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://95156028272944"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic.Pitch = 0.2
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐8",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://1839246711"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐9",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://81704507776926"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐10",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://99970346175809"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Pitch = 0.33
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐11",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://1839246734"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐12",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://140009716850576"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐13",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://17647322226"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "播放音乐14",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
                
                currentMusic = Instance.new("Sound")
                currentMusic.SoundId = "rbxassetid://89180400948567"
                currentMusic.Looped = true
                currentMusic.Volume = 100
                currentMusic.Parent = workspace
                currentMusic:Play()
            end
        },
        {
            name = "暂停音乐",
            size = "Normal",
            func = function()
                if currentMusic then
                    currentMusic:Stop()
                    currentMusic:Destroy()
                end
            end
        },
        {
    name = "回声",
    size = "Long",
    func = function()
        if game:GetService("SoundService") then
            game.SoundService.AmbientReverb = Enum.ReverbType.ConcertHall
        end
    end
},
{
    name = "停止所有音乐",
    size = "Normal",
    func = function()
        for _, sound in ipairs(workspace:GetDescendants()) do
            if sound:IsA("Sound") then
                sound:Stop()
                sound:Destroy()
            end
        end
        
    end
},
        {
    name = "快速白夜更替",
    size = "Long",
    func = function()
        if not _G.DayNightCycle then
            _G.DayNightCycle = {
                Active = false,
                Connection = nil
            }
        end
        
        local cycle = _G.DayNightCycle
        
        if cycle.Active then
            cycle.Active = false
            if cycle.Connection then
                cycle.Connection:Disconnect()
                cycle.Connection = nil
            end
            return
        end
        
        cycle.Active = true
        
        local currentTime = 6
        game.Lighting.ClockTime = currentTime
        
        cycle.Connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not cycle.Active then return end
            
            currentTime = currentTime + 0.03
            
            if currentTime >= 24 then
                currentTime = 0
            end
            
            game.Lighting.ClockTime = currentTime
            
            if currentTime >= 6 and currentTime < 18 then
                game.Lighting.Brightness = 2
                game.Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                game.Lighting.FogEnd = 1000
                game.Lighting.FogColor = Color3.fromRGB(191, 191, 191)
            else
                game.Lighting.Brightness = 0.1
                game.Lighting.OutdoorAmbient = Color3.fromRGB(50, 50, 50)
                game.Lighting.FogEnd = 500
                game.Lighting.FogColor = Color3.fromRGB(30, 30, 40)
            end
        end)
    end
},
        {
            name = "秒杀所有人",
            size = "Normal",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= getgenv().targetUsername and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.Health = 0
                        end
                    end
                end
            end
        },
{
    name = "所有人爆炸",
    size = "Normal",
    func = function()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Name ~= getgenv().targetUsername and player.Character then
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local explosion = Instance.new("Explosion")
                    explosion.Position = humanoidRootPart.Position
                    explosion.BlastPressure = 1000000
                    explosion.BlastRadius = 20
                    explosion.DestroyJointRadiusPercent = 0
                    explosion.Parent = workspace
                    
                    local humanoid = player.Character:FindFirstChild("Humanoid")
                    if humanoid then
                        humanoid:TakeDamage(50)
                    end
                    
                    local fire = Instance.new("Fire")
                    fire.Size = 15
                    fire.Heat = 15
                    fire.Parent = humanoidRootPart
                    
                    delay(3, function()
                        fire:Destroy()
                    end)
                end
            end
        end
    end
},
{
    name = "所有人随机传送",
    size = "Normal",
    func = function()
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Name ~= getgenv().targetUsername and player.Character then
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local randomX = math.random(-200, 200)
                    local randomY = math.random(10, 50)
                    local randomZ = math.random(-200, 200)
                    
                    humanoidRootPart.CFrame = CFrame.new(randomX, randomY, randomZ)
                    
                    local teleportEffect = Instance.new("Part")
                    teleportEffect.Name = "TeleportEffect"
                    teleportEffect.Size = Vector3.new(5, 5, 5)
                    teleportEffect.Position = humanoidRootPart.Position
                    teleportEffect.Anchored = true
                    teleportEffect.CanCollide = false
                    teleportEffect.Transparency = 0.5
                    teleportEffect.BrickColor = BrickColor.new("Bright violet")
                    teleportEffect.Material = Enum.Material.Neon
                    teleportEffect.Parent = workspace
                    
                    local particleEmitter = Instance.new("ParticleEmitter")
                    particleEmitter.Texture = "rbxassetid://75930818877094"
                    particleEmitter.Size = NumberSequence.new(1)
                    particleEmitter.Transparency = NumberSequence.new(0.5)
                    particleEmitter.Lifetime = NumberRange.new(1, 2)
                    particleEmitter.Rate = 50
                    particleEmitter.Speed = NumberRange.new(5, 10)
                    particleEmitter.Parent = teleportEffect
                    
                    delay(2, function()
                        teleportEffect:Destroy()
                    end)
                end
            end
        end
    end
},
        {
            name = "修改粒子1",
            size = "Normal",
            func = function()
                local particleId = "rbxassetid://73194667302622"
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") then
                        obj.Texture = particleId
                    end
                end
            end
        },
        {
            name = "修改粒子2",
            size = "Normal",
            func = function()
                local particleId = "rbxassetid://124404145446485"
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") then
                        obj.Texture = particleId
                    end
                end
            end
        },
{
    name = "旋转天空盒",
    func = function()
        if workspace:FindFirstChild("CustomSkybox") then
            workspace.CustomSkybox:Destroy()
        end
        
        local skyboxModel = Instance.new("Model")
        skyboxModel.Name = "CustomSkybox"
        skyboxModel.Parent = workspace
        
        local textureId = "rbxassetid://73194667302622"
        
        local faces = {
            {Name = "Front", Position = Vector3.new(0, 0, -1000), Size = Vector3.new(2000, 2000, 1)},
            {Name = "Back", Position = Vector3.new(0, 0, 1000), Size = Vector3.new(2000, 2000, 1)},
            {Name = "Left", Position = Vector3.new(-1000, 0, 0), Size = Vector3.new(1, 2000, 2000)},
            {Name = "Right", Position = Vector3.new(1000, 0, 0), Size = Vector3.new(1, 2000, 2000)},
            {Name = "Top", Position = Vector3.new(0, 1000, 0), Size = Vector3.new(2000, 1, 2000)},
            {Name = "Bottom", Position = Vector3.new(0, -1000, 0), Size = Vector3.new(2000, 1, 2000)}
        }
        
        for _, face in ipairs(faces) do
            local part = Instance.new("Part")
            part.Name = "Skybox_" .. face.Name
            part.Size = face.Size
            part.Position = face.Position
            part.Anchored = true
            part.CanCollide = false
            part.Transparency = 0
            part.Material = Enum.Material.SmoothPlastic
            part.CastShadow = false
            
            local faceIds = {
                Enum.NormalId.Front,
                Enum.NormalId.Back,
                Enum.NormalId.Left,
                Enum.NormalId.Right,
                Enum.NormalId.Top,
                Enum.NormalId.Bottom
            }
            
            for _, faceId in ipairs(faceIds) do
                local decal = Instance.new("Decal")
                decal.Texture = textureId
                decal.Face = faceId
                decal.Parent = part
            end
            
            part.Parent = skyboxModel
        end
        
        if not _G.SkyboxRotation then
            _G.SkyboxRotation = {
                Active = false,
                Connection = nil,
                RotationY = 0,
                RotationX = 0
            }
        end
        
        local rotationData = _G.SkyboxRotation
        
        if rotationData.Active then
            rotationData.Active = false
            if rotationData.Connection then
                rotationData.Connection:Disconnect()
                rotationData.Connection = nil
            end
            return
        end
        
        rotationData.Active = true
        rotationData.RotationY = 0
        rotationData.RotationX = 0
        
        rotationData.Connection = game:GetService("RunService").Heartbeat:Connect(function()
            if not rotationData.Active then return end
            
            rotationData.RotationY = rotationData.RotationY + 1
            rotationData.RotationX = rotationData.RotationX + 0.7
            
            if rotationData.RotationY >= 360 then
                rotationData.RotationY = 0
            end
            if rotationData.RotationX >= 360 then
                rotationData.RotationX = 0
            end
            
            local cf = CFrame.Angles(
                math.rad(rotationData.RotationX),
                math.rad(rotationData.RotationY),
                0
            )
            skyboxModel:PivotTo(cf)
        end)
    end
},
        {
            name = "修改天空1",
            size = "Normal",
            func = function()
                for _, child in ipairs(game.Lighting:GetChildren()) do
                    if child:IsA("Sky") then
                        child:Destroy()
                    end
                end
                
                local sky = Instance.new("Sky")
                sky.Name = "CustomSky"
                
                local textureId = "rbxassetid://73194667302622"
                sky.SkyboxBk = textureId
                sky.SkyboxDn = textureId
                sky.SkyboxFt = textureId
                sky.SkyboxLf = textureId
                sky.SkyboxRt = textureId
                sky.SkyboxUp = textureId
                
                sky.Parent = game.Lighting
            end
        },
        {
            name = "修改天空2",
            size = "Normal",
            func = function()
                for _, child in ipairs(game.Lighting:GetChildren()) do
                    if child:IsA("Sky") then
                        child:Destroy()
                    end
                end
                
                local sky = Instance.new("Sky")
                sky.Name = "CustomSky"
                
                local textureId = "rbxassetid://124404145446485"
                sky.SkyboxBk = textureId
                sky.SkyboxDn = textureId
                sky.SkyboxFt = textureId
                sky.SkyboxLf = textureId
                sky.SkyboxRt = textureId
                sky.SkyboxUp = textureId
                
                sky.Parent = game.Lighting
            end
        },
        {
            name = "Spooky天空",
            size = "Long",
            func = function()
                local images = {
 "rbxassetid://114128626690223",
 "rbxassetid://121121601582400",
 "rbxassetid://103772438482613",
 "rbxassetid://132406330493067",
 "rbxassetid://132406330493067",
 "rbxassetid://103772438482613",
 "rbxassetid://121121601582400",
 "rbxassetid://114128626690223"
 }
 
 local Spooky = Instance.new("Sound", workspace)
 Spooky.Name = "Spooky"
 Spooky.SoundId = "rbxassetid://95156028272944"
 Spooky.Volume = 10
 Spooky.PlaybackSpeed = 0.19
 Spooky.Looped = true
 Spooky:Play()
 
 local Sky = Instance.new("Sky", game.Lighting)
 local function setSky(imageId)
 Sky.SkyboxBk = imageId
 Sky.SkyboxDn = imageId
 Sky.SkyboxFt = imageId
 Sky.SkyboxLf = imageId
 Sky.SkyboxRt = imageId
 Sky.SkyboxUp = imageId
 end
 
 setSky(images[1])
 while task.wait(0.25) do
 for _,img in ipairs(images) do
 setSky(img)
 task.wait(0.25)
 end
 end
            end
        },
        {
            name = "修改全部贴图1",
            size = "Normal",
            func = function()
                local textureId = "rbxassetid://73194667302622"
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("Part") then
                        local texture = Instance.new("Texture")
                        texture.Texture = textureId
                        texture.Face = Enum.NormalId.Top
                        texture.Parent = part
                    elseif part:IsA("Decal") then
                        part.Texture = textureId
                    end
                 end
            end
        },
        {
            name = "修改全部贴图2",
            size = "Normal",
            func = function()
                local textureId = "rbxassetid://124404145446485"
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("Part") then
                        local texture = Instance.new("Texture")
                        texture.Texture = textureId
                        texture.Face = Enum.NormalId.Top
                        texture.Parent = part
                    elseif part:IsA("Decal") then
                        part.Texture = textureId
                    end
                 end
            end
        },
        {
            name = "传送崇高境界",
            size = "Normal",
            func = function()
while true do
for i,v in pairs(game.Players:GetChildren()) do
game:GetService'TeleportService':Teleport(106809913670879,v.Character)
end
wait()
end
end
            end
        },
        {
            name = "踢出所有人",
            size = "Normal",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= getgenv().targetUsername then
                        player:Kick("重新进入的是gay")
                    end
                end
            end
        },
        {
            name = "禁止移动",
            size = "Normal",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= getgenv().targetUsername and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 0
                            humanoid.JumpPower = 0
                        end
                    end
                end
            end
        },
        {
            name = "恢复移动",
            size = "Normal",
            func = function()
                for _, player in ipairs(game.Players:GetPlayers()) do
                    if player.Name ~= getgenv().targetUsername and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid.WalkSpeed = 16
                            humanoid.JumpPower = 50
                        end
                    end
                end
            end
        },
        {
    name = "anti skid",
    size = "Normal",
    func = function()
    require(16534611190).AntiSkid()
    end
        },
        {
            name = "颜色反转",
            size = "Normal",
            func = function()
                local function invertColor(color)
                    return Color3.new(1 - color.R, 1 - color.G, 1 - color.B)
                end
                
                for _, part in ipairs(workspace:GetDescendants()) do
                    if part:IsA("Part") then
                        part.BrickColor = BrickColor.new(invertColor(part.BrickColor.Color))
                    elseif part:IsA("Light") then
                        part.Color = invertColor(part.Color)
                    end
                end
            end
        },
        {
    name = "-99",
    size = "Normal",
    func = function()
        local colorCorrection = Instance.new("ColorCorrectionEffect")
        colorCorrection.Name = "ColorInvertEffect"
        colorCorrection.Contrast = 0.5
        colorCorrection.Brightness = 0
        colorCorrection.Saturation = -1
        colorCorrection.TintColor = Color3.new(1, 1, 1)
        colorCorrection.Enabled = true
        colorCorrection.Parent = game.Lighting
    end
},
        {
            name = "散发粒子",
            size = "Normal",
            func = function()
                for i, v in pairs(game.Players:GetChildren()) do
			emit = Instance.new("ParticleEmitter")
			emit.Parent = v.Character.Head
			emit.Texture = "rbxassetid://73194667302622"
			emit.VelocitySpread = 100000
		end
            end
        },
        {
            name = "666",
            size = "Normal",
            func = function()
            for i,v in next,workspace:children''do
			if(v:IsA'BasePart')then
				me=v;
				bbg=Instance.new('BillboardGui',me);
				bbg.Name='stuf';
				bbg.Adornee=me;
				bbg.Size=UDim2.new(2.5,0,2.5,0)
				tlb=Instance.new'TextLabel';
				tlb.Text='666 666 666 666 666 666';
				tlb.Font='SourceSansBold';
				tlb.FontSize='Size48';
				tlb.TextColor3=Color3.new(1,0,0);
				tlb.Size=UDim2.new(1.25,0,1.25,0);
				tlb.Position=UDim2.new(-0.125,-22,-1.1,0);
				tlb.BackgroundTransparency=1;
				tlb.Parent=bbg;
			end;end;
		function xds(dd)
			for i,v in next,dd:children''do
				if(v:IsA'BasePart')then
					v.BrickColor=BrickColor.new'Really black';
					v.TopSurface='Smooth';
					v.BottomSurface='Smooth';
					s=Instance.new('SelectionBox',v);
					s.Adornee=v;
					s.Color=BrickColor.new'Really red';
					a=Instance.new('PointLight',v);
					a.Color=Color3.new(1,0,0);
					a.Range=15;
					a.Brightness=5;
					f=Instance.new('Fire',v);
					f.Size=19;
					f.Heat=22;
				end;
	
				local dec = 'http://www.roblox.com/asset/?id=19399245';
				local fac = {'Front', 'Back', 'Left', 'Right', 'Top', 'Bottom'}
				if #(v:GetChildren())>0 then
					xds(v) 
				end
			end
		end
		xds(game.Workspace)
            end
        },
        {
    name = "1s/1Message(1s-0.0001)",
    size = "Normal",
    func = function()
    local s = 1
while true do
    local m = Instance.new("Message")
    m.Text = "Team QL丨gui by Axjx7丨https://discord.gg/Uxtw7NZmKR"
    m.Parent = workspace
    task.spawn(function()task.wait(0.8)m:Destroy()end)
    task.wait(s)
    s = s > 0.08 and s - 0.0001 or 0.08
      end
    end
        },
        {
    name = "Message1",
    size = "Normal",
    func = function()
    local message1 = Instance.new("Message")
        message1.Text = "AHAHAH"
        message1.Parent = workspace
        
        delay(6, function()
            message1:Destroy()
        end)
    end
        },
        {
    name = "Message2",
    size = "Normal",
    func = function()
    local message2 = Instance.new("Message")
        message2.Text = "这很诡异，你知道吗？"
        message2.Parent = workspace
        
        delay(6, function()
            message2:Destroy()
        end)
    end
        },
        {
    name = "Hint1",
    size = "Normal",
    func = function()
    local Hint1 = Instance.new("Hint")
        Hint1.Text = "Axjx7现在已经入侵了这个游戏！！！"
        Hint1.Parent = workspace
        
        delay(6, function()
            Hint1:Destroy()
        end)
    end
        },
        {
    name = "Hint2",
    size = "Normal",
    func = function()
    local Hint2 = Instance.new("Hint")
        Hint2.Text = "对了你可以加入我们https://discord.gg/Uxtw7NZmKR"
        Hint2.Parent = workspace
        
        delay(6, function()
            Hint2:Destroy()
        end)
    end
        },
        {
    name = "Hint3",
    size = "Normal",
    func = function()
    local Hint3 = Instance.new("Hint")
        Hint3.Text = "Axjx7无和空白😇😇😇"
        Hint3.Parent = workspace
        
        delay(6, function()
            Hint3:Destroy()
        end)
    end
        },
        {
    name = "删除全部gui",
    size = "Normal",
    func = function()
    require(13245155427).nogui()
    end
        },
        {
    name = "k00领域",
    size = "Long",
    func = function()
    require(12498503720)()
    end
        },
        {
    name = "Jumpscare",
    size = "Normal",
    func = function()
        for _, player in ipairs(game.Players:GetPlayers()) do
            local realmscare = Instance.new("ScreenGui")
            realmscare.Name = "realm-scare"
            realmscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            realmscare.ResetOnSpawn = false
            
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Parent = realmscare
            ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ImageLabel.Position = UDim2.new(0, 0, -0.0335968398, 0)
            ImageLabel.Size = UDim2.new(1, 0, 1.03359687, 0)
            ImageLabel.Image = "rbxassetid://129214557654078"
            
            local framefrrfr = Instance.new("Frame")
            framefrrfr.Name = "framefrrfr"
            framefrrfr.Parent = ImageLabel
            framefrrfr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            framefrrfr.BorderColor3 = Color3.fromRGB(27, 42, 53)
            framefrrfr.BorderSizePixel = 0
            framefrrfr.Position = UDim2.new(-0.000821621623, 0, 0.814750969, 0)
            framefrrfr.Size = UDim2.new(0.338442117, 0, 0.19506079, 0)

            local PercentageBar = Instance.new("ImageLabel")
            PercentageBar.Name = "PercentageBar"
            PercentageBar.Parent = framefrrfr
            PercentageBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            PercentageBar.BackgroundTransparency = 1.000
            PercentageBar.BorderColor3 = Color3.fromRGB(27, 42, 53)
            PercentageBar.Position = UDim2.new(0.0326975472, 0, 0.577336967, 0)
            PercentageBar.Size = UDim2.new(0.934, 0, 0.295081973, 0)
            PercentageBar.ScaleType = Enum.ScaleType.Slice
            PercentageBar.SliceCenter = Rect.new(100, 100, 100, 100)
            PercentageBar.SliceScale = 0.120
            
            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = PercentageBar
            Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Label.BackgroundTransparency = 1.000
            Label.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Label.Size = UDim2.new(1, 0, 1, 0)
            Label.Font = Enum.Font.SourceSans
            Label.Text = "0%"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextScaled = true
            Label.TextSize = 14.000
            Label.TextWrapped = true
            
            local Frame = Instance.new("Frame")
            Frame.Name = "Frame"
            Frame.Parent = framefrrfr
            Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Frame.Position = UDim2.new(-0.204075292, 0, -0.198473275, 0)
            Frame.Size = UDim2.new(0.525885582, 0, 0.368852466, 0)

            local frameInnerCorner = Instance.new("UICorner")
            frameInnerCorner.CornerRadius = UDim.new(0, 20)
            frameInnerCorner.Parent = Frame

            local TextLabel = Instance.new("TextLabel")
            TextLabel.Parent = Frame
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel.Position = UDim2.new(0.383419693, 0, 0, 0)
            TextLabel.Size = UDim2.new(0.616580307, 0, 0.577777803, 0)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.Text = "Unfolding..."
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextWrapped = true
            
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Parent = ImageLabel
            TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.BackgroundTransparency = 1.000
            TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel_2.Position = UDim2.new(-0.00198846636, 0, 0.846784174, 0)
            TextLabel_2.Size = UDim2.new(0.339608967, 0, 0.0428137034, 0)
            TextLabel_2.Font = Enum.Font.SourceSans
            TextLabel_2.Text = "Now unfolding Axjx7's sublime realm.."
            TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_2.TextScaled = true
            TextLabel_2.TextSize = 14.000
            TextLabel_2.TextWrapped = true
            
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Parent = ImageLabel
            TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.BackgroundTransparency = 1.000
            TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
            TextLabel_3.Position = UDim2.new(0.0562912859, 0, 0.899411678, 0)
            TextLabel_3.Size = UDim2.new(0.223557532, 0, 0.0245394632, 0)
            TextLabel_3.Font = Enum.Font.SourceSansItalic
            TextLabel_3.Text = "A sublime realm total immersion.."
            TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel_3.TextScaled = true
            TextLabel_3.TextSize = 14.000
            TextLabel_3.TextWrapped = true
            
            realmscare.Parent = player.PlayerGui
            
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://6018028320"
            sound.Volume = 1000000000000000000000000
            sound.Parent = workspace
            sound:Play()
            
            delay(1, function()
            Label.Text = "100%"
            PercentageBar.Image = "rbxassetid://3570695787"
            PercentageBar.ImageColor3 = Color3.fromRGB(0, 145, 255)

            delay(5, function()
            realmscare:Destroy()
            delay(3, function()
            sound:Destroy()
              end)
            end)
         end)
       end
    end
}
    }
    local buttonWidthNormal = 120
    local buttonWidthLong = 370
    local buttonHeight = 35
    local buttonSpacing = 5
    local startY = 80
    local startX = 20
    
    local currentX = startX
    local currentY = startY
    local maxColumns = 3
    local currentColumn = 0
    
    for i, buttonInfo in ipairs(buttonFunctions) do
        local button
        
        if buttonInfo.size == "Long" then
            if currentColumn > 0 then
                currentY = currentY + buttonHeight + buttonSpacing
                currentX = startX
                currentColumn = 0
            end
            
            button = Instance.new("TextButton")
            button.Name = "Button_" .. i
            button.Parent = ScrollingFrame
            button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.BorderColor3 = Color3.fromRGB(0, 100, 255)
            button.Position = UDim2.new(0, currentX, 0, currentY)
            button.Size = UDim2.new(0, buttonWidthLong, 0, buttonHeight)
            button.Font = Enum.Font.SourceSans
            button.Text = buttonInfo.name
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextScaled = true
            button.TextSize = 14.000
            button.TextWrapped = true
            
            currentY = currentY + buttonHeight + buttonSpacing
            currentX = startX
            currentColumn = 0
        else
            button = Instance.new("TextButton")
            button.Name = "Button_" .. i
            button.Parent = ScrollingFrame
            button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            button.BorderColor3 = Color3.fromRGB(0, 100, 255)
            button.Position = UDim2.new(0, currentX, 0, currentY)
            button.Size = UDim2.new(0, buttonWidthNormal, 0, buttonHeight)
            button.Font = Enum.Font.SourceSans
            button.Text = buttonInfo.name
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextScaled = true
            button.TextSize = 14.000
            button.TextWrapped = true
            
            currentX = currentX + buttonWidthNormal + buttonSpacing
            currentColumn = currentColumn + 1
            
            if currentColumn >= maxColumns then
                currentY = currentY + buttonHeight + buttonSpacing
                currentX = startX
                currentColumn = 0
            end
        end
        
        button.MouseButton1Click:Connect(function()
            buttonInfo.func()
        end)
        
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end)
    end
    
    local totalHeight = currentY + buttonHeight + 20
    if currentColumn == 0 then
        totalHeight = currentY + 20
    end
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

function req(a)
    local module = {}
    local b = a
    function module.Axjx7(username)
        getgenv().targetUsername = username
        GUI()
    end
    
    return module
end