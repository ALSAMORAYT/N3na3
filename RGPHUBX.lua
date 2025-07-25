local allowedPlaceId = 4924922222

if game.PlaceId ~= allowedPlaceId then
    warn("هذا السكربت يعمل فقط في لعبة بروك هافن!")
    return
end

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "RGPHUBX_UI"

-- وظيفة ألوان RGB متدرجة
local function rainbow()
    local t = tick() * 2
    return Color3.fromHSV(t % 1, 1, 1)
end

-- زر القفل / الفتح
local toggle = Instance.new("ImageButton", gui)
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Position = UDim2.new(0, 10, 0, 10)
toggle.Image = "rbxassetid://88122625843089"
toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
toggle.BorderSizePixel = 3
toggle.AutoButtonColor = false

spawn(function()
    while true do
        toggle.BorderColor3 = rainbow()
        wait(0.1)
    end
end)

-- إطار خارجي (RGB) حول القائمة
local borderFrame = Instance.new("Frame", gui)
borderFrame.Name = "BorderFrame"
borderFrame.Size = UDim2.new(0, 254, 0, 404)  -- أكبر من القائمة بـ4 بكسل لكل جانب
borderFrame.Position = UDim2.new(0, 68, 0, 48) -- 2 بكسل فوق ويسار القائمة
borderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
borderFrame.BorderSizePixel = 0

spawn(function()
    while true do
        borderFrame.BackgroundColor3 = rainbow()
        wait(0.1)
    end
end)

-- القائمة الرئيسية (مستطيل طولي) بدون إطار داخلي
local main = Instance.new("Frame", gui)
main.Name = "MainMenu"
main.Size = UDim2.new(0, 250, 0, 400)
main.Position = UDim2.new(0, 70, 0, 50)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Visible = false
main.ZIndex = borderFrame.ZIndex + 1

-- اسم السكربت فوق القائمة (خارج main)
local scriptNameLabel = Instance.new("TextLabel", gui)
scriptNameLabel.Size = UDim2.new(0, 250, 0, 40)
scriptNameLabel.Position = UDim2.new(0, 70, 0, 10)
scriptNameLabel.BackgroundTransparency = 1
scriptNameLabel.Font = Enum.Font.GothamBold
scriptNameLabel.TextSize = 28
scriptNameLabel.Text = "RGPHUBX 1.0"
scriptNameLabel.TextColor3 = Color3.new(1,1,1)
scriptNameLabel.TextStrokeTransparency = 0

spawn(function()
    while true do
        scriptNameLabel.TextColor3 = rainbow()
        wait(0.1)
    end
end)

-- دالة لتفعيل تأثير RGB على الأزرار (نص وحدود)
local function setupButtonRGB(button)
    spawn(function()
        while true do
            local c = rainbow()
            button.BorderColor3 = c
            button.TextColor3 = c
            wait(0.1)
        end
    end)
end

-- زر معلومات اللاعب داخل القائمة
local infoBtn = Instance.new("TextButton", main)
infoBtn.Size = UDim2.new(0, 200, 0, 40)
infoBtn.Position = UDim2.new(0, 25, 0, 60)
infoBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
infoBtn.BorderSizePixel = 3
infoBtn.Font = Enum.Font.GothamBold
infoBtn.TextSize = 20
infoBtn.Text = "معلومات اللاعب"
infoBtn.TextColor3 = Color3.new(1,1,1)
infoBtn.TextStrokeTransparency = 0
infoBtn.AutoButtonColor = false

setupButtonRGB(infoBtn)

-- زر الحقوق داخل القائمة
local rightsBtn = Instance.new("TextButton", main)
rightsBtn.Size = UDim2.new(0, 200, 0, 40)
rightsBtn.Position = UDim2.new(0, 25, 0, 110)
rightsBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
rightsBtn.BorderSizePixel = 3
rightsBtn.Font = Enum.Font.GothamBold
rightsBtn.TextSize = 20
rightsBtn.Text = "الحقوق"
rightsBtn.TextColor3 = Color3.new(1,1,1)
rightsBtn.TextStrokeTransparency = 0
rightsBtn.AutoButtonColor = false

setupButtonRGB(rightsBtn)

-- بطاقة معلومات اللاعب (مخفية بالافتراض)
local infoFrame = Instance.new("Frame", main)
infoFrame.Size = UDim2.new(1, -20, 0, 200)
infoFrame.Position = UDim2.new(0, 10, 0, 160)
infoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
infoFrame.BorderSizePixel = 3
infoFrame.Visible = false

spawn(function()
    while true do
        infoFrame.BorderColor3 = rainbow()
        wait(0.1)
    end
end)

-- إطار الحقوق (مخفية بالافتراض)
local rightsFrame = Instance.new("Frame", main)
rightsFrame.Size = UDim2.new(1, -20, 0, 120)
rightsFrame.Position = UDim2.new(0, 10, 0, 370)
rightsFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
rightsFrame.BorderSizePixel = 3
rightsFrame.Visible = false

spawn(function()
    while true do
        rightsFrame.BorderColor3 = rainbow()
        wait(0.1)
    end
end)

-- نصوص معلومات اللاعب
local thumbUrl = game.Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
local playerImage = Instance.new("ImageLabel", infoFrame)
playerImage.Size = UDim2.new(0, 100, 0, 100)
playerImage.Position = UDim2.new(0, 10, 0, 10)
playerImage.BackgroundTransparency = 1
playerImage.Image = thumbUrl
playerImage.ScaleType = Enum.ScaleType.Fit
playerImage.BorderSizePixel = 2
playerImage.BorderColor3 = Color3.new(1,1,1)

