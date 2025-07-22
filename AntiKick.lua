--[[
    AntiKick Protection Script v1.1
    المطور: ساموراي ⚔️
    الوصف: حماية ذكية من الطرد + رسائل شاشة عند التشغيل والطرد
    تواصل: @Prov_development
]]

-- تفعيل الرسائل على الشاشة
function showMessage(title, text, time)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = time or 5
    })
end

-- رسالة ترحيب عند التشغيل
showMessage("✅ الحماية مفعلة", "تم تفعيل حماية الطرد بواسطة ساموراي ⚔️", 6)
print("✅ تم تفعيل AntiKick بنجاح")

-- منع الطرد مع رسالة تحذير
local success, mt = pcall(getrawmetatable, game)
if success and mt then
    setreadonly(mt, false)
    local oldNamecall = mt.__namecall

    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if tostring(self) == tostring(game.Players.LocalPlayer) and method == "Kick" then
            warn("🚫 تم منع محاولة طرد اللاعب!")
            showMessage("🚨 تحذير", "🚫 تم منع محاولة طردك من السيرفر!", 6)
            return nil
        end
        return oldNamecall(self, ...)
    end)
end
