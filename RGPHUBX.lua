-- RGPHUBX سكربت واجهة لماب Brookhaven -- تصميم: ساموراي

-- التأكد من أن اللاعب في ماب Brookhaven
if game.PlaceId ~= 4924922222 then return end

-- حذف العناصر إذا كانت موجودة مسبقًا
pcall(function()
	if game.CoreGui:FindFirstChild("RGPHUBX_GUI") then
		game.CoreGui.RGPHUBX_GUI:Destroy()
	end
end)

-- إنشاء الشاشة الرئيسية
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "RGPHUBX_GUI"

-- الزر العائم
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = "☰"
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Parent = ScreenGui

-- واجهة السكربت
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- اسم السكربت
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -40, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "RGPHUBX"
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame

-- زر الإغلاق ✖️ بجانب العنوان
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.Text = "✖"
CloseBtn.TextColor3 = Color3.new(1, 1, 1)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextScaled = true
CloseBtn.Parent = MainFrame

-- رسالة التأكيد
local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Size = UDim2.new(0, 250, 0, 150)
ConfirmFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ConfirmFrame.Visible = false
ConfirmFrame.Parent = ScreenGui

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Size = UDim2.new(1, 0, 0.6, 0)
ConfirmText.Position = UDim2.new(0, 0, 0, 0)
ConfirmText.BackgroundTransparency = 1
ConfirmText.Text = "هل أنت متأكد من إغلاق السكربت؟"
ConfirmText.TextColor3 = Color3.new(1, 1, 1)
ConfirmText.TextScaled = true
ConfirmText.Font = Enum.Font.GothamBold
ConfirmText.Parent = ConfirmFrame

local YesBtn = Instance.new("TextButton")
YesBtn.Size = UDim2.new(0.45, 0, 0.3, 0)
YesBtn.Position = UDim2.new(0.05, 0, 0.65, 0)
YesBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
YesBtn.Text = "نعم"
YesBtn.TextColor3 = Color3.new(1, 1, 1)
YesBtn.Font = Enum.Font.GothamBold
YesBtn.TextScaled = true
YesBtn.Parent = ConfirmFrame

local NoBtn = Instance.new("TextButton")
NoBtn.Size = UDim2.new(0.45, 0, 0.3, 0)
NoBtn.Position = UDim2.new(0.5, 0, 0.65, 0)
NoBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
NoBtn.Text = "لا"
NoBtn.TextColor3 = Color3.new(1, 1, 1)
NoBtn.Font = Enum.Font.GothamBold
NoBtn.TextScaled = true
NoBtn.Parent = ConfirmFrame

-- زر الحقوق (صورة ثابتة يمين فوق)
local Credit = Instance.new("ImageLabel")
Credit.Size = UDim2.new(0, 100, 0, 100)
Credit.Position = UDim2.new(1, -110, 0, 10)
Credit.BackgroundTransparency = 1
Credit.Image = "rbxthumb://type=Asset&id=110378315726633&w=420&h=420"
Credit.Parent = MainFrame

--[[
--------------- الإضافات الجديدة: أزرار جانبية + عرض المحتوى ------------------
--]]

-- إطار الأزرار الجانبية (يسار داخل MainFrame)
local SideButtonsFrame = Instance.new("Frame")
SideButtonsFrame.Size = UDim2.new(0, 100, 1, -60) -- ناقص ارتفاع العنوان (40) + هامش (20)
SideButtonsFrame.Position = UDim2.new(0, 0, 0, 50)
SideButtonsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideButtonsFrame.Parent = MainFrame

-- إطار المحتوى
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -100, 1, -60)
ContentFrame.Position = UDim2.new(0, 100, 0, 50)
ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ContentFrame.Parent = MainFrame

-- دالة توهج RGB للنصوص
local function rgbGlow(label)
	coroutine.wrap(function()
		local hue = 0
		while true do
			label.TextColor3 = Color3.fromHSV(hue, 1, 1)
			hue = (hue + 0.01) % 1
			wait(0.05)
		end
	end)()
end

-- إنشاء زر داخل الجانب
local function createSideButton(text)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, -20, 0, 40)
	btn.Position = UDim2.new(0, 10, 0, 0) -- سيتم تعديل Position ديناميكيًا لاحقًا
	btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.TextColor3 = Color3.new(1, 1, 1)
	btn.Parent = SideButtonsFrame
	rgbGlow(btn)
	return btn
end

-- ترتيب الأزرار عمودياً (Layout)
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.Parent = SideButtonsFrame

-- إنشاء الأزرار المطلوبة
local rightsBtn = createSideButton("الحقوق")
local scriptsBtn = createSideButton("سكربتات")

-- دالة لتفريغ المحتوى وعرض محتوى الحقوق
local function showRightsContent()
	ContentFrame:ClearAllChildren()

	-- الصورة
	local img = Instance.new("ImageLabel")
	img.Size = UDim2.new(0, 100, 0, 100)
	img.Position = UDim2.new(0.5, -50, 0, 10)
	img.BackgroundTransparency = 1
	img.Image = "rbxthumb://type=Asset&id=110378315726633&w=420&h=420"
	img.Parent = ContentFrame

	-- نص الحقوق مع التوهج
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 0, 60)
	label.Position = UDim2.new(0, 10, 0, 120)
	label.BackgroundTransparency = 1
	label.Text = "1️⃣ جميع الحقوق محفوظة\n2️⃣ مصنوع بواسطة: Prov_development@"
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.TextWrapped = true
	rgbGlow(label)
	label.Parent = ContentFrame
end

-- دالة عرض محتوى السكربتات
local function showScriptsContent()
	ContentFrame:ClearAllChildren()

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -20, 0, 40)
	label.Position = UDim2.new(0, 10, 0, 10)
	label.BackgroundTransparency = 1
	label.Text = "🛠️ التطوير قريباً..."
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	rgbGlow(label)
	label.Parent = ContentFrame
end

-- ربط الأزرار بالوظائف
rightsBtn.MouseButton1Click:Connect(showRightsContent)
scriptsBtn.MouseButton1Click:Connect(showScriptsContent)

-- الزر يفتح/يغلق القائمة
ToggleButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = not MainFrame.Visible
	if MainFrame.Visible then
		showRightsContent() -- يظهر الحقوق بشكل تلقائي عند الفتح
	end
end)

-- زر ✖ يفتح التأكيد
CloseBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = true
end)

-- نعم: إغلاق السكربت
YesBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	ConfirmFrame:Destroy()
end)

-- لا: إخفاء التأكيد
NoBtn.MouseButton1Click:Connect(function()
	ConfirmFrame.Visible = false
end)
