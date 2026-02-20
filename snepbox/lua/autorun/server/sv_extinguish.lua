-- https://github.com/MadHouse-Labs/consortium-gm-misc/blob/master/lua/autorun/server/extinguishInWater.lua

function Extinguish(ent)
	ent:EmitSound(Sound("player/flame_out.wav"))
	ent:Extinguish()
end

hook.Add("OnEntityWaterLevelChanged", "extwater_wlchange", function(ent, old, new)
	if new >= 2 and ent:IsOnFire() then Extinguish(ent) end
end)

hook.Add("EntityTakeDamage", "extwater_autoext", function(ent, dmg)
	if ent:WaterLevel() >= 2 and ent:IsOnFire() and dmg:GetDamageType() == DMG_BURN then
    	Extinguish(ent)
		return true
	end
end)
