if game.PlaceId ~= 4924922222 then
    game.StarterGui:SetCore("SendNotification", {
        Title = "❌ غير مدعوم",
        Text = "هذا السكربت مخصص فقط لماب Brookhaven!",
        Duration = 5
    })
    return
end

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "RGPHUBX"

-- زر فتح القائمة (فيه صورة)
local openButton = Instance.new("ImageButton", ScreenGui)
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0, 20, 0.5, -25)
openButton.Image = "rbxassetid://16112415134"
openButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
openButton.BorderSizePixel = 0

-- القائمة الرئيسية
local mainFrame = Instance.new("Frame", ScreenGui)
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.Visible = false

-- حواف RGB
local UICorner = Instance.new("UICorner", mainFrame)
UICorner.CornerRadius = UDim.new(0, 0)

local UIStroke = Instance.new("UIStroke", mainFrame)
UIStroke.Thickness = 4
UIStroke.Color = Color3.fromRGB(255, 0, 0)

-- مؤثر RGB للإطار
coroutine.wrap(function()
    local h = 0
    while true do
        UIStroke.Color = Color3.fromHSV(h, 1, 1)
        h = (h + 0.01) % 1
        wait()
    end
end)()

-- عنوان
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "🎮 RGPHUBX | Brookhaven"
title.TextSize = 24
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundTransparency = 1

-- تأثير RGB على النص
coroutine.wrap(function()
    local h = 0
    while true do
        title.TextColor3 = Color3.fromHSV(h, 1, 1)
        h = (h + 0.01) % 1
        wait()
    end
end)()

-- زر الخروج (يغلق القائمة فقط)
local closeBtn = Instance.new("TextButton", mainFrame)
closeBtn.Size = UDim2.new(0, 100, 0, 40)
closeBtn.Position = UDim2.new(0.9, -110, 0, 10)
closeBtn.Text = "خروج"
closeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
closeBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextSize = 20

-- زر الحقوق
local creditBtn = Instance.new("TextButton", mainFrame)
creditBtn.Size = UDim2.new(0, 120, 0, 40)
creditBtn.Position = UDim2.new(0, 20, 0, 60)
creditBtn.Text = "📜 الحقوق"
creditBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
creditBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
creditBtn.Font = Enum.Font.Gotham
creditBtn.TextSize = 20

-- نافذة الحقوق
local creditFrame = Instance.new("Frame", mainFrame)
creditFrame.Size = UDim2.new(0, 300, 0, 150)
creditFrame.Position = UDim2.new(0.5, -150, 0.5, -75)
creditFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
creditFrame.Visible = false
Instance.new("UICorner", creditFrame)

local creditText = Instance.new("TextLabel", creditFrame)
creditText.Size = UDim2.new(1, -10, 1, -10)
creditText.Position = UDim2.new(0, 5, 0, 5)
creditText.Text = "الحقوق محفوظة لـ RGPHUBX\nBy: ساموراي 🥷"
creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
creditText.Font = Enum.Font.GothamSemibold
creditText.TextSize = 18
creditText.BackgroundTransparency = 1
creditText.TextWrapped = true
creditText.TextYAlignment = Enum.TextYAlignment.Center

-- معلومات اللاعب
local player = game.Players.LocalPlayer
local info = Instance.new("TextLabel", mainFrame)
info.Size = UDim2.new(0, 300, 0, 50)
info.Position = UDim2.new(0, 20, 1, -60)
info.BackgroundTransparency = 1
info.TextColor3 = Color3.fromRGB(255, 255, 255)
info.TextSize = 18
info.Font = Enum.Font.GothamSemibold
info.Text = "👤 "..player.Name.." | UserId: "..player.UserId

-- وظائف الأزرار
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

creditBtn.MouseButton1Click:Connect(function()
    creditFrame.Visible = not creditFrame.Visible
end)