local function createInfoText(parent, posY, text)
    local label = Instance.new("TextLabel", parent)
    label.Size = UDim2.new(1, -120, 0, 25)
    label.Position = UDim2.new(0, 120, 0, posY)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.Gotham
    label.TextSize = 18
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.TextStrokeTransparency = 0
    return label
end

local nameLabel = createInfoText(infoFrame, 10, "الاسم: " .. player.Name)
local idLabel = createInfoText(infoFrame, 40, "UserId: " .. player.UserId)
local joinLabel = createInfoText(infoFrame, 70, "Joined: منذ " .. tostring(player.AccountAge) .. " يوم")
local pingLabel = createInfoText(infoFrame, 100, "Ping (تقريبي): ...")
local fpsLabel = createInfoText(infoFrame, 130, "FPS: ...")

spawn(function()
    local lastTime = tick()
    local frameCount = 0
    local pingApprox = 0

    RunService.RenderStepped:Connect(function()
        frameCount += 1
        local currentTime = tick()
        local delta = currentTime - lastTime
        if delta >= 1 then
            local fps = math.floor(frameCount / delta)
            fpsLabel.Text = "FPS: " .. tostring(fps)
            pingApprox = math.floor(delta * 1000)
            pingLabel.Text = "Ping (تقريبي): " .. tostring(pingApprox) .. " ms"
            lastTime = currentTime
            frameCount = 0
        end
    end)
end)

spawn(function()
    while true do
        local c = rainbow()
        nameLabel.TextColor3 = c
        idLabel.TextColor3 = c
        joinLabel.TextColor3 = c
        pingLabel.TextColor3 = c
        fpsLabel.TextColor3 = c
        wait(0.1)
    end
end)

-- نص حقوق القناة داخل الإطار
local rightsText = Instance.new("TextLabel", rightsFrame)
rightsText.Size = UDim2.new(1, -20, 0, 80)
rightsText.Position = UDim2.new(0, 10, 0, 10)
rightsText.BackgroundTransparency = 1
rightsText.TextColor3 = Color3.new(1,1,1)
rightsText.Font = Enum.Font.Gotham
rightsText.TextSize = 16
rightsText.TextWrapped = true
rightsText.Text = [[
رابط القناة:
https://t.me/Prov_development

اضغط زر "جوين" للانضمام!
]]

-- زر جوين يفتح رابط التليجرام
local joinBtn = Instance.new("TextButton", rightsFrame)
joinBtn.Size = UDim2.new(0, 100, 0, 30)
joinBtn.Position = UDim2.new(0.5, -50, 0, 100)
joinBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
joinBtn.BorderSizePixel = 0
joinBtn.Font = Enum.Font.GothamBold
joinBtn.TextSize = 18
joinBtn.Text = "جوين"
joinBtn.TextColor3 = Color3.new(1,1,1)
joinBtn.AutoButtonColor = true

joinBtn.MouseButton1Click:Connect(function()
    -- فتح الرابط في المتصفح (إذا دعمها المستخدم)
    local HttpService = game:GetService("HttpService")
    local success, result = pcall(function()
        return game:GetService("TeleportService"):TeleportToPlaceInstance(0, "", player)
    end)
    -- بدلاً من TeleportService (مش دايركت فتح رابط)، الأفضل تستخدم رسائل توجيهية
    -- لكن روبلوكس لا يدعم فتح روابط خارجية من داخل اللعبة فعلياً
    -- لذا نكتفي بطباعة الرابط
    print("رابط القناة: https://t.me/Prov_development")
end)

-- أزرار إظهار/إخفاء الإطارات
infoBtn.MouseButton1Click:Connect(function()
    infoFrame.Visible = not infoFrame.Visible
    rightsFrame.Visible = false
end)

rightsBtn.MouseButton1Click:Connect(function()
    rightsFrame.Visible = not rightsFrame.Visible
    infoFrame.Visible = false
end)

-- زر القفل لفتح وإغلاق القائمة
toggle.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
    if not main.Visible then
        infoFrame.Visible = false
        rightsFrame.Visible = false
    end
end)

-- إضافة BillboardGui فوق رأس اللاعب
local character = player.Character or player.CharacterAdded:Wait()
local head = character:WaitForChild("Head")

local function addBillboard()
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = head

    local frame = Instance.new("Frame", billboard)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 3
    frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

    local nameLabel = Instance.new("TextLabel", frame)
    nameLabel.Size = UDim2.new(1, -10, 0.5, -5)
    nameLabel.Position = UDim2.new(0, 5, 0, 5)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextSize = 18
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Text = "RGPHUBX 1.0"

    local bioLabel = Instance.new("TextLabel", frame)
    bioLabel.Size = UDim2.new(1, -10, 0.5, -5)
    bioLabel.Position = UDim2.new(0, 5, 0.5, 0)
    bioLabel.BackgroundTransparency = 1
    bioLabel.Font = Enum.Font.Gotham
    bioLabel.TextSize = 14
    bioLabel.TextColor3 = Color3.new(1, 1, 1)
    bioLabel.TextStrokeTransparency = 0.5
    bioLabel.Text = "المطور: ساموراي"

    spawn(function()
        while true do
            local hue = tick() * 2
            local color = Color3.fromHSV(hue % 1, 1, 1)
            frame.BorderColor3 = color
            wait(0.1)
        end
    end)
end

addBillboard()
