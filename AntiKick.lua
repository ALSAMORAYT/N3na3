local mt = getrawmetatable(game)
setreadonly(mt, false)

local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()

    if self == game:GetService("Players").LocalPlayer and method == "Kick" then
        return warn("🛡️ تم منع محاولة الطرد")
    end

    return namecall(self, unpack(args))
end)
