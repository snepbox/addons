-- https://github.com/MadHouse-Labs/consortium-gm-misc/blob/master/lua/autorun/server/sv_owMyFuckingEars.lua

hook.Add("OnDamagedByExplosion", "owMyFuckingEars", function()
  return true
end)
