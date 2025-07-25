local allowedPlaceId = 4924922222

if game.PlaceId ~= allowedPlaceId then
    warn("هذا السكربت يعمل فقط في لعبة بروك هافن!")
    return
end

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "RGPHUBX_UI"

local scriptActivated = false  -- هل السكربت شغال؟

-- وظيفة ألوان RGB متدرجة
local function rainbow()
    local t = tick() * 2
    return Color3.fromHSV(t % 1, 1, 1)
end

-- زر القفل / الفتح (Toggle)
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
borderFrame.Size = UDim2.new(1, -140, 0, 400)  -- تقريبًا يغطي العرض عشان القائمة عريضة
borderFrame.Position = UDim2.new(0, 70, 0, 50)
borderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
borderFrame.BorderSizePixel = 0

spawn(function()
    while true do
        borderFrame.BackgroundColor3 = rainbow()
        wait(0.1)
    end
end)

-- القائمة الرئيسية (مستطيل عرضي)
local main = Instance.new("Frame", gui)
main.Name = "MainMenu"
main.Size = UDim2.new(1, -150, 0, 400) -- عرض تقريبًا مثل الشاشة مع هامش 150 بكسل (زر الصورة + هامش)
main.Position = UDim2.new(0, 70, 0, 50)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BorderSizePixel = 0
main.Visible = false
main.ZIndex = borderFrame.ZIndex + 1

-- اسم السكربت فوق القائمة (خارج main)
local scriptNameLabel = Instance.new("TextLabel", gui)
scriptNameLabel.Size = UDim2.new(1, -150, 0, 40)
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
infoBtn.TextStrokeTransparency = 0
infoBtn.AutoButtonColor = false

setupButtonRGB(infoBtn)

-- زر الحقوق داخل القائمة
local rightsBtn = Instance.new("TextButton", main)
rightsBtn.Size = UDim2.new(0, 200, 0, 40)
rightsBtn.Position = UDim2.new(0, 240, 0, 60)  -- على يمين زر معلومات اللاعب
rightsBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
rightsBtn.BorderSizePixel = 3
rightsBtn.Font = Enum.Font.GothamBold
rightsBtn.TextSize = 20
rightsBtn.Text = "الحقوق"
rightsBtn.TextStrokeTransparency = 0
rightsBtn.AutoButtonColor = false

setupButtonRGB(rightsBtn)

-- زر خروج يغلق السكربت (يوقف عمل الواجهة نهائي)
local exitBtn = Instance.new("TextButton", main)
exitBtn.Size = UDim2.new(0, 100, 0, 40)
exitBtn.Position = UDim2.new(1, -110, 0, 10) -- فوق يمين القائمة
exitBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
exitBtn.BorderSizePixel = 3
exitBtn.Font = Enum.Font.GothamBold
exitBtn.TextSize = 20
exitBtn.Text = "خروج"
exitBtn.TextStrokeTransparency = 0
exitBtn.AutoButtonColor = false

setupButtonRGB(exitBtn)

-- بطاقة معلومات اللاعب (مخفية بالافتراض)
local infoFrame = Instance.new("Frame", main)
infoFrame.Size = UDim2.new(0.45, -20, 0, 300)
infoFrame.Position = UDim2.new(0, 10, 0, 110)
infoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
infoFrame.BorderSizePixel = 3
infoFrame.Visible = false

spawn(function()
    while true do
        infoFrame.BorderColor3 = rainbow()
        wait(0.1)
    end
end)

-- إطار الحقوق (مخفي افتراضياً)
local rightsFrame = Instance.new("Frame", main)
rightsFrame.Size = UDim2.new(0.45, -20, 0, 300)
rightsFrame.Position = UDim2.new(0.5, 10, 0, 110)
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
rightsText.Size = UDim2.new(1, -20, 0, 200)
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

-- زر جوين داخل حقوق
local joinBtn = Instance.new("TextButton", rightsFrame)
joinBtn.Size = UDim2.new(0, 100, 0, 30)
joinBtn.Position = UDim2.new(0.5, -50, 1, -40)
joinBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
joinBtn.BorderSizePixel = 0
joinBtn.Font = Enum.Font.GothamBold
joinBtn.TextSize = 18
joinBtn.Text = "جوين"
joinBtn.TextColor3 = Color3.new(1,1,1)
joinBtn.AutoButtonColor = true

joinBtn.MouseButton1Click:Connect(function()
    print("رابط القناة: https://t.me/Prov_development")
end)

-- أزرار إظهار/إخفاء الإطارات
infoBtn.MouseButton1Click:Connect(function()
    infoFrame.Visible = not infoFrame.Visible
    if infoFrame.Visible then
        rightsFrame.Visible = false
    end
end)

rightsBtn.MouseButton1Click:Connect(function()
    rightsFrame.Visible = not rightsFrame.Visible
    if rightsFrame.Visible then
        infoFrame.Visible = false
    end
end)

-- زر خروج يغلق السكربت
exitBtn.MouseButton1Click:Connect(function()
    main.Visible = false
    infoFrame.Visible = false
    rightsFrame.Visible = false
    scriptActivated = false
    -- تعطيل زر التoggle لمنع فتح الواجهة بعد الخروج
    toggle.Active = false
    toggle.AutoButtonColor = false
    toggle.ImageTransparency = 0.5
    -- رسالة خروج للشات
    player:Kick("تم خروجك من سكربت RGPHUBX") -- أو تقدر تحط أي فعل ثاني بدل الطرد
end)

-- تعديل وظيفة زر التoggle: يفتح القائمة فقط إذا السكربت مفعل
toggle.MouseButton1Click:Connect(function()
    if scriptActivated then
        main.Visible = not main.Visible
    end
end)

-- عند بداية تفعيل السكربت
scriptActivated = true
main.Visible = true

-- رسالة في الشات تلقائية عند التفعيل
game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
    Text = "تم تفعيل سكربت RGPHUBX 1.0 المطور ساموراي ✅";
    Color = Color3.new(0,1,0);
    Font = Enum.Font.SourceSansBold;
    FontSize = Enum.FontSize.Size24;
})

-- حذف اسم السكربت والمطور فوق رأس اللاعب (ما أضفتها بناءً على طلبك)
