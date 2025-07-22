--[[
    Script Name: AntiKick Protection
    Author: ساموراي ⚔️
    Version: 1.0.3
    Description: حماية ذكية لمنع الطرد من السيرفر في روبلوكس
    Contact: Telegram @Prov_development

    Revisions:
       - 1.0.3: تحسين منع الطرد ومنع الطرد المباشر عن طريق تغيير __namecall
       - 1.0.2: إضافة تحذير يظهر عند محاولة الطرد
       - 1.0.1: إصلاح مشكلة في تعديل raw metatable
       - 1.0.0: النسخة الأولى من السكربت
]]

local mt = getrawmetatable(game)
setreadonly(mt, false)

local oldNamecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if self == game:GetService("Players").LocalPlayer and method == "Kick" then
        warn("🛡️ تم منع محاولة الطرد")
        return nil
    end
    return oldNamecall(self, ...)
end)

print("✅ تم تفعيل حماية AntiKick v1.0.3 - بواسطة ساموراي ⚔️")
