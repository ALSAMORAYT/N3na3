-- سكربت بروكهافن فقط - ساموراي | @D_hh_313

pcall(function() game.CoreGui.CustomGUI:Destroy() end)

-- رقم ماب بروكهافن الرسمي
local BROOKHAVEN_PLACEID = 4924922222

if game.PlaceId ~= BROOKHAVEN_PLACEID then
    warn("⚠️ هذا السكربت خاص فقط بماب Brookhaven!")
    return
end

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local speedEnabled = false
local flying = false
local speedValue = 50

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "CustomGUI"
gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)
mainFrame.Size = UDim2.new(0, 600, 0, 180)
mainFrame.Position = UDim2.new(0.5, -300, 0.7, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)

local toggleBtn = Instance.new("TextButton", gui)
toggleBtn.Size = UDim2.new(0, 60, 0, 60)
toggleBtn.Position = UDim2.new(1, -70, 0.7, -30)
toggleBtn.Text = "☰"
toggleBtn.TextScaled = true
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
toggleBtn.TextColor3 = Color3.new(1,1,1)
toggleBtn.AutoButtonColor = false
local toggleCorner = Instance.new("UICorner", toggleBtn)
toggleCorner.CornerRadius = UDim.new(0, 15)

toggleBtn.MouseEnter:Connect(function()
    toggleBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
toggleBtn.MouseLeave:Connect(function()
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local function fadeIn(frame)
    frame.Visible = true
    frame.BackgroundTransparency = 1
    TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0}):Play()
    for _, child in pairs(frame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("TextBox") then
            child.TextTransparency = 1
            TweenService:Create(child, tweenInfo, {TextTransparency = 0}):Play()
        end
    end
end

local function fadeOut(frame)
    local tween = TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 1})
    tween:Play()
    for _, child in pairs(frame:GetChildren()) do
        if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("TextBox") then
            TweenService:Create(child, tweenInfo, {TextTransparency = 1}):Play()
        end
    end
    tween.Completed:Wait()
    frame.Visible = false
end

toggleBtn.MouseButton1Click:Connect(function()
    if mainFrame.Visible then
        fadeOut(mainFrame)
    else
        fadeIn(mainFrame)
    end
end)

local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "تروّل Brookhaven"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.TextColor3 = Color3.fromRGB(230, 230, 230)

local trollFrame = Instance.new("Frame", mainFrame)
trollFrame.Size = UDim2.new(0.65, -10, 1, -40)
trollFrame.Position = UDim2.new(0, 10, 0, 35)
trollFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
local trollCorner = Instance.new("UICorner", trollFrame)
trollCorner.CornerRadius = UDim.new(0, 10)

local creditFrame = Instance.new("Frame", mainFrame)
creditFrame.Size = UDim2.new(0.3, -10, 1, -40)
creditFrame.Position = UDim2.new(0.7, 0, 0, 35)
creditFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
local creditCorner = Instance.new("UICorner", creditFrame)
creditCorner.CornerRadius = UDim.new(0, 10)

local divider = Instance.new("Frame", mainFrame)
divider.Size = UDim2.new(0, 3, 1, -40)
divider.Position = UDim2.new(0.68, 0, 0, 35)
divider.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
local dividerCorner = Instance.new("UICorner", divider)
dividerCorner.CornerRadius = UDim.new(0, 2)

local creditLabel = Instance.new("TextLabel", creditFrame)
creditLabel.Size = UDim2.new(1, -10, 0, 50)
creditLabel.Position = UDim2.new(0, 5, 0, 10)
creditLabel.BackgroundTransparency = 1
creditLabel.Text = "المطور: ساموراي\nتليجرام: @D_hh_313"
creditLabel.Font = Enum.Font.SourceSansBold
creditLabel.TextSize = 22
creditLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
creditLabel.TextWrapped = true
creditLabel.TextYAlignment = Enum.TextYAlignment.Top

