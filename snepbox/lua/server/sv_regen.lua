-- https://github.com/MadHouse-Labs/consortium-gm-misc/blob/master/lua/autorun/server/sv_regen.lua

hook.Add("PlayerInitialSpawn", "Regen_PlayerInitialSpawn", function(ply)
	ply.regen = {}
	ply.regen.lastDamage = 0
end)

hook.Add("PlayerHurt", "Regen_PlayerHurt", function(ply)
  ply.regen.lastDamage = CurTime()
end)

timer.Create("Regen", 5, 0, function()
  local time = CurTime()

  for k, v in pairs(player.GetHumans()) do
    if v:Alive() && time - v.regen.lastDamage > 10 then v:SetHealth(math.min(v:Health() + 5, 100)) end
  end
end)
