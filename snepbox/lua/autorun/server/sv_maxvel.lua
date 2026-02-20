-- https://github.com/MadHouse-Labs/consortium-gm-misc/blob/master/lua/autorun/server/sv_maxvel.lua

local function changeMaxVel()
	local t=physenv.GetPerformanceSettings()
	if t then
		timer.Remove("changeMaxVel")
		t.MaxVelocity = 30000
		physenv.SetPerformanceSettings(t)
	end
end

timer.Create("changeMaxVel", 5, 0, changeMaxVel)