local buttonY = 10
local function createTrollButton(text, parent, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, buttonY)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.TextColor3 = Color3.fromRGB(230, 230, 230)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 20
    btn.Text = text
    btn.AutoButtonColor = false
    btn.ClipsDescendants = true
    btn.BorderSizePixel = 0
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)
    btn.MouseButton1Click:Connect(callback)
    buttonY = buttonY + 50
    return btn
end

local speedBox = Instance.new("TextBox", trollFrame)
speedBox.Size = UDim2.new(0, 80, 0, 35)
speedBox.Position = UDim2.new(0.55, 0, 0, 10)
speedBox.PlaceholderText = "سرعة (10-200)"
speedBox.ClearTextOnFocus = false
speedBox.Text = tostring(50)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
local speedBoxCorner = Instance.new("UICorner", speedBox)
speedBoxCorner.CornerRadius = UDim.new(0, 8)

speedBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local val = tonumber(speedBox.Text)
        if val and val >= 10 and val <= 200 then
            speedValue = val
            if speedEnabled then
                char.Humanoid.WalkSpeed = speedValue
            end
        else
            speedBox.Text = tostring(speedValue)
        end
    end
end)

local speedBtn = createTrollButton("⚡ تفعيل السرعة", trollFrame, function()
    speedEnabled = not speedEnabled
    if speedEnabled then
        char.Humanoid.WalkSpeed = speedValue
        speedBtn.Text = "⚡ إيقاف السرعة"
    else
        char.Humanoid.WalkSpeed = 16
        speedBtn.Text = "⚡ تفعيل السرعة"
    end
end)

local bp, bg
local flying = false
local flyBtn = createTrollButton("🚀 طيران", trollFrame, function()
    flying = not flying
    if flying then
        bp = Instance.new("BodyPosition", hrp)
        bp.MaxForce = Vector3.new(1e9, 1e9, 1e9)
        bp.Position = hrp.Position
        bg = Instance.new("BodyGyro", hrp)
        bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
        bg.CFrame = hrp.CFrame

        spawn(function()
            while flying do
                local moveVector = Vector3.new()
                if UIS:IsKeyDown(Enum.KeyCode.W) then
                    moveVector = moveVector + workspace.CurrentCamera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.S) then
                    moveVector = moveVector - workspace.CurrentCamera.CFrame.LookVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.A) then
                    moveVector = moveVector - workspace.CurrentCamera.CFrame.RightVector
                end
                if UIS:IsKeyDown(Enum.KeyCode.D) then
                    moveVector = moveVector + workspace.CurrentCamera.CFrame.RightVector
                end
                if moveVector.Magnitude > 0 then
                    bp.Position = bp.Position + (moveVector.Unit * (speedValue/10))
                end
                bg.CFrame = workspace.CurrentCamera.CFrame
                wait()
            end
        end)
    else
        if bp then bp:Destroy() end
        if bg then bg:Destroy() end
    end
end)

createTrollButton("📢 سبام شات", trollFrame, function()
    spawn(function()
        for i = 1, 50 do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("RGPHUBX Troll 😈 "..i, "All")
            wait(0.2)
        end
    end)
end)

createTrollButton("🧍 تلبورت للاعب", trollFrame, function()
    if gui:FindFirstChild("TeleportInput") then return end

    local inputBox = Instance.new("TextBox", gui)
    inputBox.Name = "TeleportInput"
    inputBox.Size = UDim2.new(0, 250, 0, 40)
    inputBox.Position = UDim2.new(0.5, -125, 0.5, -20)
    inputBox.PlaceholderText = "اكتب اسم اللاعب للتلبورت"
    inputBox.Text = ""
    inputBox.ClearTextOnFocus = true
    inputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    inputBox.TextColor3 = Color3.fromRGB(220, 220, 220)
    inputBox.Font = Enum.Font.SourceSansBold
    inputBox.TextScaled = true
    local inputCorner = Instance.new("UICorner", inputBox)
    inputCorner.CornerRadius = UDim.new(0, 10)

    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local targetName = inputBox.Text
            local targetPlayer = game.Players:FindFirstChild(targetName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0)
            end
            inputBox:Destroy()
        end
    end)
end)
