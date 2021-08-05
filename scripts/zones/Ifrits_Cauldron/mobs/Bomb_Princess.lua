-----------------------------------
-- Area: Ifrit's Cauldron
--   NM: Bomb Princess
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.EXP_BONUS, -100)
    mob:setMobMod(xi.mobMod.GIL_BONUS, -100)
    mob:setMobMod(xi.mobMod.NO_DROPS, 1)
    mob:setMod(xi.mod.STUNRES, 50)
end

entity.onMobFight = function(mob, target)
    if mob:getBattleTime() > 10 then
        mob:useMobAbility(511)
    end
end

entity.onMobDeath = function(mob, player, isKiller)
end

return entity